<%@page import="java.util.*"%>
<%@ page import="beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao bdao = new BoardDao();
	List<Map> li = bdao.getAllPostList();
%>
<%@ include file="/layout/top.jspf" %>
<h2>게 시 판</h2>
<div align="center">
	<%if(li==null || li.size()==0){ %>
		현재 등록된 글이 없습니다.<br>
	<%}else{%>
<table style="width: 600px; table-layout: inherit;" border = "1" cellspacing = "0">
	<tr style=  "border: 2px black solid; background-color: highlight;">
		<th>No.</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>좋아요</th>
	</tr>	 
		<%for(int i = 0; i<li.size();i++){
			out.write("<tr align = 'center'>");
			Map map = li.get(i);
			Number no = (Number)map.get("NO");
			String writer = (String)map.get("WRITER");
			String title = (String)map.get("TITLE");
			Date leftdate = (Date)map.get("LEFTDATE");
			String content = (String)map.get("CONTENT");
			Number good = (Number)map.get("GOOD");
			String attach = (String)map.get("ATTACH");	
			%>
			<td><%=no %></td>
			<td><a href="<%=application.getContextPath()%>/board/detailpost.jsp?no=<%=no %>" ><%=title %></a></td>
			<td><%=writer %></td>
			<td><%=leftdate %></td>
			<td><%=good %></td>
			</tr>
		<%}%>
		
	<%}%>
</table>
</div>
<div align="center" style="text-align: center; padding: 10px;">
	<a href="<%=application.getContextPath()%>/board/newpost.jsp"><button type="submit">글 쓰 기</button></a>
	<a href="<%=application.getContextPath() %>/mypage/main.jsp""><button type="submit">메 인 으 로</button></a>
</div>

<%@ include file="/layout/lower.jspf"%>