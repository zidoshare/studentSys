package com.hudongwx.studentSys.util;

/**
 * Created by wuhongxu on 2016/9/4 0004.
 */
public interface TreeNode {
    public void setChildCount(java.lang.Integer childCount);

    public java.lang.Integer getChildCount();

    public void setDegree(java.lang.Integer degree);

    public java.lang.Integer getDegree();

    public TreeNode getParent();

    public void setParent(TreeNode treeNode);

    public void setLeftChild(TreeNode treeNode);

    public TreeNode getLeftChild();

    public void setNextSibling(TreeNode treeNode);

    public TreeNode getNextSibling();
}
