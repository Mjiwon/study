<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%@ page import="beans.*" %>

<%
	MessageDAO mdao = new MessageDAO();
	String id = (String)session.getAttribute("id");
	String user = request.getParameter("users");
	
	List<Map> message = mdao.getMessage(id,user);
	List mlist = mdao.messageList(id,user);
	System.out.println("id = " + id + "   user = " + user);
	Map usermessage = message.get(0);
	String ms= (String)usermessage.get("content");
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
	if(usermessage.get("senddate")!=null){
		session.setAttribute("check", "읽음");
	}
%>
<h2>메세지 확인</h2>
<div align="center">
	<div style="width: 250px; text-align: left; padding: 20px;">
	<p>
		보낸 사람 : <b><%=user %></b><br>
		보낸날짜 : <%=sdf.format(usermessage.get("senddate")) %><br>
		내용 : <br>
		<%=mlist==null ? "-" : mlist %><br>
	</p>
	</div>
</div>
<a href="<%=application.getContextPath() %>/message/messagehome.jsp"><button type="submit">돌 아 가 기</button></a>
</body>
</html>