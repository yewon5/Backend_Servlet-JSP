package mybean.dao;

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
			try { conn.close(); } catch (SQLException err) {}
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
			
			if(rs.next()) {
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
	public ArrayList<Employee> getList() {
		return null;
	}
}
