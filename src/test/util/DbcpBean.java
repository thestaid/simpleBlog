package test.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 * Data Basc Connection Pool Bean
 * 
 * - DataBase에 access해서 작업하려면 Connection 객체가 필요하다.
 * - Connection 객체를 Connection pool에 미리 만들어 놓고 필요할때 마다
 * 	 사용하고 반납하는 구조로 사용해야한다.
 * - DbcpBean 객체에서 리턴해주는 Connection 객체를 사용하고 .close()
 * 	 메소드를 호출하면 자동으로 반납된다.
 * 
 */
public class DbcpBean {
	private Connection conn;
	
	//생성자
	//임포트 시켜야한다 위를 봐라
	 public DbcpBean(){
		 
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			//connection pool에서 Connction 객체의 참조값 가지고 오기
			conn = ds.getConnection();
			System.out.println("DbcpBean 작업성공");
			 //etc.
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
	 
	 public Connection getConn(){
		 //멤버필드에 저장된 Connection 객체의 참조값 리턴해준다.
		 return conn;
	 }
}
