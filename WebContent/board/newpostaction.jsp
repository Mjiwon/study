<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.Part"%>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="com.oreilly.servlet.multipart.MultipartParser"%>
<%@page import="beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao bdao = new BoardDao();

	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");
	Map data = new HashMap();
	
	String id = (String)session.getAttribute("id");
	
	
	while(true){
		Part part = parser.readNextPart();
		System.out.println("part = " + part);
		if(part==null){
			break;
		}else{
			if(part.isFile()){
				FilePart file = (FilePart)part;
				
				String name = file.getFileName();
				long time = System.currentTimeMillis();
				File saveDir = new File(application.getRealPath("/storage"),String.valueOf(time));
				saveDir.mkdirs();
				file.writeTo(saveDir);
				String uri = application.getContextPath() + "/storage/"+time+"/"+name;
				System.out.println(uri);
				data.put("attach", uri);
			}else{
				ParamPart param = (ParamPart)part;
				data.put(param.getName(),param.getStringValue());
				System.out.println(param.getName() + "\t" + param.getStringValue());
			}
		}
	}
	System.out.println(data);
	int n = bdao.addPosts(data);
%>


<%@ include file="/layout/top.jspf" %>
	<p>
	<%if(n==1) {%>
		작성하신 글이 게시되었습니다.<br>
	<%}else{ %>
		작성에 실패하셨습니다.<br>
	<%} %>
	<a href="<%=application.getContextPath()%>/board/postlist.jsp"><button type="submit">글목록</button></a>
	</p>
<%@ include file="/layout/lower.jspf"%>