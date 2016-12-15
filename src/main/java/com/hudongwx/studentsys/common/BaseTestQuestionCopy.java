package com.hudongwx.studentsys.common;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseTestQuestionCopy<M extends BaseTestQuestionCopy<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setTestQuestionTitle(java.lang.String testQuestionTitle) {
		set("testQuestionTitle", testQuestionTitle);
	}

	public java.lang.String getTestQuestionTitle() {
		return get("testQuestionTitle");
	}

	public void setTestQuestionTypeId(java.lang.Integer testQuestionTypeId) {
		set("testQuestionTypeId", testQuestionTypeId);
	}

	public java.lang.Integer getTestQuestionTypeId() {
		return get("testQuestionTypeId");
	}

	public void setTestQuestionContent(java.lang.String testQuestionContent) {
		set("testQuestionContent", testQuestionContent);
	}

	public java.lang.String getTestQuestionContent() {
		return get("testQuestionContent");
	}

	public void setTestQuestionShortAnswer(java.lang.String testQuestionShortAnswer) {
		set("testQuestionShortAnswer", testQuestionShortAnswer);
	}

	public java.lang.String getTestQuestionShortAnswer() {
		return get("testQuestionShortAnswer");
	}

	public void setTestQuestionLongAnswer(java.lang.String testQuestionLongAnswer) {
		set("testQuestionLongAnswer", testQuestionLongAnswer);
	}

	public java.lang.String getTestQuestionLongAnswer() {
		return get("testQuestionLongAnswer");
	}

	public void setTestQuestionCreateTime(java.lang.Long testQuestionCreateTime) {
		set("testQuestionCreateTime", testQuestionCreateTime);
	}

	public java.lang.Long getTestQuestionCreateTime() {
		return get("testQuestionCreateTime");
	}

	public void setTestQuestionUpdateTime(java.lang.Long testQuestionUpdateTime) {
		set("testQuestionUpdateTime", testQuestionUpdateTime);
	}

	public java.lang.Long getTestQuestionUpdateTime() {
		return get("testQuestionUpdateTime");
	}

	public void setTestQuestionOperaterId(java.lang.Integer testQuestionOperaterId) {
		set("testQuestionOperaterId", testQuestionOperaterId);
	}

	public java.lang.Integer getTestQuestionOperaterId() {
		return get("testQuestionOperaterId");
	}

	public void setTestQuestionDefaultScore(java.lang.Integer testQuestionDefaultScore) {
		set("testQuestionDefaultScore", testQuestionDefaultScore);
	}

	public java.lang.Integer getTestQuestionDefaultScore() {
		return get("testQuestionDefaultScore");
	}

	public void setTestQuestionMessage(java.lang.String testQuestionMessage) {
		set("testQuestionMessage", testQuestionMessage);
	}

	public java.lang.String getTestQuestionMessage() {
		return get("testQuestionMessage");
	}

}
