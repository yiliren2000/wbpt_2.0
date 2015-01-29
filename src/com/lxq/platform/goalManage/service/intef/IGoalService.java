package com.lxq.platform.goalManage.service.intef;

import com.lxq.platform.goalManage.pojo.ApprovePostil;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.service.intef.IBaseService;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.User;

public interface IGoalService extends IBaseService {

	public User getFinalApprover(PerformanceGoal goal);
	
	public User getUserByRole (String roleId);

	public User getUserByRole (Department dept , String roleId);
	
	public void signApplyOpinion(PerformanceGoal goal,ApprovePostil approvePostil,Department curDept,User curUser,String applyType) throws Exception;
	
	public void signApproveOpinion(PerformanceGoal goal,ApprovePostil approvePostil,Department curDept,User curUser,String applyType,String action) throws Exception;
	
	public String undo(String goalUid,String applyType);
}
