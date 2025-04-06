<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Détails du Film</title>
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

        .buttons {
            margin-top: 8px;
            display: flex;
            gap: 10px;
        }

        a, form button {
            display: inline-block;
            padding: 8px 15px;
            background-color: #f4c542;
            color: #333;
            font-size: 16px;
            text-decoration: none;
            border-radius: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        a:hover, form button:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

        form {
            display: inline-block;
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

            a, form button {
                font-size: 14px;
                padding: 8px 15px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Détails du Film</h1>
        <!-- Afficher les détails du film -->
        <h2>${film.name}</h2>
        <p><strong>Description :</strong> ${film.description}</p>
        <p><strong>Genre :</strong> ${film.genre}</p>

        <a href="home">Retour à l'accueil</a>
    </div>
</body>
</html>