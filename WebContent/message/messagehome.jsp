<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%@ page import="beans.*" %>
<%
	MessageDAO mdao = new MessageDAO();
	String id = (String)session.getAttribute("id");
	List ids = mdao.getReceiveId(id);
	
	String check = (String)session.getAttribute("check");
%>
<h2>받은 메세지</h2>
<div align="center">
	<div style="width: 260px; text-align: left; padding: 20px;">
<ul>
	<%
	if(ids!=null){
		for(Iterator i = ids.iterator(); i.hasNext();) {
			String users = (String)i.next();
			application.setAttribute("users", users);
			%>
			보내는 사람 : <br>
			<li><%=ids %> : <a href="messages.jsp?users=<%=users%>">메세지 확인</a><small><%=check==null? "<b>▷ 안읽음</b>" : "<b>▷ <font style=\"color: red;\">" +check+ "</font></b>" %></small></li> 
		<%} 
	
	}else{%>
</ul>
	<p>
		받은 메세지가 없습니다.
	</p>		
	<%} %>
	</div>
</div>
<a href="<%=application.getContextPath() %>/message/send.jsp"><button type="submit">메세지 보내기</button></a>
<a href="<%=application.getContextPath() %>/mypage/main.jsp"><button type="submit">메 인 가 기</button></a>

<%@ include file="/layout/lower.jspf"%>