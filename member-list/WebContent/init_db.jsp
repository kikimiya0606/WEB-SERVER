<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 초기화</title>
</head>
<body>
<h2>DB 초기화</h2>
<%
    // JDBC 설정
    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/";
    String databaseName = "loginDB"; // 데이터베이스 이름
    String user = "root";
    String pwd = "dongyang";

    try {
        // MySQL 드라이버 로드
        Class.forName(driverName);

        // MySQL 서버에 연결
        Connection con = DriverManager.getConnection(dbURL, user, pwd);
        Statement stmt = con.createStatement();

        // 데이터베이스 생성
        stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName);
        out.println("데이터베이스 생성 완료<br>");

        // 생성된 데이터베이스로 연결
        con = DriverManager.getConnection(dbURL + databaseName, user, pwd);

        // 테이블 생성
        String createTableSQL =
            "CREATE TABLE IF NOT EXISTS login2 (" +
            "id VARCHAR(20), " +
            "name VARCHAR(20), " +
            "pass VARCHAR(20), " +
            "phone VARCHAR(20), " +
            "email VARCHAR(30)" +
            ")";
        stmt = con.createStatement();
        stmt.executeUpdate(createTableSQL);
        out.println("테이블 생성 완료<br>");

        // 연결 종료
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
%>
<a href="member_list.jsp">회원 관리 페이지로 이동</a>
</body>
</html>
