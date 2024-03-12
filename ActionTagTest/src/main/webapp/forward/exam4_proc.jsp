<%
	request.setCharacterEncoding("utf-8");

	String toWhere = "kr.jsp";
	String lang = "korean";
	String from = request.getRemoteAddr(); //ip주소 받기
	
	if(from.endsWith("127.0.0.1")){ //주어진 문자열이 특정 문자열로 끝나는지 여부를 확인하는 데 사용
		toWhere = "en.jsp";
		lang = "english";
	}
%>

<jsp:forward page="<%=toWhere%>">
	<jsp:param name="lang" value="<%=lang%>" />
</jsp:forward>