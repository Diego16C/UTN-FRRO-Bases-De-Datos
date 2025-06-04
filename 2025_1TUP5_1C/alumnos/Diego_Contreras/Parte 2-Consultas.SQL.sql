SELECT 
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    v.fecha_venta,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN empleados e ON v.id_empleado = e.id_empleado;


SELECT 
    p.nombre AS producto,
    dv.cantidad,
    dv.precio_unitario,
    v.fecha_venta
FROM detalle_venta dv
JOIN productos p ON dv.id_producto = p.id_producto
JOIN ventas v ON dv.id_venta = v.id_venta
ORDER BY v.fecha_venta;

SELECT 
    p.nombre AS producto,
    p.stock,
    SUM(dv.cantidad) AS total_vendido
FROM productos p
LEFT JOIN detalle_venta dv ON p.id_producto = dv.id_producto
GROUP BY p.id_producto, p.nombre, p.stock;

SELECT 
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    SUM(dv.cantidad * dv.precio_unitario) AS total_facturado
FROM empleados e
JOIN ventas v ON e.id_empleado = v.id_empleado
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY e.id_empleado, e.nombre, e.apellido
ORDER BY total_facturado DESC;

SELECT 
    c.nombre,
    c.apellido,
    COUNT(v.id_venta) AS cantidad_ventas
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
HAVING COUNT(v.id_venta) > 2
ORDER BY c.apellido, c.nombre;