<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedHashSet"%>
<%@ include file="/layout/top.jspf" %>
<%
	session.invalidate();
%>
<p>
	로그아웃 되셨습니다.<br>
	<a href="<%=application.getContextPath() %>/index.jsp"><button type="submit">돌 아 가 기</button></a>
</p>

<%@ include file="/layout/lower.jspf"%>