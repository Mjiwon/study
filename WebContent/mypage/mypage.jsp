<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%@ page import="beans.*" %>
<%
	AccountDAO adao = new AccountDAO();
	LoginLogDAO ldao = new LoginLogDAO();
	
	Map info = (Map)session.getAttribute("info");
	
	String id = (String)info.get("id");
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
	Date time = (Date)session.getAttribute("time");


%>
<h2>마 이 페 이 지</h2>
<p>
	<b>이름 :</b>  <%=info.get("name") %><br><br>
	<b>아이디 :</b> <%=info.get("id") %><br><br>
	<b>비밀번호 :</b>
	<a href="<%=application.getContextPath() %>/mypage/passchange.jsp"><button type="submit">비밀번호 재설정</button></a><br><br>
	<b>성별 :</b> <%=info.get("gender") %><br><br>
	<b>최근 접속 시간 :</b><br><br>
		<%=time==null? "-":sdf.format(time)%><br><br>
		<a href="<%=application.getContextPath() %>/mypage/main.jsp""><button type="submit">메 인 으 로</button></a>
		<a href="<%=application.getContextPath() %>/log/logout.jsp""><button type="submit">로 그 아 웃</button></a>
<font style="color: red;"></font>
</p>

</body> 
</html>