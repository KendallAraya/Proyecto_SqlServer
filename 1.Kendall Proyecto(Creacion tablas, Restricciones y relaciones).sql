CREATE DATABASE BD_MATRICULA_KENDALL
GO
USE BD_MATRICULA_KENDALL
GO

--CREACION DE TABLAS
CREATE TABLE ESTUDIANTES(
CARNET VARCHAR(10) PRIMARY KEY NOT NULL,
ID_ESTUDIANTE INT IDENTITY(1,1) NOT NULL,
NOMBRE_ESTUDIANTE VARCHAR(30) NOT NULL,
PRIMER_APELLIDO_E VARCHAR(30) NOT NULL,
SEGUNDO_APELLIDO_E VARCHAR(30) NOT NULL,
CORREO_ESTUDIANTE VARCHAR(150),
NUMERO_TELEFONO VARCHAR(30) NOT NULL,
ESTADO_E VARCHAR(30) DEFAULT 'ACTIVO' NOT NULL,
FECHA_INGRESO DATE NOT NULL,
BORRADO_E BIT DEFAULT 0,
);

CREATE TABLE PROFESORES(
COD_PROFESOR INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
ID_PROFESOR INT NOT NULL,
NOMBRE_PROFESOR VARCHAR(30) NOT NULL,
PRIMER_APELLIDO_P VARCHAR(30) NOT NULL,
SEGUNDO_APELLIDO_P VARCHAR(30) NOT NULL,
CORREO_PROFESOR VARCHAR(150),
NUMERO_TELEFONO_PROFESOR VARCHAR(30) NOT NULL,
ESTADO_P VARCHAR(30) DEFAULT 'ACTIVO' NOT NULL,
BORRADO BIT DEFAULT 0 NOT NULL,
);

CREATE TABLE LABORATORIOS(
COD_LABORATORIO INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
UBICACION_LABORATORIO VARCHAR(50) NOT NULL,
);

CREATE TABLE MATERIAS(
COD_MATERIA VARCHAR(30) PRIMARY KEY NOT NULL,
NOMBRE_MATERIA VARCHAR(150) NOT NULL,
CEDITOS_C INT NOT NULL,
DURACION INT NOT NULL,
COSTO DECIMAL(10,2),
REQUISITO VARCHAR(50),
BORRADO_CARRERA BIT DEFAULT 0,
);

CREATE TABLE CARRERAS(
COD_CARRERA VARCHAR(30) PRIMARY KEY NOT NULL,
NOMBRE_CARRERA VARCHAR(150) NOT NULL,
CEDITOS_M INT NOT NULL,
GRADO VARCHAR(30) DEFAULT 'BACHILLERATO' NOT NULL,
BORRADO_MATERIA BIT DEFAULT 0,
);

CREATE TABLE MATERIAS_CARRERAS(
COD_MATERIA_CARRERA INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
COD_CARRERA VARCHAR(30) NOT NULL,
COD_MATERIA VARCHAR(30) NOT NULL,
BORRADO_MATERIA_CARRERA BIT DEFAULT 0,
);

CREATE TABLE CALIFICACION_POR_MATERIA(
ID_CALIFICACION INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
CARNET VARCHAR(10) NOT NULL,
COD_MATERIA_CARRERA INT NOT NULL,
PROMEDIO FLOAT NOT NULL,
);

CREATE TABLE HORARIO(
COD_MATERIAS_ABIERTAS INT NOT NULL,
DIA VARCHAR(15) NOT NULL,
HORA_INICIO TIME NOT NULL,
HORA_FINAL TIME NOT NULL,
COD_FERIADO INT,
CONSTRAINT PK_HORARIOS PRIMARY KEY(COD_MATERIAS_ABIERTAS,DIA,HORA_INICIO,HORA_FINAL)
);

CREATE TABLE FERIADOS(
COD_FERIADO INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
DIA_FERIADO DATE NOT NULL,
DESCRIPCION_FERIADO VARCHAR(100),
);


CREATE TABLE MATERIAS_ABIERTAS(
COD_MATERIAS_ABIERTAS INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
COD_MATERIA_CARRERA INT NOT NULL,
COD_LABORATORIO INT NOT NULL,
COD_PROFESOR INT NOT NULL,
COSTO DECIMAL(10,2) NOT NULL,
GRUPO TINYINT NOT NULL,
ESPACIO TINYINT DEFAULT 45 NOT NULL,
FECHA_INICIO DATE DEFAULT GETDATE() NOT NULL,
FECHA_FINAL DATETIME ,
DESCUENTO_M DECIMAL(10,2) DEFAULT 0 NOT NULL,
);

