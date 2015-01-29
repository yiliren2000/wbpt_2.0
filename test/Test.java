

import java.io.IOException;

import com.lxq.platform.exception.PrivilegeException;

public class Test {

	public static void main(String[] args) throws IOException{
		try{
			throw new PrivilegeException("jkjkkjkj");
		} catch(PrivilegeException e){
			System.out.println(e.getMessage());
		}
		
	
	}
}