<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*"%>
<%@ include file="/layout/top.jspf" %>


<%
	String name = (String)request.getParameter("name");
	String id = (String)request.getParameter("id");
	String pass = (String)request.getParameter("pass");
	String gender = (String)request.getParameter("gender");
	
	
	boolean check = false;
	if(name.contains(" ")||!name.matches("[가-힣]+")||!id.matches("\\w{4,12}")||!pass.matches("\\w{4}")){
		check = false;
	}else{
		check=true;
		AccountDAO dao = new AccountDAO();
		int n = dao.addData(id, pass, name, gender);
		System.out.println(n);
	}
	
	
%>
<h3>회원가입 결과</h3>
<%if(check==false){ %>
	회원가입 시 참고사항을 다시 한번 확인 후 회원가입 해주세요.<br>
		<b style="color: red;">참고사항</b><br>
	<ul style="list-style: inside;">
		<li> 아이디는 영문,숫자 4~12자 내외</li>
		<li> 이름은 공백 없이 한글만 설정 &emsp;</li>
		<li> 비밀번호는 4자 이상으로 설정&emsp;</li>   
	</ul>
		 <a href="<%=application.getContextPath() %>/join/joinin.jsp"><button type="submit">회 원 가 입</button></a>
<%}else{ %>
<p>
	안녕하세요 <b><%=name %></b>님 환영합니다!<br/>
	가입에 <b style="color: red;">성공</b>하셨습니다.<br>
</p>
 <a href="<%=application.getContextPath() %>/log/login.jsp"><button type="submit">로  그  인</button></a>
<%} %>
</body>
</html>