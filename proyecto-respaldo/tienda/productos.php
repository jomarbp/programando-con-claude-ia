<?php
/**
 * productos.php
 * Endpoint que devuelve los productos activos en JSON
 *
 * Curso: Programando con Claude IA
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

// Configuración de conexión
$DB_HOST = 'localhost';
$DB_NAME = 'tienda_ia';
$DB_USER = 'root';
$DB_PASS = '';

try {
    $pdo = new PDO(
        "mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4",
        $DB_USER,
        $DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );

    $sql = "SELECT
                p.id,
                p.nombre,
                p.descripcion,
                p.precio,
                p.stock,
                p.imagen,
                c.nombre AS categoria
            FROM productos p
            INNER JOIN categorias c ON p.categoria_id = c.id
            WHERE p.activo = 1
            ORDER BY p.fecha_creacion DESC";

    $stmt = $pdo->query($sql);
    $productos = $stmt->fetchAll();

    echo json_encode([
        'ok' => true,
        'total' => count($productos),
        'productos' => $productos
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        'ok' => false,
        'error' => 'Error de conexión a la base de datos',
        'detalle' => $e->getMessage()
    ]);
}
