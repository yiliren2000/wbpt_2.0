package com.lxq.platform.aop;
import java.lang.reflect.Method;

import org.apache.log4j.Logger;
import org.springframework.aop.AfterReturningAdvice;

import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;

/**
 * aop模式记录操作日志
 * @author lixueqing@foxmail.com
 *
 */
public class OperateLogAdvice implements AfterReturningAdvice {
	
	/**
	 * 操作完成后记录操作日志
	 */
  public void afterReturning(Object result,Method method,Object[] args,Object target) throws Throwable {
    
	Logger logger=Logger.getLogger(getClass());
    
    Object entity = args[0];
    String message = (String) args[1];
    User user = ServletUtil.getCurUser();
    String ipAddress = ServletUtil.getIpAddress();
    
    logger.info(user.getUserId()+"-"+user.getUserName()+"    "+DateUtil.getNowTime()
    		+"    "+ipAddress+"    "+method.getName()+"    "+entity.getClass().getName()+"    "+message);
  }
}