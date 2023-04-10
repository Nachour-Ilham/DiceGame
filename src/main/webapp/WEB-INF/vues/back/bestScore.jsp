<%@page import="com.bo.User" %>
<%@page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">

    <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
    <title>App Game</title>
</head>
<body style="background-color: rgba(201,201,211,0.6);">
<h3 style="text-align: center; font-size: 20px; color: rgb(4,119,166); margin-top: 7%;">Meilleur scores</h3>
<table class="table" style="background-color: #fcfbfb">
    <thead>
    <tr>
        <th>Nom</th>
        <th>Score</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        for (User it : users) { %>
    <tr>
        <td><%= it.getNom() %>
        </td>
        <td><%= it.getBestScore() %>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>


</body>
</html>