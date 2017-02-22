package users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.util.DbcpBean;
import users.dto.UsersDto;

public class UsersDao {
	//객체를 담을 static 필드
	private static UsersDao dao;
	
	//생성자
	private UsersDao(){
		
	}
	
	//객체를 생성할 메소드
	public static UsersDao getInstance(){
		if(dao==null){
			dao=new UsersDao();
		}
		return dao;
	}//getInstance
	 
	public boolean insert(UsersDto dto){
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO hp_users VALUES(?, ?, ?, SYSDATE)";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		if(flag>0){
			return true;
		}else{
			return false;
		}
	}//insert
	
	public boolean isValid(UsersDto dto){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean isValid=false;
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT * FROM hp_users WHERE id=? AND pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs=pstmt.executeQuery();
			if(rs.next()){
				isValid=true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		return isValid;
	}//isValid
	
	public UsersDto getData(String id){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		UsersDto dto=null;
		try {
			conn=new DbcpBean().getConn();
			String format="'YYYY\"년\"MM\"월\"DD\"일\" DAY HH\"시\" MI\"분\" SS\"초\"'";
			String sql="SELECT id,pwd,email,TO_CHAR(regdate, "+format+") regdate "
					+ "FROM hp_users WHERE id=?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));;
				dto.setRegdate(rs.getString("regdate"));
			}		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dto;
	}//getdata
	
	public boolean delete(String id){
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM hp_users WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(flag>0){
			return true;
		}else{
			return false;
		}
	}//delete
	
	public boolean update(UsersDto dto){
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE hp_users SET pwd=?, email=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			flag = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(flag>0){
			return true;
		}else{
			return false;
		}
	}//update
	
	public List<UsersDto> getList(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<UsersDto> list=new ArrayList<>();
		try {
			conn=new DbcpBean().getConn();
			String format="'YYYY\"년\"MM\"월\"DD\"일\" DAY HH\"시\" MI\"분\" SS\"초\"'";
			String sql="SELECT id,email,TO_CHAR(regdate, "+format+") regdate "
					+ "FROM hp_users ORDER BY id ASC";		
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				String id=rs.getString("id");
				String email=rs.getString("email");
				String regdate=rs.getString("regdate");
				
				UsersDto dto=new UsersDto();
				dto.setId(id);
				dto.setEmail(email);
				dto.setRegdate(regdate);
				
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
	}//getList

}
