package com.lxq.platform.servlet;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lxq.platform.workflow.FlowCatalog;
import com.lxq.platform.workflow.pojo.FlowNode;

/**
 * 系统初始化
 * 
 * @author lixueqing
 * 
 */
@SuppressWarnings("serial")
public class Initialization extends HttpServlet {

	public static ServletContext context;

	/**
	 * servlet初始化调用
	 * @return
	 */
	public void init(ServletConfig config){
		context = config.getServletContext();
		//获取项目名称,并存放到ServletContext中
		String path = context.getContextPath();
		context.setAttribute("path", path);
		
		//创建登录用户列表,并存放到ServletContext中
		context.setAttribute("onlineList", new ArrayList<HttpSession>());
		loadSystemConfig();
		loadFlowModel();
	}

	/**
	 * 重新加载系统资源
	 * @return
	 */
	protected  void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException{
		
		loadSystemConfig();
		loadFlowModel();
	}
	
    /**
     * 加载系统资源
     * @return
     * @throws IOException 
     */
	public void loadSystemConfig(){
		
		try {
			//读取系统配置文件，并将系统配置信息存放到ServletContext中
			Properties props = new Properties();
			InputStream is = new FileInputStream(context.getRealPath("/")+"WEB-INF/conf/sysConfig.properties");
			props.load(is);
			context.setAttribute("sysConfig", props);
			is.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 加载流程模板
	 * @return
	 * @throws IOException 
	 */
	public void loadFlowModel(){
			
		Map<String,FlowNode> flowNodes = new HashMap<String ,FlowNode> ();
		FlowCatalog.flowNodes = flowNodes ;
	}
	
}
