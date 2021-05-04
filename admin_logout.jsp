<%@ page language="java" contentType="text/html;charset=utf-8" import = "java.sql.*, java.io.*" %>
<script>
    alert('로그아웃되었습니다!');
</script>
<%
session.invalidate();
response.sendRedirect("../login.jsp");
%>