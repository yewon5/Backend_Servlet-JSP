<%@ page contentType="text/html; charset=UTF-8" %>
[머리말]<br>
<!-- 새로운 객체를 생성하는 것이 아니라 incl에서 만들어진 객체를 가져오는 것. 인스턴스가 없으면 새로 생성하지만 만들어져 있으면 incl객체를 참조한다. 단, 똑같이 선언해야함 -->
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"></jsp:useBean>
<jsp:getProperty property="header" name="incl" />