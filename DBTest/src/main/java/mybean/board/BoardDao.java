package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import mybean.DBConnectionMgr;

public class BoardDao {
	//DB 연결 객체 준비
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	//생성자 준비
	public BoardDao() {
		try {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
		}
		catch(Exception err) {
			System.out.println("연결 객체 생성 실패 : " + err);
		}
	}
	
	//DB연결 해제
	public void freeConn() {
		if(conn != null)
			try {  conn.close(); } catch (Exception err) {}
		if(stmt != null)
			try { stmt.close(); } catch (Exception err) {}
		if(rs != null)
			try { rs.close(); } catch (Exception err) {}
	}
	
	//getBoardList 메서드 DB에 있는 모든 정보를 list.jsp에 넘겨줌
	public List<BoardDto> getBoardList(String keyword, String searchText){
		String sql = null; 
		
		if(searchText==null || searchText.isEmpty()) {
			sql = "select * from tblboard order by pos"; //b_num desc 가장 최신글이 먼저 보이도록 내림차순 설정
		}
		else {
			sql = "select * from tblboard where " + keyword + 
					" like '%" + searchText +
					"%' order by pos";
		}
	
		ArrayList list = new ArrayList();
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				BoardDto board = new BoardDto();
				board.setB_subject(rs.getString("b_subject"));
				board.setB_count(rs.getInt("b_count"));		
				board.setB_name(rs.getString("b_name"));
				board.setB_num(rs.getInt("b_num"));
				board.setB_regdate(rs.getString("b_regdate"));
				board.setPos(rs.getInt("pos"));
				board.setDepth(rs.getInt("depth"));
				board.setB_email(rs.getString("b_email"));
				board.setB_homepage(rs.getString("b_homepage"));
				board.setB_pass(rs.getString("b_pass"));
				
				list.add(board);
			}
		}
		catch(Exception err) {
			System.out.println("getBoardList() : " + err);
		}
		finally {
			freeConn();
		}
		
		return list;
	}
	
	
	//PostProc.jsp 게시글 저장
	public void setBoard(BoardDto board) {
		String sql = null;
			
		try {
			sql = "update tblboard set pos = pos + 1";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			
			sql = "insert into tblboard(b_num," +
				"b_name, b_email, b_homepage, b_subject, b_content, " +
				"b_pass, b_count, b_ip, b_regdate, pos, depth) " +
				"values(seq_b_num.nextVal, ?,?,?,?,?,?, 0, ?, sysdate, 0, 0)"; //pos랑 depth 0, 0으로 설정
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, board.getB_name());
			stmt.setString(2, board.getB_email());
			stmt.setString(3, board.getB_homepage());
			stmt.setString(4, board.getB_subject());
			stmt.setString(5, board.getB_content());
			stmt.setString(6, board.getB_pass());
			stmt.setString(7, board.getB_ip());
			stmt.executeUpdate();		
		}
		catch(Exception err) {
			System.out.println("setBoard() : " + err);
		}
		finally {
			freeConn();
		}
	}
	
	//Read.jsp, Update.jsp, reply.jsp 게시글 내용 읽기, 수정내용 불러오기, 답글작성
	public BoardDto getBoard(int b_num) {
		String sql;
		BoardDto result = new BoardDto(); //데이터를 묶어서 BoardDto로 포장

		try{
			sql = "select * from tblboard where b_num=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, b_num);
			rs = stmt.executeQuery();

			if(rs.next()){
				result.setB_content(rs.getString("b_content"));
				result.setB_count(rs.getInt("b_count"));
				result.setB_email(rs.getString("b_email"));
				result.setB_homepage(rs.getString("b_homepage"));
				result.setB_ip(rs.getString("b_ip"));
				result.setB_name(rs.getString("b_name"));
				result.setB_num(rs.getInt("b_num"));
				result.setB_pass(rs.getString("b_pass"));
				result.setB_regdate(rs.getString("b_regdate"));
				result.setB_subject(rs.getString("b_subject"));
				result.setPos(rs.getInt("pos"));
				result.setDepth(rs.getInt("depth"));
			}
		}
		catch(Exception err){
			System.out.println("getBoard() : " + err);
		}
		finally{
			freeConn();
		}
		
		return result;
	}
	
	//UpdateProc.jsp 수정내용을 반영
	public void updateBoard(BoardDto dto) {
		String sql = "update tblboard set b_name=?, b_email=?, " +
				"b_subject=?, b_content=? where b_num=?";

		try{
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getB_name());
			stmt.setString(2, dto.getB_email());
			stmt.setString(3, dto.getB_subject());
			stmt.setString(4, dto.getB_content());
			stmt.setInt(5, dto.getB_num());

			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard() : " + err);
		}
		finally{ 
			freeConn();
		}
	}
	
	//Delete.jsp 글 삭제
	public void deleteBoard(int b_num) {
		String sql = "delete from tblBoard where b_num=?";
	
		try{
			conn = ds.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, b_num);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteBoard() : " + err);
		}
		finally{ 
			freeConn();
		}
	}
	
	//ReplyProc.jsp 답변 저장
	public void replyBoard(BoardDto dto) {
		String sql = null;
		
		try {
			sql = "update tblboard set pos = pos + 1 where pos > ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, dto.getPos());
			stmt.executeUpdate();
			
			sql = "insert into tblboard(b_num," +
					"b_name, b_email, b_homepage, b_subject, b_content, " +
					"b_pass, b_count, b_ip, b_regdate, pos, depth) " +
					"values(seq_b_num.nextVal, ?,?,?,?,?,?, 0, ?, sysdate, ?, ?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getB_name());
			stmt.setString(2, dto.getB_email());
			stmt.setString(3, dto.getB_homepage());
			stmt.setString(4, dto.getB_subject());
			stmt.setString(5, dto.getB_content());
			stmt.setString(6, dto.getB_pass());
			stmt.setString(7, dto.getB_ip());
			stmt.setInt(8, dto.getPos() + 1); //부모의 pos + 1
			stmt.setInt(9, dto.getDepth() + 1); //부모의 depth + 1
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("replyBoard : " + err);
		}
		finally {
			freeConn();
		}
	}
	
	//답글 들여쓰기 기능
	public String useDepth(int depth) {
		String result = "";
		for(int i=0; i<depth*3; i++) { //*3 공백을 얼만큼 생기게 할 것인지
			result += "&nbsp;";
		}
		
		return result;
	}
}
	


