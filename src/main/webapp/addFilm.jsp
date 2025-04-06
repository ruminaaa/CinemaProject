<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Ajouter un Film</title>
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
            max-width: 450px;
            text-align: center;
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #f4c542;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
            letter-spacing: 1px;
        }

        label {
            display: block;
            margin-bottom: 12px;
            font-size: 18px;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 14px;
            margin-bottom: 25px;
            border: 2px solid #f4c542;
            border-radius: 8px;
            background-color: #444;
            color: #fff;
            font-size: 16px;
            font-family: 'Georgia', serif;
        }

        input[type="text"]:focus, textarea:focus {
            outline: none;
            border-color: #f4c542;
            background-color: #555;
        }

        button {
            background-color: #f4c542;
            color: #333;
            border: none;
            padding: 15px;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-family: 'Georgia', serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

        .back-link {
            display: block;
            margin-top: 25px;
            color: #f4c542;
            font-size: 16px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #d4b02c;
            text-decoration: underline;
        }

        /* Réactivité mobile */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                max-width: 90%;
            }

            h1 {
                font-size: 28px;
            }

            button {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Ajouter un Nouveau Film</h1>
        <form action="addFilm" method="post">
            <!-- Champ caché pour spécifier l'action d'ajout d'un film -->
            <input type="hidden" name="action" value="addFilm">
            
            <label for="name">Nom du Film :</label>
            <input type="text" id="name" name="name" required>

            <label for="description">Description :</label>
            <input type="text" id="description" name="description" required>

            <label for="genre">Genre :</label>
            <input type="text" id="genre" name="genre" required>

            <button type="submit">Ajouter le Film</button>
        </form>

        <a href="home" class="back-link">Retour à l'accueil</a>
    </div>
</body>

</html>
