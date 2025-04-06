<%@ page isErrorPage="true" %>
<html>
<head>
<link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Erreur</title>
</head>
<body>
    <h1>Une erreur est survenue lors de votre r�servation.</h1>
    <p><strong>Message d'erreur :</strong> ${error}</p> <!-- Afficher le message d'erreur pass� depuis le servlet -->
    <h3>D�tails :</h3>
    <pre>${exception}</pre> <!-- Optionnellement afficher la pile d'appels si une exception est pass�e -->
</body>
</html>