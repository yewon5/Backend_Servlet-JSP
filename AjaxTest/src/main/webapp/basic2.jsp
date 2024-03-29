<%@ page contentType="text/html; charset=UTF-8" %>

<%
	String[] news = {"'빗길에 30분 뛰었다'…사라진 시내버스에 출근길 '대란'",
					"애플카 종언? 바퀴 달린 아이폰 '꿈'에 그칠까",
					"[단독]'피해자만 700명' 계좌 돌려가며 먹튀…전국 40곳서 신고 속출" };
%>

<%
	for(String s : news){
%>
	<%=s %>:
<%
	}
%>