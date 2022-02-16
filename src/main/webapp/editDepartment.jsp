<%--
  Created by IntelliJ IDEA.
  User: Tamada
  Date: 16.02.2022
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editing</title>
</head>
<body>
    <%
        String primaryKey = request.getParameter("departmentName");
    %>
    <form>
        <input id="nameField" value="<%=primaryKey%>">
        <input id="dateField" value="<%=request.getParameter("departmentFoundationDate")%>">
        <input type="submit">
    </form>
</body>
</html>
