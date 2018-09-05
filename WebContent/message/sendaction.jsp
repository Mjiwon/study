<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%@ page import="beans.*" %>
<%@ page import="java.sql.Date" %>
<%
	MessageDAO mdao = new MessageDAO();
	String id = (String)session.getAttribute("id");
	String user = request.getParameter("userid");
	String ms = request.getParameter("message");
	Date now = new Date(System.currentTimeMillis());
	mdao.sendMessage(id, user, ms, now);
%>
<p>
	<%=user %>님에게<br>
	<%=ms %><br>
	로 메세지가 보내졌습니다.
	<a href="<%=application.getContextPath() %>/message/messagehome.jsp"><button type="submit">돌 아 가 기</button></a>
</p>
</body>
</html>