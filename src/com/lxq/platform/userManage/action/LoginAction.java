package com.lxq.platform.userManage.action;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.userManage.service.intef.IUserService;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {

	/**用户编号*/
    private String userId;
    /**密码*/
    private String password;
    
    /*用户服务对象*/
    private IUserService userService;
	
    /**
     * 用户登陆
     * @return
     */
	@SuppressWarnings("unchecked")
	public String login() {
		
		boolean success = true;
		String msg = "登陆成功！";
		
		User user = userService.findUserByUserId(userId);
		
		if(!userService.hasUser(user)){//校验用户是否存在
			
			success = false;
			msg = "用户号不存在！";
		
		}else if(!user.getStatus().getValue().equals("valid")){//校验用户是否失效
		
			success = false;
			msg = "用户已停用！";
		
		}else if(!userService.checkPassword(user,password)){////校验密码是否正确
		
			success = false;
			msg = "密码错误！";
		
		}else{//成功操作
			
			ServletContext context = ServletActionContext.getServletContext();
			List<HttpSession> onlineList = (List<HttpSession>) context.getAttribute("onlineList");//获取登录用户列表
			
			HttpSession curSession = ServletActionContext.getRequest().getSession();
			onlineList.add(curSession);
			
			String loginTime = DateUtil.getNowTime("yyyy-MM-dd HH:mm:ss");//登陆时间
			String ipAddress = ServletActionContext.getRequest().getRemoteAddr();//登陆ip
			
			curSession.setAttribute("userMenus", userService.getUserMenus(user));//将用户菜单放到session中
			curSession.setAttribute("loginTime", loginTime);//将登录时间放到session中
			curSession.setAttribute("ipAddress", ipAddress);//将登录时间放到session中
			curSession.setAttribute("curUser", user);//将当前用户放到session中
			curSession.setAttribute("curDept", user.getBelongDept());//将当前机构放到session中

			userService.login(user, loginTime, ipAddress);
		}
		
		String str_json = "{'success':"+success+",'msg':'"+msg+"'}";
		
		ServletUtil.responseText(str_json);
		return null;
	}

	/**
	 * 刷新用户缓存
	 * @return
	 */
	public void refreshUserCache(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		User curUser = (User)session.get("curUser");
		
		curUser = (User)userService.findById(User.class, curUser.getUid());
		
		session.put("userMenus", userService.getUserMenus(curUser));//将用户菜单放到session中
		session.put("curUser", curUser);//将当前机构放到session中
		session.put("curDept", curUser.getBelongDept());//将当前机构放到session中
	}
	
	/**
	 * 退出系统
	 * @return
	 */
	public String logout(){
		//session过期
		ServletActionContext.getRequest().getSession().invalidate();
		
		return SUCCESS;
	}
	
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
