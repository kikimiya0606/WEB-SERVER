<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 삭제</title>
</head>
<body>
<%
    // 세션에서 관리자 로그인 여부 확인
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        // 관리자 권한 없으면 차단
        out.println("<p>접근 권한이 없습니다. 관리자 로그인이 필요합니다.</p>");
        out.println("<a href='admin_login.jsp'>로그인 페이지로 이동</a>");
        return;
    }

    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/";
    String databaseName = "loginDB";
    String user = "root";
    String pwd = "dongyang";

    String idToDelete = request.getParameter("id");

    try {
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(dbURL + databaseName, user, pwd);
        Statement stmt = con.createStatement();

        String query = "DELETE FROM login2 WHERE id='" + idToDelete + "'";
        int rowsAffected = stmt.executeUpdate(query);

        if (rowsAffected > 0) {
            out.println("<p>회원(ID: " + idToDelete + ") 삭제 완료!</p>");
        } else {
            out.println("<p>회원(ID: " + idToDelete + ")을 찾을 수 없습니다.</p>");
        }

        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
%>
<a href="member_list.jsp">회원 목록으로 돌아가기</a>
</body>
</html>
