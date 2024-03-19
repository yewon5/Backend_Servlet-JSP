package mybean.dao;
/*
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mybean.dto.Employee;

//CRUD 기능의 DAO패턴. DB와 연결해주는 클래스
public class EmployeeDao {
	
	//DB와 연결하기 위한 객체 생성
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	//DB연결 생성자
	public EmployeeDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111"); 
		}
		catch(Exception err) {
			System.out.println("연결 객체 생성 실패 : " + err);
		}
		
	}
	
	//close 중복 처리 해주기 위한 메서드
	public void freeConn() {
		if(conn != null)
			try {  conn.close(); } catch (SQLException err) {}
		if(stmt != null)
			try { stmt.close(); } catch (SQLException err) {}
		if(rs != null)
			try { rs.close(); } catch (SQLException err) {}
	}
	
	//addEmp_proc.jsp
	public void setEmp(Employee emp) { //dto를 만들지 않았으면 매개변수를 필드 수 많큼 넣어줘야 된다..
		String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass," + 
				"e_address) values(seq_eno.nextVal, ?,?,?,?)";
		
		//DB 연결할때는 예외 발생을 대비하여 항상 try-catch로 묶어준다.
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_id());
			stmt.setString(2, emp.getE_name());
			stmt.setString(3, emp.getE_pass());
			stmt.setString(4, emp.getE_address());
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("setEmp()에서 오류 : " + err);
		}
		//DB는 동시접속자 수의 한계가 있다. 그래서 접속을 끊어 줘야함
		finally{ 
			freeConn(); //중복 코드 처리
		}
	}

	//updateEmp.jsp 조회하는 기능. 액션태그로 호출 할 수 없다. 1. 값이 여러개 2.게터메서드에 매개변수가 있으면 안됨
	public Employee getEmp(String no) { //메서드를 만든 이유 : 결과값을 리턴받기위해 
		String sql = "select * from tblEmp where e_no=?"; //DB에서 조회
		Employee emp = null;
				
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, no);
			rs = stmt.executeQuery(); //조회한 결과 값
			
			if(rs.next()) { //if문 조회 결과가 있으면 1명의 데이터를 가져와서 객체에 저장 
				emp = new Employee(); //Employee 객체 생성. DB에서 조회한 직원 정보가 저장
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
			}
			
			//return emp; //리턴을 해줬는데 오류가 나는 이유 try 안에 있기때문에 예외발생시 리턴이 실행되지 않기때문에 try밖으로 빼준다.
		}
		catch(Exception err) {
			System.out.println("getEmp()에서 오류 : " + err);
		}
		//DB는 동시접속자 수의 한계가 있다. 그래서 접속을 끊어 줘야함
		finally{ 
			freeConn(); //중복 코드 처리
		}
		
		return emp; //밖으로 빼줬을때 emp에 오류나는 이유는 지역변수이기 때문에. 상단에 변수 선언해주면 된다.
	}
	
	//updateEmp_proc.jsp
	public void updateEmp(Employee emp) { //emp수정하려는 데이터(updateEmp_proc.jsp)가 넘어온 상태
		String sql = "update tblEmp set e_name=?, e_pass=?, e_address=? where e_no=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_name());
			stmt.setString(2, emp.getE_pass());
			stmt.setString(3, emp.getE_address());
			stmt.setString(4, emp.getE_no());
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("updateEmp()에서 오류 : " + err);
		}
		finally{ 
			freeConn(); //중복 코드 처리
		}
	}
	
	//deleteEmp.jsp
	public void setDeleteEmp(String no) {
		String sql = "delete from tblEmp where e_no=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, no);
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("setDeleteEmp()에서 오류 : " + err);
		}
		finally{ 
			freeConn(); //중복 코드 처리
		}
	}
	
	//index.jsp
	public ArrayList<Employee> getList(String keyword, String searchText) { //Employee객체의 리턴값을 배열로 묶음
		String sql = ""; //DB의 모든 데이터를 가져와야함 PK가 사번이라서 사번으로 기본 정렬이 되어있고, 이름,아이디 등 따로 설정해줄 수 있음
		//배열 객체 생성
		ArrayList<Employee> list = new ArrayList<Employee>();
				
		try {
			if(searchText == null || searchText.isEmpty()) { //검색어가 없을 경우. searchText가 null이거나, searchText가 비어있으면 둘 중 하나라도 참이면 실행
				sql = "select * from tblEmp order by e_no";
			} else { //검색어가 있을 경우
				sql = "select * from tblEmp where " + keyword + " like '%" + searchText + "%'";
			}
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(); //조회한 결과 값
			
			while(rs.next()) { //결과를 여러 개의 객체로 가져와야 하므로 while문을 사용하여 모든 결과를 반복적으로 처리하고 리스트에 추가
				Employee emp = new Employee(); //Employee 객체 생성. DB에서 조회한 직원 정보가 저장
				emp.setE_no(rs.getString("e_no"));
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
				
				list.add(emp); //인원수 만큼 반복 돌고 값을 list에 저장
			}
		}
		catch(Exception err) {
			System.out.println("getList()에서 오류 : " + err);
		}
		finally{ 
			freeConn(); //중복 코드 처리
		}
		
		return list;
	}
}
*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mybean.DBConnectionMgr;
import mybean.dto.Employee;

//CRUD 기능의 DAO패턴. DB와 연결해주는 클래스
public class EmployeeDao {
	
	//DB와 연결하기 위한 객체 생성
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	//private DBConnectionMgr pool;
	private DataSource ds;
	
	public EmployeeDao() {
		try {
			//DBCP는 DB랑 직접 연결하는 것이 아니라 DB 연결 객체를 불러와서 사용한다.
			//pool = DBConnectionMgr.getInstance();
			//conn = pool.getConnection(); //연결객체 빌려오기
			
			ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
		}
		catch(Exception err) {
			System.out.println("연결 객체 생성 실패 : " + err);
		}
	}
	
	public void freeConn() {
		if(conn != null)
			try {  conn.close(); } catch (SQLException err) {}
		if(stmt != null)
			try { stmt.close(); } catch (SQLException err) {}
		if(rs != null)
			try { rs.close(); } catch (SQLException err) {}
	}

	//addEmp_proc.jsp
	public void setEmp(Employee emp) { //dto를 만들지 않았으면 매개변수를 필드 수 많큼 넣어줘야 된다..
		String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass," + 
				"e_address) values(seq_eno.nextVal, ?,?,?,?)";
		
		//DB 연결할때는 예외 발생을 대비하여 항상 try-catch로 묶어준다.
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_id());
			stmt.setString(2, emp.getE_name());
			stmt.setString(3, emp.getE_pass());
			stmt.setString(4, emp.getE_address());
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("setEmp()에서 오류 : " + err);
		}
		//DB는 동시접속자 수의 한계가 있다. 그래서 접속을 끊어 줘야함
		finally{ 
			//pool.freeConnection(conn, stmt); //Connection, prepareStatement 연결 해제
			freeConn();
		}
	}

	//updateEmp.jsp 조회하는 기능. 액션태그로 호출 할 수 없다. 1. 값이 여러개 2.게터메서드에 매개변수가 있으면 안됨
	public Employee getEmp(String no) { //메서드를 만든 이유 : 결과값을 리턴받기위해 
		String sql = "select * from tblEmp where e_no=?"; //DB에서 조회
		Employee emp = null;
				
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, no);
			rs = stmt.executeQuery(); //조회한 결과 값
			
			if(rs.next()) { //if문 조회 결과가 있으면 1명의 데이터를 가져와서 객체에 저장 
				emp = new Employee(); //Employee 객체 생성. DB에서 조회한 직원 정보가 저장
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
			}
			
			//return emp; //리턴을 해줬는데 오류가 나는 이유 try 안에 있기때문에 예외발생시 리턴이 실행되지 않기때문에 try밖으로 빼준다.
		}
		catch(Exception err) {
			System.out.println("getEmp()에서 오류 : " + err);
		}
		//DB는 동시접속자 수의 한계가 있다. 그래서 접속을 끊어 줘야함
		finally{ 
			//pool.freeConnection(conn, stmt, rs);
			freeConn();
		}
		
		return emp; //밖으로 빼줬을때 emp에 오류나는 이유는 지역변수이기 때문에. 상단에 변수 선언해주면 된다.
	}
	
	//updateEmp_proc.jsp
	public void updateEmp(Employee emp) { //emp수정하려는 데이터(updateEmp_proc.jsp)가 넘어온 상태
		String sql = "update tblEmp set e_name=?, e_pass=?, e_address=? where e_no=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_name());
			stmt.setString(2, emp.getE_pass());
			stmt.setString(3, emp.getE_address());
			stmt.setString(4, emp.getE_no());
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("updateEmp()에서 오류 : " + err);
		}
		finally{ 
			//pool.freeConnection(conn, stmt); //중복 코드 처리
			freeConn();
		}
	}
	
	//deleteEmp.jsp
	public void setDeleteEmp(String no) {
		String sql = "delete from tblEmp where e_no=?";
		
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, no);
			
			stmt.executeUpdate();
		}
		catch(Exception err) {
			System.out.println("setDeleteEmp()에서 오류 : " + err);
		}
		finally{ 
			//pool.freeConnection(conn, stmt); //중복 코드 처리
			freeConn();
		}
	}
	
	//index.jsp
	public ArrayList<Employee> getList(String keyword, String searchText) { //Employee객체의 리턴값을 배열로 묶음
		String sql = ""; //DB의 모든 데이터를 가져와야함 PK가 사번이라서 사번으로 기본 정렬이 되어있고, 이름,아이디 등 따로 설정해줄 수 있음
		//배열 객체 생성
		ArrayList<Employee> list = new ArrayList<Employee>();
				
		try {
			if(searchText == null || searchText.isEmpty()) { //검색어가 없을 경우. searchText가 null이거나, searchText가 비어있으면 둘 중 하나라도 참이면 실행
				sql = "select * from tblEmp order by e_no";
			} else { //검색어가 있을 경우
				sql = "select * from tblEmp where " + keyword + " like '%" + searchText + "%'";
			}
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(); //조회한 결과 값
			
			while(rs.next()) { //결과를 여러 개의 객체로 가져와야 하므로 while문을 사용하여 모든 결과를 반복적으로 처리하고 리스트에 추가
				Employee emp = new Employee(); //Employee 객체 생성. DB에서 조회한 직원 정보가 저장
				emp.setE_no(rs.getString("e_no"));
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
				
				list.add(emp); //인원수 만큼 반복 돌고 값을 list에 저장
			}
		}
		catch(Exception err) {
			System.out.println("getList()에서 오류 : " + err);
		}
		finally{ 
			//pool.freeConnection(conn, stmt, rs); //중복 코드 처리
			freeConn();
		}
		
		return list;
	}
}
