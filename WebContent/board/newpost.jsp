<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<%
	String id = (String)session.getAttribute("id");
%>
	<div align="center">
	<div style="text-align: left; width: 550px;">
	<form action = "newpostaction.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name = "writer" value = "<%=id %>">
		작성자 : <%=id %> <br>
		제&emsp;목 : <input type="text" name = "title" style="padding: 5px;"/><br>
		게시글 : <br>
		<textarea name="content" style="height: 300px; width: 500px; padding: 5px; resize: none;" placeholder="글을 작성해 주세요."></textarea>
		<br>
		첨부파일 : <input type="file" name = "attach"/><br>

		<button type="submit" >작성</button>
		<a href="<%=application.getContextPath()%>/board/postlist.jsp"><button type="submit">취소</button></a>

	</form>
	</div>
	</div>
<%@ include file="/layout/lower.jspf"%>