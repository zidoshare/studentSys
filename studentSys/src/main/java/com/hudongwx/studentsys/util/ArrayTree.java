package com.hudongwx.studentsys.util;

import java.util.*;

/**
 * Created by wuhongxu on 2016/9/4 0004.
 */
//二叉链存储方式实现的树
public class ArrayTree<T extends TreeNode> {
    private List<T> tree;
    //暂时缓存上次添加的父节点，方便下次添加到同一父节点下时直接添加不需要传入父节点参数
    private T parent;

    //暂定层数最多一百层
    private int[] index = new int[Common.MAX_DEGREE];
    //这里得到的是复制，不能操作树本身
    public List<T> getList() {
        List<T> list = new ArrayList<>(tree);
        return list;
    }
    public ArrayTree<T> setTree(List<T> tree){
        this.tree = tree;
        return this;
    }
    public void addGoodNode(T node){
        if(tree == null)
            tree = new ArrayList<>();
        tree.add(node);
    }
    public void addGoodNode(int index,T node){
        if(tree == null)
            tree = new ArrayList<>();
        tree.add(index,node);
    }

    public ArrayTree() {
        tree = new ArrayList<T>();
    }

    //通过此接口实现额外对node的操作
    public interface onOverListener<T> {
        void onOver(T node, T parent, T nextSibling);
    }

    public interface onCheckListener<T> {
        boolean onCheck(T now);
    }

    public List<T> initTree(T root) {
        clearTree();
        root.setChildCount(0);
        root.setDegree(0);
        tree.add(root);
        return tree;
    }

    public void destroyTree() {
        tree = null;
    }

    public void clearTree() {
        if (!tree.isEmpty())
            tree.clear();
    }

    public boolean isEmpty() {
        return null != tree && tree.isEmpty();
    }

    public T root() {
        if (!tree.isEmpty()) {
            T t = tree.get(0);
            while (t.getParent() != null) {
                t = (T) t.getParent();
            }
            return t;
        }
        return null;
    }

    public T value(T node) {
        if (!tree.isEmpty() && tree.contains(node))
            return node;
        return null;
    }

    public void assign(T node, T newNode) {
        if (!tree.isEmpty() && tree.contains(node))
            node = newNode;
    }

    public T getParent(T node) {
        if (!tree.isEmpty() && tree.contains(node))
            return (T) node.getParent();
        return null;
    }

    public T getLeftChild(T node) {
        if (tree.isEmpty() && tree.contains(node))
            return (T) node.getLeftChild();
        return null;
    }

    public T getNextSibling(T node) {
        if (tree.isEmpty() && tree.contains(node))
            return (T) node.getNextSibling();
        return null;
    }

    //为了通用，没有为node的做多余操作，所以使用接口来让调用者实现
    public boolean insertChild(T node, T parent, T leftSibling, onOverListener<T> opn) {
        if (null == parent)
            return false;
        this.parent = parent;
        if (tree.contains(node) || !tree.contains(parent))
            return false;
        if (leftSibling != null && !tree.contains(leftSibling)) {
            return false;
        }
        if(parent.getDegree() >= Common.MAX_DEGREE)
            return false;
        parent.setChildCount(parent.getChildCount() + 1);

        node.setDegree(parent.getDegree() + 1);
        node.setParent(parent);
        if (null != leftSibling) {
            T tmp = (T) leftSibling.getNextSibling();
            leftSibling.setNextSibling(node);
            node.setNextSibling(tmp);
        } else {
            TreeNode leftChild = parent.getLeftChild();
            parent.setLeftChild(node);
            node.setNextSibling(leftChild);
        }
        if (null != opn)
            opn.onOver(node, parent, leftSibling);
        //添加位置为无论如何添加所有同层的在一起
        /*index[node.getDegree()] += index[parent.getDegree()];*/
        tree.add(++index[node.getDegree()],node);
        //TODO 思考更快速的位置标记，暂时没想到
        for(int i = node.getDegree() + 1; i < Common.MAX_DEGREE; i++)
            index[i]++;
        return true;
    }

    public boolean insertChild(T node, T parent, int pos, onOverListener<T> ovl) {
        if (null == parent)
            return false;
        T nowChild = (T) parent.getLeftChild();
        T left = null;
        for (int i = 1; i < pos && nowChild != null; i++) {
            left = nowChild;
            nowChild = (T) nowChild.getNextSibling();
        }
        return insertChild(node, parent, left, ovl);
    }

    public boolean insertChild(T node, T parent, onOverListener<T> ovl) {
        return insertChild(node, parent, Integer.MAX_VALUE, ovl);
    }
    public boolean insertChild(T node, T parent){
        return insertChild(node,parent,null);
    }
    public boolean insertChild(T node){
        return insertChild(node,parent,null);
    }
    public boolean insertChild(T node,onOverListener<T> ovl){
        return insertChild(node,parent,ovl);
    }
    public boolean deleteChild(T node) {
        return tree.remove(node);
    }


    public void checkTree(T parent, onCheckListener<T> ocl) {
        if (!tree.contains(parent) || null == ocl)
            return;
        Queue<T> queue = new LinkedList<>();
        queue.add(parent);
        while (!queue.isEmpty()) {
            T now = queue.poll();
            //如果tree不包含此节点，将不对其进行操作遍历(因为其实操作的对象是同一个，所以可能不会包含在链表中)
            if(!tree.contains(now))
                continue;
            T first = null;
            if(now.getParent() != null)
                first = (T) now.getParent().getLeftChild();
            //如果返回值为false，将放弃子节点遍历
            if (!ocl.onCheck(now))
                continue;
            T c = (T) now.getLeftChild();
            while (c != null) {
                queue.offer(c);
                c = (T) c.getNextSibling();
            }
        }
    }

    //bfs完成遍历
    public void checkTree(onCheckListener<T> ocl) {
        checkTree(root(),ocl);
    }
    public void checkTreePreorder(onCheckListener<T> ocl){
        checkTreePreorder(root(),ocl);
    }
    //深搜
    public void checkTreePreorder(T parent,onCheckListener<T> ocl){
        if (!tree.contains(parent) || null == ocl)
            return;
        Stack<T> stack = new Stack<>();
        stack.push(parent);
        while (!stack.isEmpty()) {
            T now = stack.pop();
            //如果tree不包含此节点，将不对其进行操作遍历(因为其实操作的对象是同一个，所以可能不会包含在链表中)
            if(!tree.contains(now))
                continue;
            T first = null;
            if(now.getParent() != null)
                first = (T) now.getParent().getLeftChild();
            //如果返回值为false，将放弃子节点遍历
            if (!ocl.onCheck(now))
                continue;
            T c = (T) now.getLeftChild();
            while (c != null) {
                stack.push(c);
                c = (T) c.getNextSibling();
            }
        }
    }
}
