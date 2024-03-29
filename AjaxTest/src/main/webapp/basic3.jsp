<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String userNum = request.getParameter("userNum");
	String name="", gender="", addr="", tel="";

	if(userNum.equals("1")){
		name = "박해일";
		gender = "남성";
		addr ="서울시 강북구";
		tel = "111-1111";		
	}
	else if(userNum.equals("2")){
		name = "이제훈";
		gender = "남성";
		addr ="서울시 강남구";
		tel = "222-2222";
	}
	else if(userNum.equals("3")){
		name = "연두부";
		gender = "여성";
		addr ="서울시 강동구";
		tel = "333-3333";
	}
%>

<%=name%>,<%=gender%>,<%=addr%>,<%=tel%>