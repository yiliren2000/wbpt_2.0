package com.lxq.platform.goalManage.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.lxq.platform.goalManage.pojo.ApprovePostil;
import com.lxq.platform.goalManage.pojo.PerformanceGoal;
import com.lxq.platform.goalManage.service.intef.IGoalService;
import com.lxq.platform.service.impl.BaseServiceImpl;
import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.Group;
import com.lxq.platform.userManage.pojo.Role;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;

public class GoalServiceImpl extends BaseServiceImpl implements IGoalService {

	/**
	 * 下阶段审批角色
	 * @param goal
	 * @return 
	 */
	public Role getNextPhaseRole(PerformanceGoal goal){
		//	1	admin	系统管理员	5
		//	2	100	局长	5
		//	3	101	分管局长	5
		//	3	102	监察员	5
		//	4	200	部门主任	5
		//	5	201	部门副主任	5
		//	6	300	管理员	5
		//	7	400	班组长	5
		
		User curUser = ServletUtil.getCurUser();
		
		if(this.hasRole(curUser, "101")){//分管领导--局长
			
			return (Role)baseDAO.findUniqueBySql(Role.class," select * from basic_role where roleId='100'");
			
		} else if(this.hasRole(curUser, "200")){//部门主任角色--分管领导
		
			return (Role)baseDAO.findUniqueBySql(Role.class," select * from basic_role where roleId='101'");
		
		} else if(this.hasRole(curUser, "201")){//部门副主任角色--部门主任角色
			
			return (Role)baseDAO.findUniqueBySql(Role.class," select * from Role where roleId='200'");
			
		} else if(this.hasRole(curUser, "300")){//管理员角色--部门主任角色
			
			return (Role)baseDAO.findUniqueBySql(Role.class," select * from basic_role where roleId='200'");
			
		} else if(this.hasRole(curUser, "400")){//班组长角色--管理员角色
			
			return (Role)baseDAO.findUniqueBySql(Role.class," select * from basic_role where roleId='300'");
			
		}else{//局长

			return (Role)baseDAO.findUniqueBySql(Role.class," select * from r_role where roleId='100'");
		}
		
	}
	
	/**
	 * 下阶段审批机构
	 * @param goal
	 * @return
	 */
	public Department getNextPhaseDept(PerformanceGoal goal){
		
		Department curDept = ServletUtil.getCurDept();
		
		if(curDept.getLevel().getValue().equals("1")){//一级部门，
			
			return curDept;
			
		}else{// 上级部门
			
			return (Department)baseDAO.findUniqueBySql(Department.class," select * from basic_department where uid = getParentDept("+curDept.getUid()+")");
		}
	}
	
	/**
	 * 判断用户是否有指定角色
	 * @param user 用户
	 * @param role 角色
	 * @return
	 */
	public boolean hasRole(User user , String roleId){
		
		User basic_user = (User)baseDAO.findById(User.class, user.getUid());
		Role role = (Role)baseDAO.findUniqueBySql(Role.class,"select * from basic_role where roleId='"+roleId+"'");
		
		boolean hasRole = false;
		
		Set<Role> roles = getRoles(basic_user);
		
		Iterator<Role> it = roles.iterator();
		while(it.hasNext()){
			Role basic_role = it.next();
			
			if(basic_role.getUid()==role.getUid()){
				return true;
			}
		}
		
		return hasRole;
	}
	
	/**
	 * 获取指定用户的所有角色
	 * @param user 用户
	 * @return 角色集合
	 */
	public Set<Role> getRoles(User user){
		
		Set<Role> roles = user.getRoles();
		
		Set<Group> groups = user.getGroups();
		Iterator<Group> it = groups.iterator();
		while(it.hasNext()){
			Group group = it.next();
			Set<Role> g_roles = group.getRoles();
			roles.addAll(g_roles);
		}
		
		return roles;
	}
	
