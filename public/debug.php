<?php
echo '<h1>Debug</h1>';
echo '<h2>APP_KEY:</h2><pre>' . (getenv('APP_KEY') ?: 'NOT SET') . '</pre>';
echo '<h2>DB vars:</h2><pre>';
echo 'DB_CONNECTION: ' . (getenv('DB_CONNECTION') ?: 'NOT SET') . "\n";
echo 'DB_HOST: ' . (getenv('DB_HOST') ?: 'NOT SET') . "\n";
echo 'DB_PORT: ' . (getenv('DB_PORT') ?: 'NOT SET') . "\n";
echo 'DB_DATABASE: ' . (getenv('DB_DATABASE') ?: 'NOT SET') . "\n";
echo 'DB_USERNAME: ' . (getenv('DB_USERNAME') ?: 'NOT SET') . "\n";
echo 'DB_PASSWORD: ' . (getenv('DB_PASSWORD') ?: 'SET (hidden)') . "\n";
echo '</pre>';
echo '<h2>Extensions:</h2><pre>';
echo 'pgsql: ' . (extension_loaded('pgsql') ? 'YES' : 'NO') . "\n";
echo 'pdo_pgsql: ' . (extension_loaded('pdo_pgsql') ? 'YES' : 'NO') . "\n";
echo 'pdo: ' . (extension_loaded('pdo') ? 'YES' : 'NO') . "\n";
echo '</pre>';
