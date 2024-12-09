<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 목록</title>
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
%>
<h2>회원 목록</h2>
<%
    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/";
    String databaseName = "loginDB";
    String user = "root";
    String pwd = "dongyang";

    try {
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(dbURL + databaseName, user, pwd);
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM login2";
        ResultSet rs = stmt.executeQuery(query);

        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>이름</th><th>전화번호</th><th>이메일</th><th>삭제</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("id") + "</td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("phone") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td><a href='delete_member.jsp?id=" + rs.getString("id") + "'>삭제</a></td>");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
%>
<a href="init_db.jsp">DB 초기화로 이동</a>
</body>
</html>
