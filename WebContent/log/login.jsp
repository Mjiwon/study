<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>

<h2>▷ ▶ 로 그 인 ◀ ◁</h2>
	<form action="logaction.jsp" method = "post">
	<div align="center" >	
		<div style="width: 250px; text-align: left; padding: 20px;" >
				아&nbsp;이&nbsp;디&nbsp; : <input type="text" name="id" placeholder="아이디를 입력하세요.">	<br><br>
				패스워드 : <input type="password" name="pass" placeholder="비밀번호입력하세요."><br><br>
		</div>
	</div>
				<button type="submit">로 그 인 </button>	
	</form>
</body>
</html>