	/**
	 * 终审人
	 * @param goal
	 * @return
	 */
	public User getFinalApprover(PerformanceGoal goal){
		
		//	1	admin	系统管理员	5
		//	2	100	局长	5
		//	3	101	分管局长	5
		//	3	102	监察员	5
		//	4	200	部门主任	5
		//	5	201	部门副主任	5
		//	6	300	管理员	5
		//	7	400	班组长	5
		
		Department ownerDept = goal.getOwnerDept();
		User ownerUser = goal.getOwnerPerson();
		
		if(this.hasRole(ownerUser, "200")){//部门主任角色--局长
		
			return this.getUserByRole(ownerDept.getParentDept(),"100");
		
		} else if(this.hasRole(ownerUser, "201")){//部门副主任角色--部门主任角色
			
			return this.getUserByRole(ownerDept,"200");
			
		} else if(this.hasRole(ownerUser, "300")){//管理员角色--部门主任角色
			
			return this.getUserByRole(ownerDept.getParentDept(),"200");
			
		} else if(this.hasRole(ownerUser, "400")){//班组长角色--管理员角色
			
			return this.getUserByRole(ownerDept.getParentDept(),"300");
			
		}else{//局长

			return this.getUserByRole((Department)baseDAO.findUniqueBySql(Department.class," select * from basic_department where level.value='1'"),"100");
		}
	}
	
	public User getUserByRole (Department dept , String roleId){
		
		List<?> users = baseDAO.findBySql(User.class,"select * from basic_user where belongDept="+dept.getUid());
		
		for(int i = 0 ; i < users.size() ; i ++){
			User user = (User)users.get(i);
			Set<Role> roles = user.getRoles();
			
			Iterator<Role> it = roles.iterator();
			while(it.hasNext()){
				Role basic_role = it.next();
				
				if(basic_role.getRoleId().equals(roleId)){
					return user;
				}
			}
		}
		return null;
	}
	
	public User getUserByRole (String roleId){
		
		List<?> users = baseDAO.findBySql(User.class,"select * from basic_user ");
		
		for(int i = 0 ; i < users.size() ; i ++){
			User user = (User)users.get(i);
			Set<Role> roles = user.getRoles();
			
			Iterator<Role> it = roles.iterator();
			while(it.hasNext()){
				Role basic_role = it.next();
				
				if(basic_role.getRoleId().equals(roleId)){
					return user;
				}
			}
		}
		return null;
	}

	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signApplyOpinion(PerformanceGoal goal,ApprovePostil approvePostil,Department curDept,User curUser,String applyType) throws Exception {
		
		if (applyType.indexOf("selfEva") > -1 && goal.getIsMajor().getValue().equals("false")){
			goal.setFinalApprover(ServletUtil.getCurUser());//设置终审人
			goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='pass'"));
		}else{
			if(applyType.indexOf("selfEva") > -1){
				goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='approving'"));
			}else{
				goal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='approving'"));
			}
			
			User finalApprover = this.getFinalApprover(goal);
			Department nextPhaseDept = this.getNextPhaseDept(goal);
			Role nextPhaseRole = this.getNextPhaseRole(goal);
			
			if(finalApprover == null){
				throw new Exception("终审人不存在");
			}
			if(nextPhaseDept == null){
				throw new Exception("终审机构不存在");
			}
			if(nextPhaseRole == null){
				throw new Exception("审批角色不存在");
			}
			
			goal.setFinalApprover(finalApprover);//设置终审人

			baseDAO.saveOrUpdate(approvePostil);// 保存或更新对象
			
			ApprovePostil next_approvePostil = new ApprovePostil();
			next_approvePostil.setAction(approvePostil.getAction());
			next_approvePostil.setApplyType(approvePostil.getApplyType());
			next_approvePostil.setApproveDept(nextPhaseDept);
			next_approvePostil.setApproveRole(nextPhaseRole);
			next_approvePostil.setGoal(goal);
			next_approvePostil.setPhaseNo(2);
			next_approvePostil.setScore(0);
			baseDAO.save(next_approvePostil);
		}
			
		baseDAO.update(goal);
	
	}
	
