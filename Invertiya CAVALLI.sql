SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS invertiya;
CREATE DATABASE invertiya;
USE invertiya;

CREATE TABLE asesores (
id_asesor INT NOT NULL PRIMARY KEY,
nombre VARCHAR(40) NOT NULL,
CUIT INT NOT NULL,
porcentaje_comision INT NOT NULL
);

CREATE TABLE cuentas_comitentes(
id_cliente INT NOT NULL PRIMARY KEY,
cuit INT NOT NULL,
nombre_completo Varchar(40) NOT NULL,
edad INT,
ocupacion Varchar(40),
mail Varchar(40) NOT NULL,
id_asesor INT NOT NULL,
CONSTRAINT fk_cliente_asesor FOREIGN KEY (id_asesor) REFERENCES asesores(id_asesor)
);

CREATE TABLE activos (
ticker VARCHAR(40) PRIMARY KEY,
fecha DATE,
precio INT NOT NULL,
perfil VARCHAR(40),
CONSTRAINT chk_perfil_activos CHECK (perfil IN ('Conservador', 'Moderado', 'Arriesgado')));

CREATE TABLE operaciones (
id_operacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_asesor INT NOT NULL,
tipo_operacion VARCHAR(40),
fecha DATE NOT NULL,
cantidad INT NOT NULL,
ticker VARCHAR(40) NOT NULL,
total_operacion INT,
CONSTRAINT fk_ope_cliente FOREIGN KEY (id_cliente) REFERENCES cuentas_comitentes(id_cliente),
CONSTRAINT fk_ope_asesor FOREIGN KEY (id_asesor) REFERENCES asesores (id_asesor),
CONSTRAINT fk_ope_activo FOREIGN KEY (ticker) REFERENCES activos(ticker),
CONSTRAINT chk_tipo_ope CHECK (tipo_operacion IN ('Compra', 'Venta')));

CREATE TABLE comentarios (
id_comentario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_operacion INT,
tipo_operacion VARCHAR(40),
motivo_operacion VARCHAR(200) NOT NULL,
expectativa VARCHAR(40),
CONSTRAINT fk_comentario_operacion_id FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion),
CONSTRAINT chk_comentario_tipo CHECK (tipo_operacion IN ('Compra', 'Venta')),
CONSTRAINT chk_expectativa CHECK (expectativa IN ('Alcista', 'Bajista')));

CREATE TABLE perfil_de_inversor (
id_cliente INT NOT NULL PRIMARY KEY,
perfil VARCHAR(40),
capacidad_ahorro INT,
patrimonio_porcentaje INT,
horizonte_inversion_years INT,
CONSTRAINT chk_perfil_inversor CHECK (perfil IN ('Conservador', 'Moderado', 'Arriesgado')),
CONSTRAINT fk_perfil_cliente FOREIGN KEY (id_cliente) REFERENCES cuentas_comitentes(id_cliente));

CREATE TABLE cuentas_bancarias (
id_transferencia INT NOT NULL PRIMARY KEY,
id_cliente INT NOT NULL,
nombre_banco VARCHAR(40) NOT NULL,
nro_cuenta INT NOT NULL,
moneda VARCHAR(40) NOT NULL,
CONSTRAINT fk_banco_cliente_comitente FOREIGN KEY (id_cliente) REFERENCES cuentas_comitentes(id_cliente)
);

SET FOREIGN_KEY_CHECKS = 1;