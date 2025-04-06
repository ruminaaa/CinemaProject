<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Résultats de la Recherche</title>
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
            background-image: url('https://example.com/cinema-background.jpg');
            background-size: cover;
            background-position: center;
            background-blur: 5px;
        }

        .container {
            background: rgba(0, 0, 0, 0.85);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #f4c542;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
            letter-spacing: 1px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            text-align: left;
        }

        li {
            background-color: rgba(255, 255, 255, 0.1);
            margin: 10px 0;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
            color: #f4c542;
            transition: background-color 0.3s, transform 0.3s;
        }

        li:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }

        /* Responsabilité mobile */
        @media (max-width: 600px) {
            .container {
                padding: 20px 30px;
                max-width: 90%;
            }

            h1 {
                font-size: 28px;
            }

            li {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Résultats de la Recherche</h1>
        <ul>
            <c:forEach var="film" items="${films}">
                <li>${film.name}</li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
