<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 로그인</title>
</head>
<body>
<h2>관리자 로그인</h2>
<%
    // 관리자 계정 정보 (DB로 관리할 수도 있음)
    String adminId = "admin";
    String adminPass = "admin123";

    // 로그인 폼에서 전달된 데이터 받기
    String inputId = request.getParameter("id");
    String inputPass = request.getParameter("password");

    if (inputId != null && inputPass != null) {
        if (inputId.equals(adminId) && inputPass.equals(adminPass)) {
            // 로그인 성공: 세션에 관리자 정보 저장
            session.setAttribute("isAdmin", true);
            out.println("<p>관리자로 로그인되었습니다.</p>");
            out.println("<a href='member_list.jsp'>회원 목록으로 이동</a>");
        } else {
            // 로그인 실패
            out.println("<p>아이디 또는 비밀번호가 잘못되었습니다.</p>");
        }
    }
%>
<form method="post" action="admin_login.jsp">
    <label for="id">아이디:</label>
    <input type="text" name="id" id="id" required><br>
    <label for="password">비밀번호:</label>
    <input type="password" name="password" id="password" required><br>
    <button type="submit">로그인</button>
</form>
</body>
</html>
