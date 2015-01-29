package com.lxq.platform.goalManage.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.goalManage.service.intef.IGoalService;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class GoalSendAction extends BaseAction {
	
	/**目标服务类*/
	private IGoalService goalService;
	
	/**目标主键*/
	private String uid;
	
	/**目标意见主键*/
	private String opinionUid;
	
	/**申请类型*/
	private String applyType;
	
	/**目标类型*/
	private String goalType;
	
	/**提交动作*/
	private String action;
	
	/**意见*/
	private String opinion;
	
	/**制定申请状态*/
	private String beginStatus;
	
	/**自评申请状态*/
	private String endStatus;
	
	/**审批状态*/
	private String finishStatus;
	
	/**
	 * 保存json格式的实体对象
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void save() throws ClassNotFoundException, PrivilegeException {
		User curUser = ServletUtil.getCurUser();
		Department curDept = (Department)(ActionContext.getContext().getSession().get("curDept"));
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		PerformanceGoal goal = (PerformanceGoal) JSONObject.toBean(jb, Class.forName(entityName));
		User user = (User) baseService.findById(User.class,goal.getOwnerPerson().getUid() );

		goal.setCreateDept(curDept);
		goal.setCreatePerson(curUser);
		goal.setCreateTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
		goal.setOwnerPerson(user);
		goal.setOwnerDept(user.getBelongDept());
		
		// 保存对象
		baseService.add(goal,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
	
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getOpinionUid() {
		return opinionUid;
	}

	public void setOpinionUid(String opinionUid) {
		this.opinionUid = opinionUid;
	}

	public String getBeginStatus() {
		return beginStatus;
	}

	public void setBeginStatus(String beginStatus) {
		this.beginStatus = beginStatus;
	}

	public String getEndStatus() {
		return endStatus;
	}

	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}

	public IGoalService getGoalService() {
		return goalService;
	}

	public void setGoalService(IGoalService goalService) {
		this.goalService = goalService;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}
	
}
