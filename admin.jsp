<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%!
String myUrl = "jdbc:mysql://localhost/safethings";
String ID = "safethings";
String PW = "tpdlvmEld!!@@";
String server_pattern_version = "";
Connection conn;
Statement stmt;
ResultSet rs;
%>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>

<form method="post" action="admin.jsp">
   <table>
    <tr>
      <td class="label"><label for="id">아이디</label>
      <td class="content"><input id="id" name="id" type="text" size="16" 
          maxlength="16" placeholder="ID" autofocus required>
    <tr>
      <td class="label"><label for="password">비밀번호</label>
      <td class="content"><input id="password" name="password" type="password" 
          size="24" placeholder="6~24 숫자&문자" maxlength="24" required>
    <tr>
      <td class="label"><label for="name">권한</label>
      <td class="content"><input id="privilege " name="privilege " type="text" size="20" 
                 maxlength="8" placeholder="normal" required>
    <tr>
      <td class="label"><label for="name">설명</label>
      <td class="content"><input id="description " name="description " type="text" size="64" 
                 maxlength="64" placeholder="설명" required>
    <tr>
      <td class="label"><label for="name">연결유지시간(시간)</label>
      <td class="content"><input id="timeout " name="timeout " type="text" size="20" 
                 maxlength="10" placeholder="1~24" required>
    <tr>
      <td class="label"><label for="name">접근허용 IP</label>
      <td class="content"><input id="access_ip " name="access_ip " type="text" size="128" 
                 maxlength="128" placeholder="0.0.0.0 / 다중입력가능" required> 
              
    <tr>
      <td class="label2" colspan="2"><input type="submit" value="입력완료">
         <input type="reset" value="다시작성">
  </table>
</form>
