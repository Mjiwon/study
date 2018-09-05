<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<h2>비밀번호 재설정</h2>
<form action="passchangeaction.jsp">
	현재 비밀번호 : <br>
	<input type="password" name="pass" style="padding: 5px;"><br>
	변경할 비밀번호 : <br>
	<input type="password" name="newpass1" style="padding: 5px;"><br>
	비밀번호 재확인 : <br>
	<input type="password" name="newpass2" style="padding: 5px;"><br>
	<button type="submit">비 밀 번 호 변 경</button>
</form>

<%@ include file="/layout/lower.jspf"%>