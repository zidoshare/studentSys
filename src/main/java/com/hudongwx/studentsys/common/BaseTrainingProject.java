package com.hudongwx.studentsys.common;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseTrainingProject<M extends BaseTrainingProject<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setStudentId(java.lang.Integer studentId) {
		set("studentId", studentId);
	}

	public java.lang.Integer getStudentId() {
		return get("studentId");
	}

	public void setTime(java.lang.Long time) {
		set("time", time);
	}

	public java.lang.Long getTime() {
		return get("time");
	}

	public void setProjectName(java.lang.String projectName) {
		set("projectName", projectName);
	}

	public java.lang.String getProjectName() {
		return get("projectName");
	}

	public void setScore(java.math.BigDecimal score) {
		set("score", score);
	}

	public java.math.BigDecimal getScore() {
		return get("score");
	}

}
