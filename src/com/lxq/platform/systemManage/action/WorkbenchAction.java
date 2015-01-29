package com.lxq.platform.systemManage.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class WorkbenchAction extends BaseAction {
	
	public void getTaskNum(){
		
		User curUser = ServletUtil.getCurUser();
		
		JSONObject topics = new JSONObject();
		
		JSONObject setupApply = new JSONObject();
		JSONObject selfEvaApply = new JSONObject();
		JSONObject setupApprove = new JSONObject();
		JSONObject selfEvaApprove = new JSONObject();

		//制定申请
		List<?> objects1 = baseService.findBySql(null,
			" select getItemValue(goal.beginStatus) as status,count(*) as amount"+
			" from performance_goal goal"+
			" where goal.ownerPerson = " +curUser.getUid()+
			" and getDateBatchStatus(goal.dateBatch,'begin')=true"+
			" group by goal.beginStatus"
		);
		
		for(int i = 0 ; i < objects1.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects1.get(i);
			setupApply.put(DataConvert.toString(object.get("status")), DataConvert.toString(object.get("amount")));
		}

		//评价申请
		List<?> objects2 = baseService.findBySql(null,
			"select getItemValue(goal.endStatus) as status,count(*) as amount " +
			" from performance_goal goal"+
			" where goal.ownerPerson = " +curUser.getUid()+
			" and getItemValue(goal.beginStatus)='pass'"+
			" and getDateBatchStatus(goal.dateBatch,'end')=true"+
			" group by goal.endStatus"
		);
		
		for(int i = 0 ; i < objects2.size() ; i++){
			Map<?,?> object = (Map<?,?>) objects2.get(i);
			selfEvaApply.put(DataConvert.toString(object.get("status")), DataConvert.toString(object.get("amount")));
		}
		
		String roleUids = curUser.getAllRoleUidToString();
		
		//制定审核
		int setupApproveCount = baseService.getCount(
			" select count(*) " +
			" from approve_postil postil,performance_goal goal " +
			" where "+
			" postil.goal = goal.uid"+
			" and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(postil.approveRole) = '100' or getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid()+")":"")+
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid():"")+
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			" and approveRole in ("+roleUids+")"+
			" and getItemValue(postil.applyType) like '%setup%'"+
			" and getItemValue(goal.beginStatus) = 'approving'"+
			" and approveTime is null"
		);
		
		setupApprove.put("submit", setupApproveCount);
		
		//评价审核
		int selfEvaApproveCount = baseService.getCount(
			"select count(*) " +
			" from approve_postil postil,performance_goal goal " +
			" where "+
			" postil.goal = goal.uid"+
			" and (getDateBatchStatus(goal.dateBatch,'begin')=true or getDateBatchStatus(goal.dateBatch,'end')=true)"+
			(curUser.hasRole("100") && curUser.hasRole("101")?" and ( getRoleId(postil.approveRole) = '100' or getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid()+")":"")+
			(!curUser.hasRole("100") && curUser.hasRole("101")?" and getDeptDirectLeader(goal.ownerDept) = "+curUser.getUid():"")+
			(!curUser.hasRole("101")?" and approveRole in ("+roleUids+")":"")+
			" and approveRole in ("+roleUids+")"+
			" and getItemValue(postil.applyType) like '%selfEva%'"+
			" and getItemValue(goal.endStatus) = 'approving'"+
			" and approveTime is null");
		
		selfEvaApprove.put("submit", selfEvaApproveCount);

		topics.put("setupApply", setupApply);
		topics.put("selfEvaApply", selfEvaApply);
		topics.put("setupApprove", setupApprove);
		topics.put("selfEvaApprove", selfEvaApprove);
		
		ServletUtil.responseText("var taskNum = "+topics.toString());
	}
}
