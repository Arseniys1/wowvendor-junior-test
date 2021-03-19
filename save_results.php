<?php

require_once "config.php";

if ($_SERVER["REQUEST_METHOD"] !== "POST") exit();

$arguments_list = [
    'result',
    'rockSize',
    'rockPosition',
    'jumpDistanceStart',
    'jumpDistanceStop',
    'raceTime',
];

$errors_arr = [];

foreach ($arguments_list as $value) {
    if (!array_key_exists($value, $_POST) || !is_numeric($_POST[$value])) {
        $errors_arr[] = "Требуется значение " . $value;
    }
}

if (count($errors_arr) > 0) {
    foreach ($errors_arr as $error) {
        echo $error . "<br>";
    }
    exit();
}

$game_result = intval($_POST["result"]);
$rock_size = intval($_POST["rockSize"]);
$rock_position = intval($_POST["rockPosition"]);
$jump_distance_start = intval($_POST["jumpDistanceStart"]);
$jump_distance_stop = intval($_POST["jumpDistanceStop"]);
$race_time = floatval($_POST["raceTime"]);

$dsn = "mysql:host=%s;port=%s;dbname=%s;charset=%s";
$dsn = sprintf($dsn, $config["host"], $config["port"], $config["db"], $config["charset"]);

try {
    $dbh = new PDO($dsn, $config["username"], $config["password"]);

    $stmt = $dbh->prepare("INSERT INTO game_results (game_result, rock_size, rock_position, jump_distance_start, jump_distance_stop, race_time) VALUES (:game_result, :rock_size, :rock_position, :jump_distance_start, :jump_distance_stop, :race_time)");
    $stmt->bindParam(":game_result", $game_result);
    $stmt->bindParam(":rock_size", $rock_size);
    $stmt->bindParam(":rock_position", $rock_position);
    $stmt->bindParam(":jump_distance_start", $jump_distance_start);
    $stmt->bindParam(":jump_distance_stop", $jump_distance_stop);
    $stmt->bindParam(":race_time", $race_time);
    $stmt->execute();
} catch (PDOException $e) {
    echo "Ошибка БД попробуйте позже!";
    exit();
}

echo "OK!";