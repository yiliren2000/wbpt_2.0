package com.lxq.platform.goalManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.User;

/**
 * 目标实体类
 * @author michael
 *
 */
public class PerformanceGoal {
	/**主键*/
	private int uid;
	/**所属期次*/
	private DateBatch dateBatch;
	/**目标内容*/
	private String content;
	/**完成状态*/
	private CodeLibrary finishStatus;
	/**目标类型*/
	private CodeLibrary goalType;
	/**满分*/
	private double fullScore;
	/**执行部门*/
	private Department ownerDept;
	/**执行人*/
	private User ownerPerson;
	/**协同部门*/
	private String coorDeptsJson;
	/**创建部门*/
	private Department createDept;
	/**创建人*/
	private User createPerson;
	/**创建时间*/
	private String createTime;
	/**最终审批人*/
	private User finalApprover;
	/**最终得分*/
	private double finalScore;
	/**期次初状态*/
	private CodeLibrary beginStatus;
	/**期次末状态*/
	private CodeLibrary endStatus;
	/**是否重点工作*/
	private CodeLibrary isMajor;
	/**加分标识*/
	private CodeLibrary isAddScore;
	/**加分理由*/
	private String addScoreReason;
	/**备注*/
	private String remark;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public DateBatch getDateBatch() {
		return dateBatch;
	}
	public void setDateBatch(DateBatch dateBatch) {
		this.dateBatch = dateBatch;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public CodeLibrary getGoalType() {
		return goalType;
	}
	public void setGoalType(CodeLibrary goalType) {
		this.goalType = goalType;
	}
	
	public double getFullScore() {
		return fullScore;
	}
	public void setFullScore(double fullScore) {
		this.fullScore = fullScore;
	}
	public Department getOwnerDept() {
		return ownerDept;
	}
	public void setOwnerDept(Department ownerDept) {
		this.ownerDept = ownerDept;
	}
	public User getOwnerPerson() {
		return ownerPerson;
	}
	public void setOwnerPerson(User ownerPerson) {
		this.ownerPerson = ownerPerson;
	}
	public Department getCreateDept() {
		return createDept;
	}
	public void setCreateDept(Department createDept) {
		this.createDept = createDept;
	}
	
	public User getCreatePerson() {
		return createPerson;
	}
	public void setCreatePerson(User createPerson) {
		this.createPerson = createPerson;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public double getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(double finalScore) {
		this.finalScore = finalScore;
	}
	public String getCoorDeptsJson() {
		return coorDeptsJson;
	}
	public void setCoorDeptsJson(String coorDeptsJson) {
		this.coorDeptsJson = coorDeptsJson;
	}
	public CodeLibrary getBeginStatus() {
		return beginStatus;
	}
	public void setBeginStatus(CodeLibrary beginStatus) {
		this.beginStatus = beginStatus;
	}
	public CodeLibrary getEndStatus() {
		return endStatus;
	}
	public void setEndStatus(CodeLibrary endStatus) {
		this.endStatus = endStatus;
	}
	public CodeLibrary getFinishStatus() {
		return finishStatus;
	}
	public void setFinishStatus(CodeLibrary finishStatus) {
		this.finishStatus = finishStatus;
	}
	public CodeLibrary getIsMajor() {
		return isMajor;
	}
	public void setIsMajor(CodeLibrary isMajor) {
		this.isMajor = isMajor;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public CodeLibrary getIsAddScore() {
		return isAddScore;
	}
	public void setIsAddScore(CodeLibrary isAddScore) {
		this.isAddScore = isAddScore;
	}
	public User getFinalApprover() {
		return finalApprover;
	}
	public void setFinalApprover(User finalApprover) {
		this.finalApprover = finalApprover;
	}
	public String getAddScoreReason() {
		return addScoreReason;
	}
	public void setAddScoreReason(String addScoreReason) {
		this.addScoreReason = addScoreReason;
	}
}