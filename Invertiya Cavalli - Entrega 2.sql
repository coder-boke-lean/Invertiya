USE invertiya;

ALTER TABLE cuentas_comitentes ADD COLUMN saldo DECIMAL(15,2) DEFAULT 0.00; 

ALTER TABLE asesores MODIFY COLUMN cuit VARCHAR (20);
ALTER TABLE cuentas_comitentes MODIFY COLUMN cuit VARCHAR (20);

INSERT IGNORE INTO asesores (id_asesor, nombre, cuit, porcentaje_comision) VALUES
(101, 'Martin Redrado', 2030405060, 1),
(102, 'Clara Mercado', 2731425364, 2),
(103, 'Julian Finanzas', 2035465768, 1),
(104, 'Sofia Inversora', 2740414243, 3),
(105, 'Roberto Bolsa', 2022232425, 2),
(106, 'Elena Capital', 2733343536, 1),
(107, 'Tomas Trading', 2044454647, 2),
(108, 'Lucia Bonos', 2755565758, 1),
(109, 'Diego Equity', 2011121314, 3),
(110, 'Valeria Fondos', 2788898081, 2);

INSERT IGNORE INTO activos (ticker, fecha, precio, perfil) VALUES
('AL30', '2026-03-01', 520, 'Arriesgado'),
('GD30', '2026-03-01', 550, 'Arriesgado'),
('AAPL', '2026-03-01', 18500, 'Moderado'),
('MSFT', '2026-03-01', 21000, 'Moderado'),
('KO', '2026-03-01', 9500, 'Conservador'),
('SPY', '2026-03-01', 45000, 'Moderado'),
('BTC', '2026-03-01', 65000000, 'Arriesgado'),
('GOLD', '2026-03-01', 12000, 'Conservador'),
('MELI', '2026-03-01', 35000, 'Arriesgado'),
('TSLA', '2026-03-01', 15000, 'Arriesgado');

INSERT IGNORE INTO cuentas_comitentes (id_cliente, cuit, nombre_completo, edad, ocupacion, mail, id_asesor) VALUES
(1, 2010101010, 'Leandro Cavalli', 28, 'Analista Financiero', 'leandro@mail.com', 101),
(2, 2720202020, 'Ana Garcia', 35, 'Arquitecta', 'ana@mail.com', 102),
(3, 2030303030, 'Carlos Perez', 42, 'Medico', 'carlos@mail.com', 101),
(4, 2740404040, 'Maria Lopez', 24, 'Estudiante', 'maria@mail.com', 103),
(5, 2050505050, 'Juan Rodriguez', 50, 'Empresario', 'juan@mail.com', 105),
(6, 2760606060, 'Lucia Fernandez', 31, 'Diseñadora', 'lucia@mail.com', 104),
(7, 2070707070, 'Jorge Martinez', 39, 'Abogado', 'jorge@mail.com', 101),
(8, 2780808080, 'Elena Gomez', 45, 'Docente', 'elena@mail.com', 106),
(9, 2090909090, 'Pedro Sanchez', 19, 'Programador', 'pedro@mail.com', 107),
(10, 2711111111, 'Silvia Torres', 60, 'Jubilada', 'silvia@mail.com', 108);

INSERT IGNORE INTO perfil_de_inversor (id_cliente, perfil, capacidad_ahorro, patrimonio_porcentaje, horizonte_inversion_years) VALUES
(1, 'Moderado', 500, 20, 5),
(2, 'Conservador', 300, 10, 2),
(3, 'Moderado', 1000, 30, 10),
(4, 'Arriesgado', 100, 50, 15),
(5, 'Moderado', 5000, 15, 8),
(6, 'Arriesgado', 400, 25, 12),
(7, 'Moderado', 1500, 20, 7),
(8, 'Conservador', 600, 10, 3),
(9, 'Arriesgado', 200, 40, 20),
(10, 'Conservador', 800, 5, 4);

INSERT IGNORE INTO cuentas_bancarias (id_transferencia, id_cliente, nombre_banco, nro_cuenta, moneda) VALUES
(501, 1, 'Galicia', 123456, 'ARS'),
(502, 2, 'Santander', 223344, 'USD'),
(503, 3, 'BBVA', 998877, 'ARS'),
(504, 4, 'Macro', 445566, 'ARS'),
(505, 5, 'ICBC', 112233, 'USD'),
(506, 6, 'Brubank', 556677, 'ARS'),
(507, 7, 'HSBC', 334455, 'ARS'),
(508, 8, 'Provincia', 667788, 'ARS'),
(509, 9, 'Lemon', 778899, 'ARS'),
(510, 10, 'Nacion', 889900, 'ARS');

