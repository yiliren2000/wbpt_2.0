package com.lxq.platform.goalManage.action;

import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.goalManage.pojo.ApprovePostil;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.goalManage.service.intef.IGoalService;
import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.TreeNode;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class GoalApproveAction extends BaseAction {
	
	/**目标服务类*/
	private IGoalService goalService;
	
	/**目标主键*/
	private String uid;
	
	/**目标意见主键*/
	private String opinionUid;
	
	/**目标类型*/
	private String goalType;
	
	/**申请类型*/
	private String applyType;
	
	/**目标评价*/
	private String evaluation;
	
	/**提交动作*/
	private String action;
	
	/**意见*/
	private String opinion;
	
	/**批次uid*/
	private String dateBatchUid;

	/**部门uid*/
	private String deptUid;

	/**用户uid*/
	private String userUid;
	
	/**审批状态*/
	private String finishStatus;
	
	/**最终得分*/
	private String finalScore;
	/**
	 * 获取批复树
	 * @return
	 */
	public void getApproveNodes() {
		User curUser = ServletUtil.getCurUser();
		String roleUids = curUser.getAllRoleUidToString();
		
		int setupApproveCount = baseService.getCount("select count(*) " +
			" from approve_postil,performance_goal goal " +
			" where "+
			//关联批复意见表和目标表
			" approve_postil.goal = goal.uid"+
			//期次初或者期次末的状态有效的目标
			" and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
			//如果当前用户有100和101角色，则取批复角色=100，且目标所属部门的直属领导是当前用户的目标
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(approveRole) = '100' or getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid()+")":"")+
			//如果当前用户没有100角色，有101角色，则取目标所属部门的直属领导是当前用户的目标
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid():"")+
			//如果当前用户没有101角色，则取当前用户有批复角色的目标
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			//取当前用户有批复角色的目标
			" and approveRole in ("+roleUids+")"+
			//批复意见为制定
			" and getItemValue(applyType) like '%setup%'"+
			//目标的期次末状态在审批中
			" and getItemValue(goal.beginStatus)= 'approving'"+
			//批复时间为空
			" and approveTime is null"
		);
		
		int selfEvaApproveCount = baseService.getCount("select count(*) " +
			" from approve_postil,performance_goal goal " +
			" where " +
			//关联批复意见表和目标表
			" approve_postil.goal = goal.uid"+
			//期次初或者期次末的状态有效的目标
			" and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
			//如果当前用户有100和101角色，则取批复角色=100，且目标所属部门的直属领导是当前用户的目标
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(approveRole) = '100' or getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid()+")":"")+
			//如果当前用户没有100角色，有101角色，则取目标所属部门的直属领导是当前用户的目标
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid():"")+
			//如果当前用户没有101角色，则取当前用户有批复角色的目标
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			//取当前用户有批复角色的目标
			" and approveRole in ("+roleUids+")"+
			//批复意见为自评
			" and getItemValue(applyType) like '%selfEva%'"+
			//目标的期次末状态在审批中
			" and getItemValue(goal.endStatus) = 'approving'"+
			//批复时间为空
			" and approveTime is null"
		);
		
		int sendGoalCount = baseService.getCount("select count(*) " + 
			" from performance_goal " +
			" where " +
			//创建人是当前用户
			" createPerson = '"+curUser.getUid()+"' " +
			//所属人不是当前用户
			" and ownerPerson != '"+curUser.getUid()+"' " +
			//是期初目标
			" and getDateBatchStatus(dateBatch,'begin')=true "+
			//目标类型
			" and getItemValue(goalType)='"+goalType+"' " +
			//制定状态
			" and beginStatus is null"
		);
		
		TreeNode[] treeNodes = new TreeNode[2];
		treeNodes[0] = new TreeNode();
		
		treeNodes[0].setId(goalType+"_item1");
		treeNodes[0].setText("待处理");
		treeNodes[0].setCls("folder");
		treeNodes[0].setLeaf(false);
		treeNodes[0].setUrl("");
		treeNodes[0].setId(goalType+"_item2");
		
		TreeNode[] childTreeNodes1 = new TreeNode[3]; 

		childTreeNodes1[0] = new TreeNode();
		childTreeNodes1[0].setId(goalType+"_non-finish_set-out");
		childTreeNodes1[0].setText("目标制定审核"+"&nbsp;&nbsp;&nbsp;&nbsp;"+setupApproveCount+"件");
		childTreeNodes1[0].setCls("file");
		childTreeNodes1[0].setLeaf(true);
		childTreeNodes1[0].setUrl("/approve/setupGoalApprove.jsp");
		childTreeNodes1[0].setJsonObject("{finishStatus:\"no\",goalType:\""+goalType+"\"}");
		
		childTreeNodes1[1] = new TreeNode();
		childTreeNodes1[1].setId(goalType+"_non-finish_self-eva");
		childTreeNodes1[1].setText("目标自评审核"+"&nbsp;&nbsp;&nbsp;&nbsp;"+selfEvaApproveCount+"件");
		childTreeNodes1[1].setCls("file");
		childTreeNodes1[1].setLeaf(true);
		childTreeNodes1[1].setUrl("/approve/selfEvaGoalApprove.jsp");
		childTreeNodes1[1].setJsonObject("{finishStatus:\"no\",goalType:\""+goalType+"\"}");
		
		//待完成分发的任务
		childTreeNodes1[2] = new TreeNode();
		childTreeNodes1[2].setId(goalType+"_non-finish_send");
		childTreeNodes1[2].setText("待分发任务"+"&nbsp;&nbsp;&nbsp;&nbsp;"+sendGoalCount+"件");
		childTreeNodes1[2].setCls("file");
		childTreeNodes1[2].setLeaf(true);
		childTreeNodes1[2].setUrl("/approve/sendGoal.jsp");
		childTreeNodes1[2].setJsonObject("{finishStatus:\"no\",goalType:\""+goalType+"\"}");
		
		treeNodes[0].setChildren(childTreeNodes1);
		
		JSONArray jsonArray = JSONArray.fromObject(treeNodes);
		
		String str_json = jsonArray.toString();
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signOpinion() throws Exception{
		
		JSONArray json_uids = JSONArray.fromObject(uid);
		
		Iterator<?> it = json_uids.iterator();
		
		Department curDept = ServletUtil.getCurDept();
		User curUser = ServletUtil.getCurUser();
		
		while(it.hasNext()){
			
			int uid = (Integer)it.next();
			PerformanceGoal goal = ((PerformanceGoal)baseService.findById(PerformanceGoal.class, uid));
			
			goal.setIsAddScore(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='false' and getCodeNo(codeCatalog)='YesOrNo'")));
			
			String str_roleUid = curUser.getAllRoleUidToString();
			
			ApprovePostil approvePostil = (ApprovePostil) baseService.findUniqueBySql(ApprovePostil.class," select * from approve_postil where goal="+uid+" and approveRole in ("+str_roleUid+") and approveTime is null");
			
			
			approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
			approvePostil.setApproveTime(DateUtil.getToday());
			approvePostil.setPostil(opinion);
			approvePostil.setScore(0);
			approvePostil.setApprovePerson(curUser);
			goalService.signApproveOpinion(goal,approvePostil,curDept,curUser,applyType,action);
		}
		
		ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
	}
	
	/**
	 * 取消过期目标
	 * @throws Exception
	 */
	public void cannelExprire() throws Exception{
		
		JSONArray json_uids = JSONArray.fromObject(uid);
		
		Iterator<?> it = json_uids.iterator();
		
		User curUser = ServletUtil.getCurUser();
		
		while(it.hasNext()){
			
			String uid = (String)it.next();
			PerformanceGoal goal = ((PerformanceGoal)baseService.findById(PerformanceGoal.class, Integer.parseInt(uid)));
			
			goal.setIsAddScore(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='false' and getCodeNo(codeCatalog)='YesOrNo'")));
			
			String str_roleUid = curUser.getAllRoleUidToString();
			
			ApprovePostil approvePostil = (ApprovePostil) baseService.findUniqueBySql(ApprovePostil.class,"select * from approve_postil where goal.uid="+uid+" and approveRole.uid in ("+str_roleUid+") and approveTime is null");
			
			approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='reject' and getCodeNo(codeCatalog)='Action'")));
			approvePostil.setApproveTime(DateUtil.getToday());
			approvePostil.setPostil("过期目标");
			approvePostil.setScore(0);
			approvePostil.setApprovePerson(curUser);
			
			if(applyType.indexOf("setup")>-1){//制定申请
				goal.setBeginStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='exprire'"));
			}else{
				goal.setEndStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='exprire'"));
			}

			baseService.update(approvePostil);
			baseService.update(goal);
			
		}
		
		ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
	}

	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signSelfEvaOpinion() throws Exception{
		
		JSONArray json_uids = JSONArray.fromObject(uid);
		
		Iterator<?> it = json_uids.iterator();
		
		User curUser = ServletUtil.getCurUser();
		Department curDept = ServletUtil.getCurDept();
		String roleUids = curUser.getAllRoleUidToString();
		
		while(it.hasNext()){
			int uid = (Integer)it.next();
			PerformanceGoal goal = ((PerformanceGoal)baseService.findById(PerformanceGoal.class, uid));
			
			int count = baseService.getCount("select count(*) from performance_goal " +
					" where ownerPerson="+goal.getOwnerPerson().getUid()+
					" and getItemValue(isMajor)='true' and getItemValue(beginStatus)='pass'");
			double score = 0;
			
			if(goal.getFinishStatus().getValue().equals("yes")){
				
				if(evaluation.equals("satisfy")){
					score = 100.00/count;
				} else if (evaluation.equals("base-satisfy")){
					score = 100.00/count * 0.9;
				} else{
					score = 0;
				}
			} else {
				score = 0;
			}
			goal.setFinalScore(score);
			
			ApprovePostil approvePostil = (ApprovePostil) baseService.findUniqueBySql(ApprovePostil.class,
				" select * from approve_postil,performance_goal goal" +
				" where " +
				" approve_postil.goal = goal.uid"+
				" and goal="+uid+" " +
				(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(approveRole)= '100' or getDeptDirectLeader(goal.ownerDept)= "+curUser.getUid()+")":"")+
				(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid():"")+
				(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
				" and approveRole in ("+roleUids+")" +
				" and approveTime is null"
			);
			
			approvePostil.setAction(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='"+action+"' and getCodeNo(codeCatalog)='Action'")));
			approvePostil.setApproveTime(DateUtil.getToday());
			approvePostil.setPostil(opinion);
			approvePostil.setApprovePerson(curUser);
			approvePostil.setScore(score);
			approvePostil.setEvaluation(((CodeLibrary)baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where value='"+evaluation+"' and getCodeNo(codeCatalog)='Evaluation'")));
			
			goalService.signApproveOpinion(goal,approvePostil,curDept,curUser,applyType,action);
		}
		
		
		ServletUtil.responseText( "{'success':true,'msg':'提交成功'}");
	}
	
	/**
	 * 进行任务分发
	 * @throws Exception 
	 */
	public void sendGoal() throws Exception {
		JSONObject json_gaol = JSONObject.fromObject(jsonObject);
		String goal_uid = json_gaol.getString("uid");
		PerformanceGoal performGoal = (PerformanceGoal) baseService.findById(PerformanceGoal.class, Integer.parseInt(goal_uid));
		
		performGoal.setBeginStatus((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='submit'"));
		performGoal.setIsMajor((CodeLibrary) baseService.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='YesOrNo' and value='true'"));
		baseService.update(performGoal,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'分发任务成功'}";
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

	public String getOpinionUid() {
		return opinionUid;
	}

	public void setOpinionUid(String opinionUid) {
		this.opinionUid = opinionUid;
	}

	public IGoalService getGoalService() {
		return goalService;
	}

	public void setGoalService(IGoalService goalService) {
		this.goalService = goalService;
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

	public String getDateBatchUid() {
		return dateBatchUid;
	}

	public void setDateBatchUid(String dateBatchUid) {
		this.dateBatchUid = dateBatchUid;
	}

	public String getDeptUid() {
		return deptUid;
	}

	public void setDeptUid(String deptUid) {
		this.deptUid = deptUid;
	}

	public String getUserUid() {
		return userUid;
	}

	public void setUserUid(String userUid) {
		this.userUid = userUid;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}

	public String getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(String finalScore) {
		this.finalScore = finalScore;
	}

	public String getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	
}
