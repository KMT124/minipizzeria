<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Pizzerii</title>
    <style>
        /* Resetowanie stylów */
body, h1, h2, p, ul, li, table {
    margin: 0;
    padding: 0;
}

/* Podstawowe style strony */
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f8f8f8;
    color: #333;
}

header {
    background-color: #ff6347;
    color: #fff;
    text-align: center;
    padding: 1em 0;
}

h1 {
    font-size: 3em;
}

section {
    max-width: 900px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

h2 {
    color: #ff6347;
    font-size: 2em;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

th {
    background-color: #ff6347;
    color: #fff;
}

/* Formularz logowania */
#login {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 10px;
    color: #333;
}

input {
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    background-color: #ff6347;
    color: #fff;
    padding: 12px;
    cursor: pointer;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #d14029;
}

/* Stopka */
footer {
    text-align: center;
    padding: 1em 0;
    background-color: #333;
    color: #fff;
    position: fixed;
    bottom: 0;
    width: 100%;
}
</style>
</head>

<body>
    <header>
        <?php
        session_start();

        // Sprawdź, czy użytkownik jest zalogowany
        if (isset($_SESSION['username'])) {
            // Wyświetl ID użytkownika i nazwę użytkownika, jeśli są dostępne
            $userIDDisplay = isset($_SESSION['user_id']) ? '<span>ID: ' . $_SESSION['user_id'] . '</span>' : '';
            $usernameDisplay = isset($_SESSION['username']) ? '<span>Nazwa użytkownika: ' . $_SESSION['username'] . '</span>' : '';

            echo $userIDDisplay;
            echo $usernameDisplay;
            echo '<a href="logout.php" class="account-link">Wyloguj się</a>';
            echo '<a href="order_history.php" class="account-link">Historia zamówień</a>';
        } else {
            echo '<a href="login_register.php" class="account-link">Zaloguj się</a>';
        }

        ?>
        <h1>Menu Pizzerii</h1>
        
        <!-- Odnośnik do strony zarządzania zamówieniami -->
        <a href="orders_management.php" class="admin-link">Zarządzanie Zamówieniami</a>
    </header>

    <section>
        <h2>Pizze</h2>
        <?php
        // Pobierz menu pizzy z bazy danych
        include 'config.php';
        $query = "SELECT * FROM pizza_menu";
        $result = $mysqli->query($query);

        if ($result->num_rows > 0) {
            echo '<ul>';
            while ($row = $result->fetch_assoc()) {
                echo "<li><strong>{$row['name']}</strong> - {$row['price']} zł</li>";
            }
            echo '</ul>';
        } else {
            echo "<p>Brak dostępnych pizz.</p>";
        }

        // Pobierz user_id z sesji
        $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : '';

        $mysqli->close();
        ?>
    </section>

    <section>
        <h2>Zamówienie</h2>
        <form action="process_order.php" method="POST">
            <!-- Dodaj ukryte pole z user_id -->
            <input type="hidden" name="user_id" value="<?php echo $user_id; ?>">

            <label for="name">Imię:</label>
            <input type="text" id="name" name="name" required value="<?php echo isset($_SESSION['username']) ? $_SESSION['username'] : ''; ?>" readonly>

            <label for="address">Adres:</label>
            <input type="text" id="address" name="address" required value="<?php echo $_SESSION['address'] ?? ''; ?>">

            <label for="pizza">Wybierz pizzę:</label>
            <select id="pizza" name="pizza" required>
                <?php
                // Wygeneruj dynamicznie opcje wyboru pizzy z bazy danych
                include 'config.php';
                $query = "SELECT * FROM pizza_menu";
                $result = $mysqli->query($query);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $selected = ($row['name'] == $_SESSION['pizza']) ? 'selected' : '';
                        echo "<option value='{$row['name']}' $selected>{$row['name']} - {$row['price']} zł</option>";
                    }
                }

                $mysqli->close();
                ?>
            </select>

            <button type="submit">Złóż zamówienie</button>
        </form>
    </section>
</body>

</html>

                