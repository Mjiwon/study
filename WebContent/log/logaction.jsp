<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="beans.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ include file="/layout/top.jspf" %>

<%
	String id = (String)request.getParameter("id");
	String pass = (String)request.getParameter("pass");
	
	AccountDAO dao = new AccountDAO();
	
	Map member = dao.getDataById(id);
	
	int check;
	String str;
	if(member == null || !member.get("pass").equals(pass)){
		check = -1;
		str = "실패";
	}else{
		Set set = (Set)application.getAttribute("users");
		if(set.contains(id)){
			check = 0;
			str ="중복로그인";
		}else{
			check=1;
			str="성공";
			set.add(id);
			
			application.setAttribute("users", set);
			
			session.setAttribute("auth", true);
			session.setAttribute("id", id);
			
			LoginLogDAO ldao = new LoginLogDAO();
			Map log = ldao.pastlog(id);
			
			session.setAttribute("info", member);
			
			if(log!=null){
				session.setAttribute("time", log.get("time"));
			}
			
			ldao.loglist(id);
		}
	}
	
	String wuri = (String)session.getAttribute("uri");
%>
<p>
<%
	switch(str){
	case "성공":

		String red = wuri ==null ? application.getContextPath()+"/mypage/main.jsp" :application.getContextPath()+wuri;
		response.sendRedirect(red);
		break;
	case "실패" : %>
		회원이 아니거나 아이디 또는 비밀번호가 틀리셨습니다<br>	
		아이디 또는 비밀번호를 확인 하세요.<br>
	<a href="<%=application.getContextPath() %>/join/joinin.jsp"><button type="submit">회 원 가 입</button></a>
	<a href="login.jsp"><button type="submit">로 그 인</button></a>
	<%break;
	default :%>
		 이미 로그인이 되어 있습니다.
		 <a href="<%=application.getContextPath() %>/index.jsp"><button type="submit">돌 아 가 기</button></a>
	
	<%}%>
<%-- <%if(check == 1) {
	String red = wuri ==null ? application.getContextPath()+"/mypage/main.jsp" :application.getContextPath()+wuri;
	response.sendRedirect(wuri);
%>
<%} else if(check==-1){%>
	회원이 아니거나 아이디 또는 비밀번호가 틀리셨습니다<br>	
	아이디 또는 비밀번호를 확인 하세요.
	<a href="<%=application.getContextPath() %>/join/joinin.jsp"><button type="submit">회 원 가 입</button></a>
	<a href="login.jsp"><button type="submit">로 그 인</button></a>
<%}else{ %>
	 이미 로그인이 되어 있습니다.
	 <a href="<%=application.getContextPath() %>/index.jsp"><button type="submit">돌 아 가 기</button></a>
<%} %> --%>
</p>
</body>
</html>