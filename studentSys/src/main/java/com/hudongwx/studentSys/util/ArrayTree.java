package com.hudongwx.studentSys.util;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

/**
 * Created by wuhongxu on 2016/9/4 0004.
 */
//二叉链存储方式实现的树
public class ArrayTree<T extends TreeNode> {
    private List<T> tree;
    //这里得到的是复制，不能操作树
    public List<T> getTree(){
        List<T> list = new ArrayList<T>(tree);
        return list;
    }
    public ArrayTree(){
        tree = new ArrayList<T>();
    }
    //通过此接口实现额外对node的操作
    public interface onOverListener<T> {
        void onOver(T node, T parent, T nextSibling);
    }
    public interface onCheckListener<T> {
        boolean onCheck(T node, T leftNode);
    }
    public List<T> initTree(T root){
        clearTree();
        root.setChildCount(0);
        root.setDegree(0);
        tree.add(root);
        return tree;
    }
    public void destroyTree(){
        tree = null;
    }
    public void clearTree(){
        if(!tree.isEmpty())
            tree.clear();
    }
    public boolean isEmpty(){
        if(null != tree)
            return tree.isEmpty();
        return false;
    }
    public T root(){
        if(!tree.isEmpty()){
            T t = tree.get(0);
            while (t.getParent() != null){
                t = (T) t.getParent();
            }
            return t;
        }
        return null;
    }
    public T value(T node){
        if(!tree.isEmpty() && tree.contains(node))
            return node;
        return null;
    }
    public void assign(T node,T newNode){
        if(!tree.isEmpty() && tree.contains(node))
            node = newNode;
    }
    public T getParent(T node){
        if(tree.isEmpty() && tree.contains(node))
            return (T)node.getParent();
        return null;
    }
    public T getLeftChild(T node){
        if(tree.isEmpty() && tree.contains(node))
            return (T)node.getLeftChild();
        return null;
    }
    public T getNextSibling(T node){
        if(tree.isEmpty() && tree.contains(node))
            return (T)node.getNextSibling();
        return null;
    }
    //为了通用，没有为node的做多余操作，所以使用接口来让调用者实现
    public boolean insertChild(T node,T parent,T leftSibling,onOverListener opn){
        if(null == parent)
            return false;
        if(tree.contains(node) || !tree.contains(parent))
            return false;
        if(leftSibling!=null && !tree.contains(leftSibling)){
            return false;
        }
        parent.setChildCount(parent.getChildCount()+1);
        node.setDegree(parent.getDegree()+1);
        node.setParent(parent);
        if(null != leftSibling){
            T tmp = (T)leftSibling.getNextSibling();
            leftSibling.setNextSibling(node);
            node.setNextSibling(tmp);
        }else{
            TreeNode leftChild = parent.getLeftChild();
            parent.setLeftChild(node);
            node.setNextSibling(leftChild);
        }
        if(null != opn)
            opn.onOver(node,parent,leftSibling);
        tree.add(node);
        return true;
    }
    public boolean insertChild(T node,T parent,int pos,onOverListener ovl){
        if(null == parent)
            return false;
        T nowChild = (T)parent.getLeftChild();
        T left = null;
        for(int i = 1; i < pos&&nowChild!=null; i++){
            left = nowChild;
            nowChild = (T)nowChild.getNextSibling();
        }
        return insertChild(node,parent,left,ovl);
    }
    public boolean insertChild(T node,T parent,onOverListener ovl){
        return insertChild(node,parent,Integer.MAX_VALUE,ovl);
    }
    public boolean deleteChild(T node){
        return tree.remove(node);
    }
    public void checkTree(T parent,onCheckListener ocl){
        if(!tree.contains(parent) || null == ocl)
            return;
        T nowChild = (T)parent.getLeftChild();
        T left = null;
        while (null != nowChild){
            ocl.onCheck(nowChild,left);
            left = nowChild;
            nowChild = (T)nowChild.getNextSibling();
        }
    }
    //bfs完成遍历
    public void checkTree(onCheckListener ocl){
        T root = root();
        Queue<T> queue = new ArrayDeque<>();
        queue.add(root);
        while (!queue.isEmpty()){
            T parent = queue.poll();

            T left = null;
            T now = (T)parent.getLeftChild();
            while (now != null){
                if(!ocl.onCheck(left,now))
                    return;

                queue.offer(now);

                now = (T)now.getNextSibling();
            }
        }
    }
}
