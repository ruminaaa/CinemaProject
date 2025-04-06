<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Sélectionner un Film</title>
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
            margin-bottom: 15px;
            color: #f4c542;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
            letter-spacing: 1px;
        }

        select, input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #f4c542;
            border: none;
            color: #333;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

        a {
            display: block;
            padding: 8px 15px;
            background-color: #f4c542;
            color: #333;
            font-size: 16px;
            text-decoration: none;
            border-radius: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 10px 0;
            transition: background-color 0.3s, transform 0.3s;
        }

        a:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Sélectionner un Film</h1>
        <form action="reservation" method="GET">
            <input type="hidden" name="action" value="showSeances">
            <select name="filmId">
                <c:forEach var="film" items="${films}">
                    <option value="${film.id}">${film.name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Voir les Séances">
        </form>
        <a href="home">Retour à l'accueil</a>
    </div>

</body>
</html>
