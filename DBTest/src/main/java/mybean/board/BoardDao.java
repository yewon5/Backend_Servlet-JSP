package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import mybean.dto.Employee;

public class BoardDao {
	//DB 연결 객체 준비
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	//생성자 준비
	public BoardDao() {
		try {
			ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
		}
		catch(Exception err) {
			System.out.println("연결 객체 생성 실패 : " + err);
		}
	}
	
	//DB연결 해제
	public void freeConn() {
		if(conn != null)
			try {  conn.close(); } catch (SQLException err) {}
		if(stmt != null)
			try { stmt.close(); } catch (SQLException err) {}
		if(rs != null)
			try { rs.close(); } catch (SQLException err) {}
	}

	//List.jsp
	public List<BoardDto> getBoardList(String keyword, String searchText) {
		//DB 데이터 가져오기
		String sql = "";
		
		//배열 객체 생성
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			if(searchText == null || searchText.isEmpty()) { //검색어가 없을 경우. searchText가 null이거나, searchText가 비어있으면 둘 중 하나라도 참이면 실행
				sql = "select * from tblBoard";
			} else { //검색어가 있을 경우
				sql = "select * from tblBoard where " + keyword + " like '%" + searchText + "%'";
			}
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(); //조회한 결과 값
			
			while(rs.next()) { //결과를 여러 개의 객체로 가져와야 하므로 while문을 사용하여 모든 결과를 반복적으로 처리하고 리스트에 추가
				BoardDto Board = new BoardDto(); //Employee 객체 생성. DB에서 조회한 직원 정보가 저장
				Board.setB_num(rs.getInt("b_num"));
				Board.setB_name(rs.getString("b_name"));
				Board.setB_email(rs.getString("b_email"));
				Board.setB_homepage(rs.getString("b_homepage"));
				Board.setB_subject(rs.getString("b_subject"));
				Board.setB_content(rs.getString("b_content"));
				Board.setB_pass(rs.getString("b_pass"));
				Board.setB_count(rs.getInt("b_count"));
				Board.setB_ip(rs.getString("b_ip"));
				Board.setB_regdate(rs.getString("b_regdate"));
				Board.setPos(rs.getInt("pos"));
				Board.setDepth(rs.getInt("depth"));
				
				list.add(Board); //인원수 만큼 반복 돌고 값을 list에 저장
			}
		}
		catch(Exception err) {
			System.out.println("getBoardList()에서 오류 : " + err);
		}
		finally{ 
			//pool.freeConnection(conn, stmt, rs); //중복 코드 처리
			freeConn();
		}
		
		return list;
	}
}



