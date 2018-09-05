<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<form action="sendaction.jsp" method="post">
	<p>
		받을 사람 : <br>
		<input type = "text" name="userid" placeholder="받으시는분 아이디를 입력해주세요." style="width: 220px; padding: 5px;"/>
	</p>
	<p>
		보낼 내용 : <br>
		<textarea name="message" style="height:300px; width: 220px; padding: 5px; resize: none;"placeholder="메세지를 입력해주세요." ></textarea>
	</p>
	<button type="submit">전 송</button>
</form>
 