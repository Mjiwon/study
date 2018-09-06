<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
	String id = (String)session.getAttribute("id");
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao bdao = new BoardDao();
	Map one = bdao.getOneByNo(no);
%>
<%@ include file="/layout/top.jspf" %>
<%if(one==null){ %>
	<p>
		이미 삭제된 게시글이거나 DB장애로 인해 데이터를 불러올 수 없습니다.
	</p>
<%} else{%>
	<p style="text-align: left">
		<b style="font-size: large;"><%=one.get("TITLE") %></b>
	</p>
	<p style="text-align: left">
		<small><i>작성자</i> <%=one.get("WRITER") %> / <i>작성일</i> <%=one.get("LEFTDATE") %>  / <i>추천</i> <%=one.get("GOOD") %></small>
	</p>
	<hr/>
	<p style="text-align: left; min-height: 300px; font-size: smaller; "> 
		<%= ((String)one.get("CONTENT")).replace("\n", "<br/>") %>
	</p>
	<hr/>
	<p style="text-align: left">
		<%if(one.get("ATTACH") != null) { %>
		첨부파일 :   <a href="<%=application.getContextPath() %><%=one.get("ATTACH") %>" download >다운로드</a>
		<%} %>
	</p>
<%} %>
<a href="<%=application.getContextPath()%>/board/goodaction.jsp?actor=<%=id %>&no=<%=no%>"><button type="submit">추천</button></a>
<a href="<%=application.getContextPath()%>/board/postlist.jsp"><button type="submit">글목록</button></a>

<%@ include file="/layout/lower.jspf" %>
