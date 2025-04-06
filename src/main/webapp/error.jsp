<%@ page isErrorPage="true" %>
<html>
<head>
<link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Erreur</title>
</head>
<body>
    <h1>Une erreur est survenue lors de votre réservation.</h1>
    <p><strong>Message d'erreur :</strong> ${error}</p> <!-- Afficher le message d'erreur passé depuis le servlet -->
    <h3>Détails :</h3>
    <pre>${exception}</pre> <!-- Optionnellement afficher la pile d'appels si une exception est passée -->
</body>
</html>