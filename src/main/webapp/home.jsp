<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    
    <title>Accueil</title>
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

        /* Styles de formulaire */
        input[type="text"], input[type="number"], button {
            padding: 10px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="number"] {
            -moz-appearance: textfield;
            -webkit-appearance: none;
            appearance: none;
        }

        input[type="number"]::-webkit-inner-spin-button, 
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        button {
            background-color: #f4c542;
            border: none;
            color: #333;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

        /* Styles du bouton de connexion */
        .login-button {
            position: absolute;
            top: 20px;
            right: 20px; /* Coin supérieur droit */
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 20px; /* Padding plus grand pour plus de visibilité */
            background-color: #f4c542;
            color: #333;
            font-size: 18px; /* Taille de la police plus grande */
            text-decoration: none;
            border-radius: 10px;
            text-transform: uppercase;
            font-weight: bold;
            letter-spacing: 1px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
            transition: background-color 0.3s, transform 0.3s;
        }

        .login-button i {
            font-size: 20px; /* Taille de l'icône */
        }

        .login-button:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> <!-- FontAwesome pour les icônes -->
</head>
<body>
    <!-- Bouton de connexion avec icône -->
    <a href="login" class="login-button">
        <i class="fas fa-sign-in-alt"></i> Connexion
    </a>
    
    <div class="container">
        <h1>Bienvenue au Cinéma</h1>
        
        <!-- Formulaire de recherche -->
        <form action="filmDetails" method="get">
            <input type="number" name="id" placeholder="Entrez l'ID du film" required> <!-- Champ de recherche -->
            <button type="submit">Rechercher un film</button>
        </form>

        <!-- Lien pour voir la liste des films -->
        <a href="listFilms">Voir les films</a>
        <a href="reservation?action=showFilms">Sélectionner un film</a>
        <!-- Lien pour ajouter un nouveau film -->
        <a href="addFilm">Ajouter un film</a>
    </div>
</body>
</html>
