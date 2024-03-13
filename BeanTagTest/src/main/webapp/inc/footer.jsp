<%@ page contentType="text/html; charset=UTF-8" %>
[꼬리말]<br>
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"></jsp:useBean>
<jsp:getProperty property="footer" name="incl" />