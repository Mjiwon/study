<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<p>
	로그아웃 하시겠습니까?
	<a href="<%=application.getContextPath() %>/mypage/main.jsp""><button type="submit">돌 아 가 기</button></a>
	 <a href="<%=application.getContextPath() %>/log/logoutaction.jsp""><button type="submit">로 그 아 웃</button></a>
</p>

<%@ include file="/layout/lower.jspf"%>