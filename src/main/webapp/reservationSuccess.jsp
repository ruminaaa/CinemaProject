<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons8-film-projector-16.png" type="image/x-icon">
    <title>Reservation Success</title>
    <style>
        /* Global Styles */
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

        p {
            font-size: 18px;
            color: #fff;
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
    <h1>Votre réservation a été réussie !</h1>
    <p>Merci pour votre réservation !</p>
    <a href="home" class="back-link">Retour à l'accueil</a>
</div>


</body>
</html>