CREATE TABLE DETALLE_MATRICULA(
NUM_RECIBO INT NOT NULL,
COD_MATERIAS_ABIERTAS INT NOT NULL,
PORC_DESCUENTO DECIMAL(4,2) NOT NULL,
ESTADO_D VARCHAR(3) DEFAULT 'ACT'NOT NULL,
CONSTRAINT PK_DETALLE_MATRICULAS PRIMARY KEY(NUM_RECIBO,COD_MATERIAS_ABIERTAS)
);
   
CREATE TABLE MATRICULAS(
NUM_RECIBO INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
CARNET VARCHAR(10) NOT NULL,
ESTADO VARCHAR(3) DEFAULT 'ACT' NOT NULL,
USUARIO_MATRICULA VARCHAR(20) NOT NULL,
OBSERVACIONES_MATRICULA VARCHAR(250), 
FECHA DATETIME DEFAULT GETDATE() NOT NULL,
TOTAL DECIMAL(10,2) NOT NULL,
DESCUENTO_MAT DECIMAL(10,2),
);

CREATE TABLE CERTIFICADOS(
COD_CERTIFICADO VARCHAR(30) PRIMARY KEY NOT NULL,
NOMBRE_CERTIFICADO VARCHAR(150) NOT NULL,
);

CREATE TABLE CERTIFICADOS_PROFESORES( --Esta tabla se tuvo que agregar para poder asignar certificados a profesores
COD_CERTIFICADO VARCHAR(30) NOT NULL,
COD_PROFESOR INT NOT NULL,
);

CREATE TABLE PAGOS(  --Esta tabla se tuvo que agregar para poder llevar un registro del pago de las matriculas
ID_PAGO INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NUM_RECIBO INT NOT NULL,
MONTO_PAGAR DECIMAL(10,2),
DETALLE_PAGO VARCHAR(100),
);

--RESTRICCIONES DE ESTUDIANTES

ALTER TABLE ESTUDIANTES
ADD CONSTRAINT CHK_ESTADO_E CHECK(ESTADO_E='ACTIVO' OR ESTADO_E='INACTIVO');

ALTER TABLE ESTUDIANTES
ADD CONSTRAINT CHK_FECHA_INGRESO CHECK(FECHA_INGRESO <= GETDATE());

--RESTICCIONES DE PROFESORES

ALTER TABLE PROFESORES
ADD CONSTRAINT CHK_ESTADO_P CHECK(ESTADO_P='ACTIVO' OR ESTADO_P='INACTIVO');

--RESTICCIONES DE MATERIAS

ALTER TABLE MATERIAS
ADD CONSTRAINT CHK_CEDITOS_C CHECK(CEDITOS_C>=0);

--RESTICCIONES DE CARRERAS

ALTER TABLE CARRERAS
ADD CONSTRAINT CHK_GRADO CHECK(GRADO='LICENCIATURA' OR GRADO='BACHILLERATO' OR GRADO='DIPLOMADO' OR GRADO='MAESTRIA');

ALTER TABLE CARRERAS
ADD CONSTRAINT CHK_CEDITOS_M CHECK(CEDITOS_M>=0);

--RESTICCIONES DE CALIFICACION_POR_MATERIA

ALTER TABLE CALIFICACION_POR_MATERIA
ADD CONSTRAINT CHK_CALIFICACIONES CHECK(PROMEDIO>0 AND PROMEDIO<100);

--RESTICCIONES DE MATERIAS_ABIERTAS

ALTER TABLE MATERIAS_ABIERTAS
ADD CONSTRAINT CHK_COSTO CHECK(COSTO>0);

ALTER TABLE MATERIAS_ABIERTAS
ADD CONSTRAINT CHK_FECHA_INICIO CHECK(FECHA_INICIO>=GETDATE());

ALTER TABLE MATERIAS_ABIERTAS
ADD CONSTRAINT CHK_FECHA_FINAL CHECK(FECHA_FINAL>=FECHA_INICIO);

ALTER TABLE MATERIAS_ABIERTAS
ADD CONSTRAINT CHK_DESCUENTO_M CHECK(DESCUENTO_M>=0 AND DESCUENTO_M<100);

--RESTICCIONES DE DETALLE_MATRICULA

ALTER TABLE DETALLE_MATRICULA
ADD CONSTRAINT CHK_PORC_DESCUENTO CHECK(PORC_DESCUENTO>=0 AND PORC_DESCUENTO<100);

