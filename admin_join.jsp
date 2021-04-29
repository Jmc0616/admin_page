<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<form name="Join" action="admin_set.jsp" method="post">
<center>
<table border=1>
<tr>
<td colspan="2" align=center bgcolor="pink">
<b><font size=5>사용자 추가</font></b>
</td>
</tr>
<tr><td>아이디 </td><td><input type="text" name="id"></td></tr>
<tr><td>비밀번호 </td><td><input type="password" name="password"></td></tr>
<tr><td>권한 </td><td><input type="text" name="privilege"></td></tr>
<tr><td>설명 </td><td><input type="text" name="description"></td></tr>
<tr><td>연결 유지 시간(시간) </td><td><input type="text" name="timeout"></td></tr>
<tr><td>접근 허용 IP </td><td><input type="text" name="access_ip"></td></tr>
<tr>
  <td colspan="2" align=center>
  <input type="submit" value="추가"> 
  </td>
</tr>
</table>
</center>
</form>
</body>
</html>
