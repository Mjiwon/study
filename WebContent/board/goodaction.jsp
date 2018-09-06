<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	String id = request.getParameter("actor");
	
	GoodDao gdao = new GoodDao();
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	Map m = new HashMap();
	
	m.put("actor", id);
	m.put("target", no);
	
	int n = gdao.addGoodLog(m);
	
	boolean check;
	System.out.println("n"+n);
	if(n==1){
		check = gdao.goodByNo(no);
	}else{
		check= false;
	}
	System.out.println(check);
	
%>
<%@ include file="/layout/top.jspf" %>
<%if(check){ 
	response.sendRedirect(application.getContextPath()+"/board/detailpost.jsp?no="+no);
	
	}else{ %>
		이미 추천하신 글입니다.
<a href="<%=application.getContextPath()%>/board/detailpost.jsp?no=<%=no %>" ><button type="submit">돌아가기</button></a>
<%} %>
<%@ include file="/layout/lower.jspf"%>