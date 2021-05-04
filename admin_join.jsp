<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>join user</title>
</head>
<body>
  <form name="Join" action="admin_joinset.jsp" method="post">
<center>
  <table border=1>
    <tr>
    <td colspan="2" align=center bgcolor="pink">
    <b><font size=5>사용자 추가</font></b>
    </td>
    </tr>
    <tr><td>아이디 </td><td><input type="text" name="id"></td></tr>
    <tr><td>비밀번호 </td><td><input type="password" name="password"></td></tr>
    <tr><td>권한 </td>
    <td><select name = "privilege">
        <option value = "non" selected="selected"> 권한 선택 </option>
        <option value = "basic User"> 일반 사용자 </option>
        <option value = "Policy Manager"> 정책 관리자 </option>
        <option value = "admin"> ADMIN </option>
        </select></td></tr>
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
