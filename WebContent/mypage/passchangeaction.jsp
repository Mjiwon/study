<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@ page import="beans.*" %>
<%@ include file="/layout/top.jspf" %>
<%
	Map info = (Map)session.getAttribute("info");
	AccountDAO adao = new AccountDAO();
	String id = (String)session.getAttribute("id");
	String dbpass = (String)info.get("pass");
	String pass = request.getParameter("pass");
	String newpass1 = request.getParameter("newpass1");
	String newpass2 = request.getParameter("newpass2");
	
	System.out.println(pass + ".." + newpass1 +".." + newpass2);
	int check = 0;
	if(pass.equals(dbpass)){
		if(newpass1.equals(newpass2)){
			check = 0;		
			adao.setPassword(id, newpass1);
		}else{
			check=-1;
		}
	}else{
		check = 1;
	}
%>
<%if(check==0) {%>
	<p>
		비밀번호가 변경 되었습니다.<br>
		재로그인 해주세요<br>
		<a href="<%=application.getContextPath() %>/log/login.jsp"><button type="submit">로 그 인</button></a>
	</p>
<%}else if(check==1){ %>
	<p>
		비밀번호를 틀리셨습니다.<br>
		다시 입력 해 주세요.<br>
		<a href="<%=application.getContextPath() %>/mypage/passchange.jsp"><button type="submit">돌 아 가 기</button></a>
	</p>
<%}else{ %>
	<p>
		변경할 비밀번호가 다릅니다.<br>
		다시 입력 해 주세요 <br>
		<a href="<%=application.getContextPath() %>/mypage/passchange.jsp"><button type="submit">돌 아 가 기</button></a>
	</p>
<%} %>

<%@ include file="/layout/lower.jspf"%>