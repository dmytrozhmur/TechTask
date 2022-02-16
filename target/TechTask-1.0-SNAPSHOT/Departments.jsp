<%@ page import="dbtools.DataBaseHandler" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Tamada
  Date: 06.02.2022
  Time: 00:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Departments</title>
</head>
<body>
    <h1>List of departments</h1>
    <form>
    <%
        DataBaseHandler dbHandler = new DataBaseHandler();
        ResultSet departmentQueries = dbHandler.getAllRecords("department");
        try {
            int counter = 0;
            while (departmentQueries.next()) {
    %>
    <p>
        <input type="radio" id="departmentChoice + <%=++counter%>>" name="department">
        <label for="departmentChoice + <%=counter%>>">
            <%= departmentQueries.getString("name") %>
            <%= departmentQueries.getString("foundation_date") %>
        </label>
    </p>
    <%
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    %>
    </form>
   
</body>
</html>
