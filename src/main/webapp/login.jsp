<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Connexion</title>
    <style>
        /* Styles globaux */
        body {
            font-family: 'Georgia', serif;
            background-color: #222;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('https://img.freepik.com/free-photo/composition-cinema-elements-beige-background-with-copy-space_23-2148416816.jpg?t=st=1735729041~exp=1735732641~hmac=c11eb65952b6be5a3338a1ffe137937f22f56a4d15552311419ca40a65c10dc9&w=900');
            background-size: cover;
            background-position: center;
        }

        .container {
            background: rgba(0, 0, 0, 0.85);
            padding: 20px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 400px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #f4c542;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
            letter-spacing: 1px;
        }

        label {
            font-size: 16px;
            color: #f4c542;
            display: block;
            text-align: left;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            padding: 10px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #f4c542;
            color: #333;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

        .error {
            margin-top: 20px;
            color: #ff4d4d;
            font-size: 14px;
            font-weight: bold;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.6);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Connexion</h1>
        <form action="login" method="post">
            <label for="userName">Nom d'utilisateur :</label>
            <input type="text" id="userName" name="userName" required>
            
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Se connecter</button>
        </form>

        <%-- Afficher un message d'erreur s'il y en a --%>
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
    </div>
</body>
</html>
