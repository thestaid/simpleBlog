package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	//생성자 객체 담을수 있는 필드
	private static BoardDao dao;
	
	//생성자
	private BoardDao(){}
	
	public static BoardDao getInstance(){
		if(dao==null){
			dao=new BoardDao();
		}
		return dao;
	}
	
	public List<BoardDto> getList(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDto> list=new ArrayList<>();
		try {
			conn=new DbcpBean().getConn();
			String format="'YYYY\"년\"MM\"월\"DD\"일\" DAY HH\"시\" MI\"분\" SS\"초\"'";		
			String sql="SELECT num,writer,title,TO_CHAR(regdate, "+format+") regdate"
					+" FROM hp_board ORDER BY num DESC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String regdate=rs.getString("regdate");
				
				BoardDto dto=new BoardDto();
				dto.setNum(num);
				dto.setWriter(writer);
				dto.setTitle(title);
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
	
	public boolean insert(BoardDto dto){
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO hp_board (num, writer, title, content, regdate) "
					+"VALUES(hp_board_seq.NEXTVAL, ?, ?, ?, SYSDATE)";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			flag=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
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
	}//insert
	
	public BoardDto getData(int num){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDto dto=null;		
		try {
			conn=new DbcpBean().getConn();
			String format="'YYYY\"년\"MM\"월\"DD\"일\" DAY HH\"시\" MI\"분\" SS\"초\"'";		
			String sql="SELECT writer,title,content,TO_CHAR(regdate, "+format+") regdate"
					+" FROM hp_board WHERE num=?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String regdate=rs.getString("regdate");
				
				dto=new BoardDto();
				dto.setNum(num);
				dto.setWriter(writer);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setRegdate(regdate);
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
		return dto;
	}//getdata
	
	public boolean delete(int num){
		PreparedStatement pstmt = null;
		Connection conn = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM hp_board WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public boolean update(BoardDto dto){
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE hp_board SET title=?, regdate=SYSDATE, content=? WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
	}//update
}
