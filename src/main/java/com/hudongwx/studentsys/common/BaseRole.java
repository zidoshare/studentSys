package com.hudongwx.studentsys.common;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRole<M extends BaseRole<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setMemberCnt(java.lang.Integer memberCnt) {
		set("memberCnt", memberCnt);
	}

	public java.lang.Integer getMemberCnt() {
		return get("memberCnt");
	}

	public void setTreeData(java.lang.String treeData) {
		set("treeData", treeData);
	}

	public java.lang.String getTreeData() {
		return get("treeData");
	}

	public void setCreateTime(java.lang.Long createTime) {
		set("createTime", createTime);
	}

	public java.lang.Long getCreateTime() {
		return get("createTime");
	}

	public void setOperater(java.lang.String operater) {
		set("operater", operater);
	}

	public java.lang.String getOperater() {
		return get("operater");
	}

}