INSERT IGNORE INTO operaciones (id_cliente, id_asesor, tipo_operacion, fecha, cantidad, ticker, total_operacion) VALUES
(1, 101, 'Compra', '2026-03-05', 10, 'AAPL', 185000),
(2, 102, 'Compra', '2026-03-05', 100, 'AL30', 52000),
(3, 101, 'Compra', '2026-03-06', 5, 'MSFT', 105000),
(4, 103, 'Compra', '2026-03-06', 50, 'KO', 475000),
(1, 101, 'Venta', '2026-03-07', 2, 'AAPL', 37000),
(5, 105, 'Compra', '2026-03-08', 1, 'BTC', 65000000),
(6, 104, 'Compra', '2026-03-08', 20, 'MELI', 700000),
(7, 101, 'Compra', '2026-03-09', 200, 'GD30', 110000),
(8, 106, 'Compra', '2026-03-10', 10, 'GOLD', 120000),
(9, 107, 'Compra', '2026-03-10', 5, 'TSLA', 75000);

INSERT IGNORE INTO comentarios (id_cliente, id_operacion, tipo_operacion, motivo_operacion, expectativa) VALUES
(1, 1, 'Compra', 'Diversificación tecnológica', 'Alcista'),
(2, 2, 'Compra', 'Cobertura en bonos soberanos', 'Bajista'),
(3, 3, 'Compra', 'Apuesta a software y nube', 'Alcista'),
(4, 4, 'Compra', 'Activo defensivo por dividendos', 'Alcista'),
(1, 5, 'Venta', 'Toma de ganancias parcial', 'Bajista'),
(5, 6, 'Compra', 'Inversión en reserva de valor digital', 'Alcista'),
(6, 7, 'Compra', 'E-commerce regional sólido', 'Alcista'),
(7, 8, 'Compra', 'Oportunidad por arbitraje de bonos', 'Alcista'),
(8, 9, 'Compra', 'Protección contra inflación', 'Bajista'),
(9, 10, 'Compra', 'Crecimiento en sector automotriz', 'Alcista');

--FUNCIONES--

DELIMITER //

DROP FUNCTION IF EXISTS fn_calcular_subtotal //
CREATE FUNCTION fn_calcular_subtotal(p_cantidad INT, p_precio INT) 
RETURNS INT DETERMINISTIC
BEGIN
    RETURN p_cantidad * p_precio;
END//

DROP FUNCTION IF EXISTS fn_monto_comision //
CREATE FUNCTION fn_monto_comision(p_subtotal INT, p_porcentaje INT) 
RETURNS DECIMAL(15,2) DETERMINISTIC
BEGIN
    RETURN p_subtotal * (p_porcentaje / 100.0);
END//

DELIMITER ;

--PROCEDURES--

DELIMITER //

DROP PROCEDURE IF EXISTS sp_registrar_operacion //
CREATE PROCEDURE sp_registrar_operacion(IN p_cliente INT, IN p_ticker VARCHAR(40), IN p_cant INT)
BEGIN
    INSERT INTO operaciones (id_cliente, ticker, cantidad, fecha)
    VALUES (p_cliente, p_ticker, p_cant, CURDATE());
END//

DROP PROCEDURE IF EXISTS sp_liquidar_comisiones //
CREATE PROCEDURE sp_liquidar_comisiones()
BEGIN
    SELECT aser.nombre, 
           SUM(fn_monto_comision(fn_calcular_subtotal(ope.cantidad, act.precio), aser.porcentaje_comision)) AS total_a_pagar
    FROM operaciones ope
    JOIN asesores aser ON ope.id_asesor = aser.id_asesor
    JOIN activos act ON ope.ticker = act.ticker
    GROUP BY aser.nombre;
END//

DELIMITER ;

--TRIGGERS--

DELIMITER //

DROP TRIGGER IF EXISTS tr_actualizar_saldo_post_compra //
CREATE TRIGGER tr_actualizar_saldo_post_compra
AFTER INSERT ON operaciones
FOR EACH ROW
BEGIN
    DECLARE v_costo INT;
    SELECT precio INTO v_costo FROM activos WHERE ticker = NEW.ticker;
    
    UPDATE cuentas_comitentes 
    SET saldo = saldo - (v_costo * NEW.cantidad)
    WHERE id_cliente = NEW.id_cliente;
END//

DROP TRIGGER IF EXISTS tr_control_edad //
CREATE TRIGGER tr_control_edad
BEFORE INSERT ON cuentas_comitentes
FOR EACH ROW
BEGIN
    IF NEW.edad < 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Edad insuficiente para operar (Mínimo 13 años)';
    END IF;
END//

DELIMITER ;

CREATE OR REPLACE VIEW vista_preferencia_banco AS
SELECT nombre_banco, COUNT(*) AS cantidad_clientes
FROM cuentas_bancarias
GROUP BY nombre_banco;

CREATE OR REPLACE VIEW vista_volumen_operado AS
SELECT o.ticker, SUM(o.cantidad * a.precio) AS volumen_total_pesos
FROM operaciones o
JOIN activos a ON o.ticker = a.ticker
GROUP BY o.ticker;

CREATE OR REPLACE VIEW vista_activos_calientes AS
SELECT o.ticker, COUNT(c.id_comentario) AS total_comentarios,
       CASE WHEN COUNT(c.id_comentario) >= 5 THEN 'ALERTA: TRENDING' ELSE 'Normal' END AS estado
FROM operaciones o
LEFT JOIN comentarios c ON o.id_operacion = c.id_operacion
GROUP BY o.ticker;