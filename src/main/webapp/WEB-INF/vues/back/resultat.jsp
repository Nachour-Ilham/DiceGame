<%@ page import="com.bo.GameState" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/style/result.css" rel="stylesheet">
<html>
<head>
    <meta charset="UTF-8">
    <title>Game App</title>

</head>
<body style="background-color: rgba(201,201,211,0.6);">
<%
    GameState gameState = (GameState) request.getSession().getAttribute("gameState");

    if (gameState != null && gameState.getUser() != null) {
        out.print("mon score: " + Math.max(gameState.getUser().getBestScore(), gameState.getUser().getScore()));
    }
%>

<table>
    <c:forEach items="${sessionScope.dices}" var="dices">
        <tr>
            <td>Dice n°${dices.getDiceNumber()}=${dices.getDiceResult()}</td>
        </tr>
    </c:forEach>
</table>


<%
    session.removeAttribute("dices");
%>
<br>
<br>
<br>
<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/back/bestScore"><i class="fas fa-trophy"></i> Meilleurs
            scores</a></li>
        <li><a href="${pageContext.request.contextPath}/back/ReinitGameServlet"><i class="fas fa-redo"></i>
            Réinitialiser le jeu</a></li>
        <li><a href="${pageContext.request.contextPath}/DeconnectServlet"><i class="fas fa-sign-out-alt"></i> Se
            déconnecter</a></li>
    </ul>
</nav>

</body>
</html>
