<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>
<h2>▷ ▶ 회 원 가 입 ◀ ◁</h2>
	
	<font size="2" >
	<b style="color: red;">참고사항</b><br>
	<ul style="list-style: inside;">
		<li> 아이디는 영문,숫자 4~12자 내외</li>
		<li> 이름은 공백 없이 한글만 설정 &emsp;</li>
		<li> 비밀번호는 4자 이상으로 설정&emsp;</li>   
	</ul>
	</font>
	<form action="joinaction.jsp" method="post">
	<div align="center" >	
		<div style="width: 250px; text-align: center; padding: 20px;" >
				이름 : <br><input type="text" name="name" style="padding: 5px;" placeholder="이름을 입력해주세요."> <br> <br>
				아이디 :<br> <input type="text" name="id" style="padding: 5px;" placeholder="아이디를 입력하세요.">	<br><br>
				패스워드 :<br> <input type="password" name="pass"style=" padding: 5px;" placeholder="비밀번호입력하세요."><br><br>
<!-- 				성별(M/F) : <select name="gender">
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select><br><br> -->
				성별(M/F):<br>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="M" checked/><span style="font-size: 16px; padding: 5px">남성</span>
				<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="F"/><span style="font-size: 16px; padding: 5px">여성</span>
		</div>
	</div>
				<button type="submit">회 원 가 입</button>
				<a href="<%=application.getContextPath() %>/log/login.jsp"><button type="submit">로  그  인</button></a>
	</form>

</body>
</html>