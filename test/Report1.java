

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.PropertyConfigurator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.lxq.platform.dao.interf.IBaseDAO;
import com.lxq.platform.pto.SelectItem;


public class Report1 {

	public static void main(String[] args) throws IOException{
		
		Properties props = new Properties();
		
		FileInputStream istream = new FileInputStream("./WebRoot/WEB-INF/conf/log4j.properties");
		
		props.load(istream);
		
		istream.close();
	
		// 获取配置文件中log4j.appender.R.File属�?的�?
		String logFile = props.getProperty("log4j.appender.R.File");
		
		// 重新设置log4j.appender.R.File属�?的�?
		props.setProperty("log4j.appender.R.File", "./WebRoot/WEB-INF/logs");

		// 装入log4j配置信息
		PropertyConfigurator.configure(props);
		
		ApplicationContext ctx = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/conf/applicationContext.xml");
		
		IBaseDAO baseDAO = (IBaseDAO) ctx.getBean("baseDAO");
		try {

			List l = baseDAO.findBySql(null,"select * from basic_code_library");
			
			System.out.println(l.size());
//			Menu menu = (Menu) baseDAO.findById(Menu.class, 1);
//			System.out.println(menu.getUid()+"---"+menu.getText());
//			Iterator<Menu> it = menu.getChildMenus().iterator();
//			System.out.println("===="+it.next().getChildMenus().size());
			
			
//			baseDAO.setC(User.class);
//			User user = (User) baseDAO.findUniqueBySql("select * from basic_user where uid=1");
//			System.out.println(user.getUserName());
//			System.out.println(user.getBelongDept().getDeptName());
//			System.out.println(user.getStatus().getText());
//			
//			Iterator<Group> it = user.getGroups().iterator();
//			while(it.hasNext()){
//				System.out.println(it.next().getGroupName());
//			}
//			
//			Iterator<Role> it2 = user.getRoles().iterator();
//			while(it2.hasNext()){
//				System.out.println(it2.next().getRoleName());
//			}
			
//			int count = baseDAO.getCount("select count(*) from basic_user");
//			System.out.println(count);
			
//			User user = new User();
//			user.setUserId("111");
//			user.setUserName("aaaaaaaaa");
//			user.setPassword("bbbbb");
//			
//			baseDAO.save(user);
			
//			User user2 = new User();
//			user2.setUid(42);
//			user2.setUserId("111");
//			user2.setUserName("aaaaaaaaa");
//			user2.setPassword("地对地导弹");
//			baseDAO.update(user2);

//			User user3 = new User();
//			user3.setUid(43);
//			baseDAO.delete(user3);
			
//			List<?> list = baseDAO.findBySql("select * from basic_user");
//			User user = (User) list.get(0);
//			System.out.println(user.getUserName());
			
//			List<?> list = baseDAO.findBySql("select * from basic_user",2,3);
//			User user = (User) list.get(0);
//			System.out.println(user.getUserName());
			
//			baseDAO.setC(User.class);
//			baseDAO.execute("update basic_user set username='dfdfdfdf' where uid=42");
			
//			adapter4.setSql("update basic_user set username='ddfdf打发打发' where uid=42");
//			session.update("com.lxq.platform.pojo.CommonMapper.executeUpdate", adapter4);
//			
//			session.commit();
//		    System.out.println(list.get(0));
//		    
//		    User user = (User) session.selectOne("findByname","博客1");
//			  
//		    System.out.println(user.getName());		    
//
//		    User user1 = new User();
//		    user1.setId(3);
//		    user1.setName("博客3");
//		    user1.setRemark("博客3");
//		    
//    		session.insert("insert", user1);
//			
//    		user1.setName("博客44");
//		    session.update("update", user1);
//		    
//		    User user2 = new User();
//		    user2.setId(3);
//		    user2.setName("博客2");
//		    session.delete("delete",user2);
//		  User user = (User) session.selectOne("org.mybatis.example.UserMapper.selectUser", "1");
//		  
//		  System.out.println(user.getName());
		
		} finally {
//		  session.close();
		}
	}
}
