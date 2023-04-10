<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>App Game</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/style/signin.css" rel="stylesheet">

</head>
<body style="background-color: rgba(201,201,211,0.6);">
<h3 style="text-align: center; font-size: 20px; color: rgb(4,119,166); margin-top: 7%;">Inscription</h3>
<div class="container">
    <form class="form-signin" method="POST"
          action="${pageContext.request.contextPath}/UserManagementServlet">

        <label for="inputName" class="sr-only">Nom</label>
        <input type="text" class="form-control" placeholder="Entrez votre nom" required autofocus name="nom">
        <small class="form-text text-muted">Veuillez entrer votre nom complet</small>

        <label for="inputEmail" class="sr-only">Login</label>
        <input type="text" class="form-control" placeholder="Login" required autofocus name="login">

        <label for="inputPassword" class="sr-only">Mot de passe</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Entrez votre password"
               name="password" required>

        <button class="btn btn-lg btn-primary btn-block" style="color: #fcfbfb; " type="submit">S'inscrire</button>

    </form>
</div>
</body>
</html>



