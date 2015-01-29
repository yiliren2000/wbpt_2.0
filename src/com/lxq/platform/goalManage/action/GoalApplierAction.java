package com.lxq.platform.goalManage.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class GoalApplierAction extends BaseAction {
	
	/**申请类型*/
	private String applyType;

	/**目标类型*/
	private String goalType;
	
	/**审批状态*/
	private String finishStatus;
	
	  /**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {
		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=1";
		}

		Map<String, Object> session = ActionContext.getContext().getSession();
		User curUser = (User) session.get("curUser");
		String roleUids = curUser.getAllRoleUidToString();
		
		String tmep_Sql = 
			" from approve_postil,performance_goal goal" +
			" where" +
			//关联批复意见表和目标表
			" approve_postil.goal = goal.uid"+
			//查询条件
			" and "+queryClause+
			//期次初或者期次末的状态有效的目标
			" and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
			//如果当前用户有100和101角色，则取批复角色=100，且目标所属部门的直属领导是当前用户的目标
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(approveRole) = '100' or getDeptDirectLeader(goal.ownerDept)= "+curUser.getUid()+")":"")+
			//如果当前用户没有100角色，有101角色，则取目标所属部门的直属领导是当前用户的目标
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept)= "+curUser.getUid():"")+
			//如果当前用户没有101角色，则取当前用户有批复角色的目标
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			//取当前用户有批复角色的目标
			" and approveRole in ("+roleUids+")"+
			//申请类型是指定的申请类型的目标
			" and getItemValue(applyType) like '%"+applyType+"%'"+
			//目标类型是指定的目标类型的目标
			" and getItemValue(goal.goalType) = '"+goalType+"'"+
			//不是申请阶段
			" and phaseNo != 1"+
			//如果已完成，则批复时间不为空，否则批复时间为空
			(finishStatus.equals("yes")?" and approveTime is not null":" and approveTime is null")
		;

		String Sql = tmep_Sql +
			//按期次和执行人分组
			" group by goal.dateBatch,goal.ownerPerson ";
			
		List<?> objects = baseService.findBySql(null,
			" select" +
			" goal.dateBatch as dateBatchUid," +
			" getDateBatch(goal.dateBatch) as dateBatch,"+
			" goal.ownerDept as ownerDeptUid," +
			" getDeptName(goal.ownerDept) as ownerDeptName," +
			" goal.ownerPerson as ownerPersonUid," +
			" getUserName(goal.ownerPerson) as ownerPersonName" +
			Sql+
			" order by "+sort+" "+dir, start, limit);

		int totalCount = objects.size();
		
		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			topic.put("dateBatchUid", DataConvert.toString(object.get("dateBatchUid")));
			topic.put("dateBatch", DataConvert.toString(object.get("dateBatch")));
			topic.put("ownerDeptUid", DataConvert.toString(object.get("ownerDeptUid")));
			topic.put("ownerDeptName", DataConvert.toString(object.get("ownerDeptName")));
			topic.put("ownerPersonUid", DataConvert.toString(object.get("ownerPersonUid")));
			topic.put("ownerPersonName", DataConvert.toString(object.get("ownerPersonName")));
			
			String goalCountSql = 
				" select count(*) "+ tmep_Sql + 
				" and goal.dateBatch ="+DataConvert.toString(object.get("dateBatchUid"))+
				" and goal.ownerPerson="+DataConvert.toString(object.get("ownerPersonUid"));

			String majorGoalCountSql = 
				" select count(*) "+ tmep_Sql + 
				" and goal.dateBatch ="+DataConvert.toString(object.get("dateBatchUid"))+
				" and goal.ownerPerson="+DataConvert.toString(object.get("ownerPersonUid"))+
				" and getItemValue(goal.isMajor)= 'true'" ;

			topic.put("goalCount", baseService.getCount(goalCountSql));
			topic.put("majorGoalCount", baseService.getCount(majorGoalCountSql));
			
			topics.add(topic);
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}

	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
	}

}
