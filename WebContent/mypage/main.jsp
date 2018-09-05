<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%@ page import="beans.*" %>
<%
	AccountDAO adao = new AccountDAO();
	LoginLogDAO ldao = new LoginLogDAO();
	
	Map info = (Map)session.getAttribute("info");
	
	String id = (String)info.get("id");
	


%>
<b><%=info.get("name") %></b>님 환영합니다.<br>
<p style="text-align: right;">
	<a href="<%=application.getContextPath()%>/board/postlist.jsp"><button type="submit">게시판</button></a>	
	<a href="<%=application.getContextPath() %>/message/messagehome.jsp"><button type="submit">메 세 지</button></a>	
	<a href="<%=application.getContextPath() %>/mypage/mypage.jsp"><button type="submit">마 이 페 이 지</button></a>
	<a href="<%=application.getContextPath() %>/log/logout.jsp""><button type="submit">로 그 아 웃</button></a>
</p>
<p>
	<img src="<%=application.getContextPath()%>/image/main.png" style="width: 70%; border-radius: 30px"/>
</p>
</body>
</html>