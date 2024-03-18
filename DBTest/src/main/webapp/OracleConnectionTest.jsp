<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 연결 테스트</title>
</head>
<body>

	<h1>오라클 연결 테스트</h1>
	
	<%
		Connection conn = null; //Connection 객체는 데이터베이스와의 연결을 나타냄.
	
		try{
			//DB를 사용하기위해 가장 먼저 해야하는 일. 
			//클래스이름이 클래스임(java.lang) 로드,실행시키기위해 forName 클래스의 OracleDriver를 메모리로 올려놓겠다 
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			//jdbc:oracle:thin: 드라이버 이름. @localhost: DB서버가 설치된 ip,도메인 주소. 1521: 오라클의 포트번호. xe 내가 접속할 DB이름
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			//DriverManager sql패키지의 클래스 
			//OracleDriver를 참고해서 실제 DB와 연결을 시도해주는 getConnection메서드. url:DB의 주소
			conn = DriverManager.getConnection(url, "scott", "1111"); 
			//연결 성공하면 인스턴스가 생성되고 conn에 주소값이 저장된다. null이면 인스턴스가 생성되지 않았기 때문에 연결 실패. getConnection 리턴 값이 Connection객체
			
			if(conn != null){
				out.println("<h2>연결 성공</h2>");
			}
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			conn.close();
		}
	%>
</body>
</html>