ALTER TABLE DETALLE_MATRICULA
ADD CONSTRAINT CHK_ESTADO_D CHECK(ESTADO_D='ACT' OR ESTADO_D='INA');

--RESTICCIONES DE MATRICULAS

ALTER TABLE MATRICULAS
ADD CONSTRAINT CHK_ESTADO CHECK(ESTADO='ACT' OR ESTADO='INA');

ALTER TABLE MATRICULAS
ADD CONSTRAINT CHK_FECHA CHECK(FECHA>= GETDATE());

ALTER TABLE MATRICULAS
ADD CONSTRAINT CHK_TOTAL CHECK(TOTAL>= 0);

ALTER TABLE MATRICULAS
ADD CONSTRAINT CHK_DESCUENTO_MAT CHECK(DESCUENTO_MAT>= 0);

--RELACIONES

ALTER TABLE MATERIAS_CARRERAS 
ADD CONSTRAINT FK_COD_CARRERA FOREIGN KEY (COD_CARRERA) REFERENCES CARRERAS(COD_CARRERA)

ALTER TABLE MATERIAS_CARRERAS 
ADD CONSTRAINT FK_COD_MATERIA FOREIGN KEY (COD_MATERIA) REFERENCES MATERIAS(COD_MATERIA)

ALTER TABLE MATERIAS_ABIERTAS 
ADD CONSTRAINT FK_COD_MATERIA_CARRERA FOREIGN KEY (COD_MATERIA_CARRERA) REFERENCES MATERIAS_CARRERAS(COD_MATERIA_CARRERA)

ALTER TABLE MATERIAS_ABIERTAS 
ADD CONSTRAINT FK_COD_PROFESOR FOREIGN KEY (COD_PROFESOR) REFERENCES PROFESORES(COD_PROFESOR)

ALTER TABLE MATERIAS_ABIERTAS 
ADD CONSTRAINT FK_COD_LABORATORIO FOREIGN KEY (COD_LABORATORIO) REFERENCES LABORATORIOS(COD_LABORATORIO)

ALTER TABLE HORARIO 
ADD CONSTRAINT FK_COD_MATERIAS_ABIERTAS FOREIGN KEY (COD_MATERIAS_ABIERTAS) REFERENCES MATERIAS_ABIERTAS(COD_MATERIAS_ABIERTAS)

ALTER TABLE DETALLE_MATRICULA 
ADD CONSTRAINT FK_NUM_RECIBO FOREIGN KEY (NUM_RECIBO) REFERENCES MATRICULAS(NUM_RECIBO)

ALTER TABLE DETALLE_MATRICULA 
ADD CONSTRAINT FK_COD_MATERIAS_ABIERTAS2 FOREIGN KEY (COD_MATERIAS_ABIERTAS) REFERENCES MATERIAS_ABIERTAS(COD_MATERIAS_ABIERTAS)

ALTER TABLE MATRICULAS 
ADD CONSTRAINT FK_MATRICULAS FOREIGN KEY (CARNET) REFERENCES ESTUDIANTES(CARNET)

ALTER TABLE CALIFICACION_POR_MATERIA 
ADD CONSTRAINT FK_CALIFICACION_POR_MATERIA1 FOREIGN KEY (CARNET) REFERENCES ESTUDIANTES(CARNET)

ALTER TABLE CALIFICACION_POR_MATERIA 
ADD CONSTRAINT FK_CALIFICACION_POR_MATERIA2 FOREIGN KEY (COD_MATERIA_CARRERA) REFERENCES MATERIAS_CARRERAS(COD_MATERIA_CARRERA)

ALTER TABLE CERTIFICADOS_PROFESORES 
ADD CONSTRAINT FK_CERTIFICADOS_PROFESORES1 FOREIGN KEY (COD_PROFESOR) REFERENCES PROFESORES(COD_PROFESOR)

ALTER TABLE CERTIFICADOS_PROFESORES 
ADD CONSTRAINT FK_CERTIFICADOS_PROFESORES2 FOREIGN KEY (COD_CERTIFICADO) REFERENCES CERTIFICADOS(COD_CERTIFICADO)

ALTER TABLE HORARIO
ADD CONSTRAINT FK_FERIADOS FOREIGN KEY (COD_FERIADO) REFERENCES FERIADOS(COD_FERIADO)

ALTER TABLE PAGOS
ADD CONSTRAINT FK_PAGOS FOREIGN KEY (NUM_RECIBO) REFERENCES MATRICULAS(NUM_RECIBO)


