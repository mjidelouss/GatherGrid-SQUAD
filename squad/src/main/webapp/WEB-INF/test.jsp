<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 20/10/2023
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1> hello
${
    user.getFirstName()
}
</h1>
<a href="manage-profile">
    Manage profile
</a>

<a href="logout">Logout</a>

</body>
</html>