	/**
	 * 保存并提交
	 * @throws Exception
	 */
	public void signApproveOpinion(PerformanceGoal goal,ApprovePostil approvePostil,Department curDept,User curUser,String applyType,String action) throws Exception {
		
		approvePostil.setApproveTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
		if(action.equals("reject")){//否决
			if(applyType.indexOf("setup")>-1){//制定申请
				goal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='reject'"));
			}else{
				goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='reject'"));
			}
			
			
		} else if(action.equals("goback")){//退回
			if(applyType.indexOf("setup")>-1){//制定申请
				goal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='goback'"));
			}else{
				goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='goback'"));
			}
			
			ApprovePostil next_approvePostil = new ApprovePostil();
			next_approvePostil.setAction(approvePostil.getAction());
			next_approvePostil.setApplyType(approvePostil.getApplyType());
			next_approvePostil.setApproveDept(goal.getOwnerDept());
			next_approvePostil.setApprovePerson(goal.getOwnerPerson());
			next_approvePostil.setGoal(goal);
			next_approvePostil.setPhaseNo(approvePostil.getPhaseNo()+1);
			next_approvePostil.setScore(0);
			baseDAO.save(next_approvePostil);
		} else{//同意
			
			User finalApprover = this.getFinalApprover(goal);
			
			if(curUser.getUid() == finalApprover.getUid()){//当前用户是终审人
				if(applyType.indexOf("setup")>-1){//制定申请
					
					
					if(hasRole(curUser,"200") || hasRole(curUser,"300") || hasRole(curUser,"400")){
						//复制目标
						PerformanceGoal newGoal = copyGoal(goal);
						newGoal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='submit'"));
						newGoal.setCreateDept(finalApprover.getBelongDept());
						newGoal.setCreatePerson(finalApprover);
						newGoal.setCreateTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
						newGoal.setOwnerDept(finalApprover.getBelongDept());
						newGoal.setOwnerPerson(finalApprover);
						newGoal.setFinalApprover(this.getFinalApprover(newGoal));
						
						baseDAO.save(newGoal);
					}
					
					goal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='pass'"));
					goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='submit'"));
					
					// 如果有协同部门，其当前审批人是局长或者分管局长
					if(goal.getCoorDeptsJson()!=null && goal.getCoorDeptsJson().length()>0 && (hasRole(curUser,"100") || hasRole(curUser,"101"))){
						
					    // 获取协同部门主键
						String[] coorDepts = goal.getCoorDeptsJson().split(",");
						
						// 循环新增协同目标，为协同目标设置默认值，
						// 制定状态：已完成，自评状态：待提交
						for(int i = 0 ; i < coorDepts.length ; i ++){
							
							Department ownerDept = (Department) baseDAO.findById(Department.class, Integer.parseInt(coorDepts[i]));
							
							PerformanceGoal performGoal = copyGoal(goal);
							
							performGoal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='pass'"));
							performGoal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='submit'"));
							performGoal.setCreateDept(goal.getCreateDept());
							performGoal.setCoorDeptsJson("");
							performGoal.setCreatePerson(goal.getCreatePerson());
							performGoal.setCreateTime(DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss"));
							performGoal.setFinalApprover(curUser);
							performGoal.setOwnerDept(ownerDept);
							performGoal.setOwnerPerson(getUserByRole (ownerDept , "200"));
							performGoal.setIsMajor((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='YesOrNo' and value='false'"));
							performGoal.setRemark("协同目标发出部门："+goal.getOwnerDept().getDeptName());
							baseDAO.save(performGoal);
						}
					}
					
				}else{//自评申请
					goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='pass'"));
					updateGoalScore(goal);
				}
			}else{
				
				int sum = baseDAO.getCount("select count(*) from approve_postil " +
						" where phaseNo="+approvePostil.getPhaseNo() + " " +
						" and approvePerson !="+curUser.getUid()+
						" and getItemValue(applyType)='"+applyType+"'"+
						" and approveTime is null");
				
				if(sum<=0){
					
					Department nextPhaseDept = this.getNextPhaseDept(goal);
					Role nextPhaseRole = this.getNextPhaseRole(goal);
					
					if(nextPhaseDept == null){
						throw new Exception("审批机构不存在");
					}
					if(nextPhaseRole == null){
						throw new Exception("审批角色不存在");
					}
					
					ApprovePostil next_approvePostil = new ApprovePostil();
					next_approvePostil.setAction(approvePostil.getAction());
					next_approvePostil.setApplyType(approvePostil.getApplyType());
					next_approvePostil.setApproveDept(nextPhaseDept);
					next_approvePostil.setApproveRole(nextPhaseRole);
					next_approvePostil.setGoal(goal);
					next_approvePostil.setPhaseNo(approvePostil.getPhaseNo()+1);
					next_approvePostil.setScore(0);
					baseDAO.save(next_approvePostil);
					baseDAO.update(approvePostil);
					
				}
				
			}
			
		}
		baseDAO.update(approvePostil);
		baseDAO.update(goal);
	}
	
	/**
	 * 撤销目标提交
	 * @throws Exception 
	 */
	public String undo(String goalUid,String applyType) {
		
		
		
		PerformanceGoal goal = (PerformanceGoal) baseDAO.findUniqueBySql(PerformanceGoal.class,"select * from performance_goal where uid="+goalUid);
		int count = baseDAO.getCount("select count(*) from approve_postil " +
				"where goal="+goalUid + " " +//当前目标
				"and getItemValue(applyType)='"+applyType+"' " +//申请类型
				"and approveTime is not null " +//批复时间不为空
				"and approvePerson!="+ServletUtil.getCurUser().getUid() 
				);
		
		if(count > 0){
			return "{'success':false,'msg':'目标已审核，不能撤销'}";
		}else{
			List<?> approvePostils = baseDAO.findBySql(ApprovePostil.class,("select * from approve_postil " +
				"where goal="+goalUid + " " +//当前目标
				"and getItemValue(applyType)='"+applyType+"' "//申请类型
			));
			
			for(int i = 0 ; i < approvePostils.size() ; i ++){
				ApprovePostil approvePostil = (ApprovePostil) approvePostils.get(i);
				baseDAO.delete(approvePostil);
			}
			
			if(applyType.indexOf("setup")>-1){
				goal.setBeginStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus1' and value='submit'"));
			}else{
				goal.setEndStatus((CodeLibrary) baseDAO.findUniqueBySql(CodeLibrary.class,"select * from basic_code_library where getCodeNo(codeCatalog)='ApplyStatus2' and value='submit'"));
			}
			baseDAO.update(goal);
			
			return "{'success':true,'msg':'撤销成功'}";
		}
	}
	
	public PerformanceGoal copyGoal(PerformanceGoal goal){
		
		//复制目标
		PerformanceGoal newGoal = new PerformanceGoal();
		newGoal.setBeginStatus(goal.getBeginStatus());
		newGoal.setContent(goal.getContent());
		newGoal.setCoorDeptsJson(goal.getCoorDeptsJson());
		newGoal.setCreateDept(goal.getCreateDept());
		newGoal.setCreatePerson(goal.getCreatePerson());
		newGoal.setCreateTime(goal.getCreateTime());
		newGoal.setDateBatch(goal.getDateBatch());
		newGoal.setEndStatus(goal.getEndStatus());
		newGoal.setFinalScore(goal.getFinalScore());
		newGoal.setFinishStatus(goal.getFinishStatus());
		newGoal.setFullScore(goal.getFullScore());
		newGoal.setGoalType(goal.getGoalType());
		newGoal.setOwnerDept(goal.getOwnerDept());
		newGoal.setOwnerPerson(goal.getOwnerPerson());
		newGoal.setIsMajor(goal.getIsMajor());

		return newGoal;
	}
	
	/**
	 * 批量更新当前目标所在期次和机构的其他目标得分
	 */
	public void updateGoalScore(PerformanceGoal goal){
		int deptUid = goal.getOwnerDept().getUid();
		int batchUid = goal.getDateBatch().getUid();
		
		int count = baseDAO.getCount(" select count(*) from performance_goal " +
				" where ownerDept="+deptUid+
				" and dateBatch="+batchUid+
				" and getItemValue(isMajor)='true'" +
				" and getItemValue(beginStatus)='pass'");

		List<?> approvePostils = baseDAO.findBySql(ApprovePostil.class," select * from approve_postil,performance_goal goal" +
				" where approve_postil.goal = goal.uid" +
				" and goal.ownerDept="+deptUid+
				" and goal.dateBatch="+batchUid+
				" and getItemValue(goal.isMajor)='true'" +
				" and getItemValue(goal.beginStatus)='pass'" +
				" and getItemValue(applyType) like '%selfEva%'" +
				" and evaluation is not null" +
				" order by approve_postil.uid");

		for( int i = 0 ; i < approvePostils.size(); i ++){
			ApprovePostil approvePostil = (ApprovePostil)approvePostils.get(i);
			
			String evaluation = approvePostil.getEvaluation().getValue();
			double score = 0;
			if(evaluation.equals("satisfy")){
				score = 100.00/count;
			} else if (evaluation.equals("base-satisfy")){
				score = 100.00/count * 0.9;
			} else{
				score = 0;
			}
			approvePostil.getGoal().setFinalScore(score);
			baseDAO.update(approvePostil.getGoal());
		}
		
	}
}
