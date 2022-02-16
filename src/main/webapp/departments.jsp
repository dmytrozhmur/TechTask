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
        String chosenName = "";
        String chosenDate = "";
        try {
            int counter = 0;
            while (departmentQueries.next()) {
                String name = departmentQueries.getString("name");
                String date = departmentQueries.getString("foundation_date");
    %>
    <p>
        <input type="radio" id="departmentChoice + <%=++counter%>>" name="department" onclick="<%
            chosenName = name;
            chosenDate = date;
        %>">
        <label for="departmentChoice + <%=counter%>>">
            <%= name %>
            <%= date %>
        </label>
    </p>
    <%
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    %>
    </form>
    <form method="post" action="editDepartment.jsp?departmentName=<%=chosenName%>&departmentFoundationDate=<%=chosenDate%>">
        <button>Редактировать</button>
    </form>

</body>
</html>
