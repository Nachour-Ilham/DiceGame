<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bo.GameState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game App</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">

</head>
<body style="background-color: rgba(201,201,211,0.6);">
<div class="container">
    <div class="text-center">
        <h4>Utilisateur connecté:<c:out value="${sessionScope.gameState.user.nom}"/></h4>
        <p>Entrez le numéro du dé à lancer, puis cliquez sur le bouton ci-dessous :</p>

        <form action="${pageContext.request.contextPath}/back/GameServlet" method="POST" class="form-inline">
            <div class="form-group">
                <label for="diceNumber">Numéro de dé :</label>
                <select name="diceNumber" class="form-control" required>
                    <option value="none">Choisissez un dé</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Lancer le dé</button>
        </form>
    </div>
</div>
<br>
<div class="col">
    <div>
        <table>
            <c:forEach items="${sessionScope.dices}" var="dices">
                <tr>
                    <td>Dice n°${dices.getDiceNumber()}=${dices.getDiceResult()}</td>
                </tr>
            </c:forEach>
        </table>

    </div>
</div>
</body>
</html>
