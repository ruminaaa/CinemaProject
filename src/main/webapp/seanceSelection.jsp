<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>S�lectionner une S�ance</title>
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
            max-width: 500px;
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

        .seance-form {
            text-align: left;
        }

        .seance-form p {
            margin: 10px 0;
            color: #f4c542;
        }

        select, input[type="number"], input[type="text"], input[type="password"], input[type="submit"] {
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

        .back-link {
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
            text-align: center;
        }

        .back-link:hover {
            background-color: #d4b02c;
            transform: scale(1.05);
        }

    </style>
</head>
<body>

    <div class="container">
        <h1>S�lectionner une S�ance pour le Film: ${film.name}</h1>

        <!-- Parcourir salleProgs pour afficher les informations de chaque Salle -->
        <c:forEach var="salleProg" items="${salleProgs}">
            <div class="seance-form">
                <!-- Afficher le nom et l'adresse de la Salle -->
                <p><strong>Nom de la Salle :</strong> ${salleProg.salle.name}</p>
                <p><strong>Adresse de la Salle :</strong> ${salleProg.salle.address}</p>

                <form action="reservation" method="POST">
                    <input type="hidden" name="action" value="reserve">
                    <input type="hidden" name="filmId" value="${film.id}">
                    <input type="hidden" name="salleId" value="${salleProg.salle.id_salle}">

                    <!-- Liste d�roulante pour les S�ances -->
                    <label for="seanceId">S�lectionner une S�ance :</label>
                    <select name="seanceId" required>
                        <c:forEach var="seance" items="${salleProg.seances}">
                            <option value="${seance.id_seance}">
                                ${seance.horaire} - Places r�serv�es : ${seance.places}
                            </option>
                        </c:forEach>
                    </select>

                    <!-- Autres champs de saisie -->
                    <label for="nbrPlaces">Nombre de Places :</label>
                    <input type="number" name="nbrPlaces" required min="1">

                    <label for="username">Nom d'utilisateur :</label>
                    <input type="text" name="username" required>

                    <label for="password">Mot de passe :</label>
                    <input type="password" name="password" required>

                    <input type="submit" value="R�server">
                </form>
            </div>
            <hr>
        </c:forEach>

        <a href="reservation?action=showFilms" class="back-link">Retour � la s�lection des films</a>
    </div>

</body>
</html>
