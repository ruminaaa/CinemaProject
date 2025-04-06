<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Tableau de Bord de l'Utilisateur</title>
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
            max-width: 800px;
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

        h2 {
            font-size: 22px;
            margin-bottom: 20px;
            color: #f4c542;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.6);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #f4c542;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4c542;
            color: #222;
        }

        tr:nth-child(even) {
            background-color: #333;
        }

        tr:nth-child(odd) {
            background-color: #444;
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

        a {
            display: inline-block;
            padding: 8px 15px;
            background-color: #f4c542;
            color: #333;
            font-size: 16px;
            text-decoration: none;
            border-radius: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 20px;
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
        <h1>Bienvenue, ${userName}!</h1>
        <h2>Votre Solde : ${balance} DT</h2>

        <form action="dashboard" method="post">
            <label for="debitAmount">Montant à diposer :</label>
            <input type="number" id="debitAmount" name="debitAmount" required>
            <button type="submit">Diposer</button>
        </form>

        <h2>Vos Réservations :</h2>

        <c:if test="${empty reservations}">
            <p>Vous n'avez pas encore fait de réservations.</p>
        </c:if>

        <c:if test="${not empty reservations}">
            <table>
                <thead>
                    <tr>
                        <th>Film</th>
                        <th>Date</th>
                        <th>Nombre de Places</th>
                        <th>Tarif</th>
                        <th>Salle</th>
                    </tr>
                </thead>
                <tbody>
                 <c:forEach var="reservation" items="${reservations}">
    <tr>
        <td>${reservation.seance.salleprog.film.name}</td>
        <td>${reservation.seance.horaire}</td>
        <td>${reservation.nbrPlaces}</td>
        <td>${reservation.totalCost}</td>
        <td>${reservation.seance.salleprog.salle.name} - ${reservation.seance.salleprog.salle.address}</td>
        <td>
            <!-- Cancel Button -->
            <form action="cancelReservation" method="post">
                <input type="hidden" name="reservationId" value="${reservation.id}">
                <button type="submit">Cancel</button>
            </form>
        </td>
    </tr>
</c:forEach>


                </tbody>
            </table>
        </c:if>

        <a href="logout">Se Déconnecter</a>

        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
    </div>
</body>
</html>
