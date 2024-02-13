USE BD_MATRICULA_KENDALL
GO

INSERT INTO ESTUDIANTES(CARNET,NOMBRE_ESTUDIANTE,PRIMER_APELLIDO_E,SEGUNDO_APELLIDO_E,CORREO_ESTUDIANTE,NUMERO_TELEFONO,FECHA_INGRESO)
	VALUES ('UFC101','NILS ADRIAN','CARRILLO','JIMENEZ','208170615@UFC.cr','24456789','20210603'),
		   ('UFC102','Luis Daniel','Chavarría','Espinoza','702420185@UFC.cr','24457352','20210603'),
		   ('UFC103','GABRIEL ALONSO','GARCIA','AGUILAR','207990019@UFC.cr','24436789','20210603'),
		   ('UFC104','CESAR LUIS','GARCIA','GONZALES','205790810@UFC.cr','24467496','20210603'),
		   ('UFC105','TATIANA','MATIAS','JIMENEZ','206470303@UFC.cr','24457695','20210603'),
		   ('UFC106','LUIS FELIPE','MIRANDA','ROJAS','116870306@UFC.cr','244685749','20210603'),
		   ('UFC107','CHRISTOPHER FERNANDO','OLIVARES','SALAZAR','901390706@UFC.cr','24456890','20210603'),
		   ('UFC108','FRANCISCO JOSE','PANIAGUA ','PACHECO','208110717@UFC.cr','24457837','20210603'),
		   ('UFC109','DANNY JAFET','SOTO','JIMENEZ','701890285@UFC.cr','24451232','20210603'),
		   ('UFC110','KENDALL ANDRES','ARAYA','LOBO','208200731@UFC.cr','24411112','20210604');



INSERT INTO PROFESORES(ID_PROFESOR,NOMBRE_PROFESOR,PRIMER_APELLIDO_P,SEGUNDO_APELLIDO_P,NUMERO_TELEFONO_PROFESOR,CORREO_PROFESOR)
	VALUES  ('11111','Luis Ángel','Chacon','Zuniga','24451111','luis@UFC.ac.cr'),
			('22222','Alonso','Bogantes','Rodriguez','24451112','alonso@UFC.ac.cr'),
			('33333','Oscar','Pacheco','Vazquez','24451113','pacheco@UFC.ac.cr'),
			('44444','Laura','Fonseca','Rojas','24451114','laura@UFC.ac.cr'),
			('55555','Irene','Cruz','Fernandez','24451115','irene@UFC.ac.cr'),
			('66666','Jimmy','Zuniga','Sanchez','24451116','jimmy@UFC.ac.cr'),
			('77777','Nelson','Jimenez','Jimenez','24451117','Nelson@UFC.ac.cr'),
			('88888','Rebeca','Aguilar','Navarez','24451118','Rebeca@UFC.ac.cr'),
			('99999','Sady','Carrillo','Sanchez','24451119','Sady@UFC.ac.cr'),
			('111110','Muricio','Cordero','Lizano','24451120','Mauricio@UFC.ac.cr');


INSERT INTO CARRERAS(COD_CARRERA,NOMBRE_CARRERA,CEDITOS_M,GRADO)
	VALUES  ('DISMOV_01','Programación de Dispositivos Móviles',390,'BACHILLERATO'),
			('SISECR_02','Programación de Sistemas de Escritorio',989,'BACHILLERATO'),
			('PAGWEB_03','Programación de Páginas Web',561,'DIPLOMADO');



INSERT INTO MATERIAS(COD_MATERIA,NOMBRE_MATERIA,COSTO,CEDITOS_C,REQUISITO,DURACION)
	VALUES	('PROANDI','Programación para Android I',250000,8,NULL,120),
			('PROANDII','Programación para Android II',240000,10,'PROANDI',110),
			('PROANDIII','Programación para Android III',220000,7,'PROANDII',100),
			('PROAPSMIX','Programación para aplicaciones mixtas',195000,11,'PROANDIII',100),
			('LOGCOM','Lógica Computacional',225000,12,'PROAPSMIX',140),
			('INTJAV','Introducción a Java',335000,10,'LOGCOM',150),
			('PROOBJ','Programación Orientada a Objetos',345000,9,'INTJAV',160),
			('HTML','HTML',185000,11,'PROOBJ',90),
			('CSS','CSS',175000,13,'HTML',60),
			('JAVSCR','JavaScript',180000,8,'CSS',70),
			('BOOTSTR','Bootstrap',185000,8,'JAVSCR',90),
			('NODJS','Node js',185000,11,'BOOTSTR',90);
SELECT * FROM MATERIAS

INSERT INTO MATERIAS_CARRERAS(COD_CARRERA,COD_MATERIA)
	VALUES ('DISMOV_01','PROANDI'),
		   ('DISMOV_01','PROANDII'),
		   ('DISMOV_01','PROANDIII'),
		   ('DISMOV_01','PROAPSMIX'),
		   ('SISECR_02','LOGCOM'),
		   ('SISECR_02','INTJAV'),
		   ('SISECR_02','PROOBJ'),
		   ('PAGWEB_03','HTML'),
		   ('PAGWEB_03','CSS'),
		   ('PAGWEB_03','JAVSCR'),
		   ('PAGWEB_03','BOOTSTR'),
		   ('PAGWEB_03','NODJS');


INSERT INTO LABORATORIOS(UBICACION_LABORATORIO)
	VALUES ('Pabellón A'),
		   ('Pabellón B'),
		   ('Pabellón C'),
		   ('Pabellón D'),
		   ('Pabellón E');


INSERT INTO MATERIAS_ABIERTAS(COD_MATERIA_CARRERA,COD_PROFESOR,COD_LABORATORIO,ESPACIO,COSTO,FECHA_INICIO,FECHA_FINAL,GRUPO)
	VALUES  (1,1,1,15,250000,'20230301','20240101',1),
			(2,2,2,10,240000,'20230302','20240202',1),
			(3,3,3,20,220000,'20230303','20240303',1),
			(4,4,4,25,195000,'20230404','20240404',1),
			(5,5,5,40,225000,'20230505','20240505',2),
			(6,6,1,25,335000,'20230606','20240606',2),
			(7,4,2,10,345000,'20230707','20240707',2),
			(8,2,3,35,185000,'20230808','20240808',3),
			(9,8,4,45,175000,'20231009','20240909',3),
			(10,10,5,25,180000,'20231110','20241010',3);

INSERT INTO MATRICULAS (CARNET,FECHA,TOTAL,	DESCUENTO_MAT,USUARIO_MATRICULA,OBSERVACIONES_MATRICULA)
	VALUES  ('UFC101', '20230401', 0, 0, 'Kendall', 'Matriculas año 2023'),
			('UFC102', '20230401', 0, 0, 'Kendall', 'Matriculas año 2023'),
			('UFC102', '20230401', 0, 0, 'Kendall', 'Matriculas año 2023'),
			('UFC103', '20230401', 0, 0, 'Kendall', 'Matriculas año 2023'),
		    ('UFC104', '20230402', 0, 0, 'Kendall', 'Matriculas año 2023'),
		    ('UFC103', '20230402', 0, 0, 'Kendall', 'Matriculas año 2023'),
		    ('UFC106', '20230402', 0, 0, 'Kendall', 'Matriculas año 2023'),
		    ('UFC108', '20230403', 0, 0, 'Kendall', 'Matriculas año 2023'),
			('UFC107', '20230404', 0, 0, 'Kendall', 'Matriculas año 2023'),
			('UFC109', '20230405', 0, 0, 'Kendall', 'Matriculas año 2023');



INSERT INTO DETALLE_MATRICULA(NUM_RECIBO,COD_MATERIAS_ABIERTAS,PORC_DESCUENTO,ESTADO_D)
	VALUES  (1,1,0,'ACT'), 
			(2,2,0,'ACT'), 
			(3,3,0,'ACT'), 
			(4,4,0,'ACT'), 
			(5,5,0,'ACT'),
			(6,6,0,'ACT'), 
			(7,7,0,'ACT'), 
			(8,8,0,'ACT'),
			(9,9,0,'ACT'),
			(10,10,0,'ACT');

INSERT INTO HORARIO(COD_MATERIAS_ABIERTAS,DIA,HORA_INICIO,HORA_FINAL)
	VALUES	(1,'Lunes ','7:00','10:30'),	
			(1,'Jueves ','7:00','10:30'),	
			(2,'Lunes ','14:30','16:30'),	
			(2,'Jueves ','14:30','16:30'),
			(3,'Miércoles','8:00','11:30'),	
			(4,'Martes  ','7:00','11:30'),
			(5,'Viernes ','7:00','11:30'),
			(6,'Viernes ','14:00','16:30'),
			(7,'Miércoles ','14:00','16:30'),
			(8,'Martes ','14:00','16:30');



INSERT INTO CERTIFICADOS(COD_CERTIFICADO,NOMBRE_CERTIFICADO)
	VALUES ('CER01','Programación para Android I'),
	       ('CER02','Programación para Android II'),
		   ('CER03','Programación para Android III'),
		   ('CER04','Programación para aplicaciones mixtas'),
		   ('CER05','Lógica Computacional'),
		   ('CER06','Introducción a Java'),
		   ('CER07','Programación Orientada a Objetos'),
		   ('CER08','HTML'),
		   ('CER09','CSS'),
		   ('CER010','JavaScript'),
		   ('CER011','Bootstrap'),
		   ('CER012','Node js'); 

INSERT INTO CERTIFICADOS_PROFESORES(COD_CERTIFICADO,COD_PROFESOR)
	VALUES ('CER01',1),
		   ('CER02',1),
		   ('CER03',1),
		   ('CER04',1),
		   ('CER05',1),
		   ('CER06',1),
		   ('CER07',2),
		   ('CER08',2),
		   ('CER09',2),
		   ('CER010',2),
		   ('CER011',2),
		   ('CER012',2),
		   ('CER01',3),
		   ('CER02',3),
		   ('CER03',3),
		   ('CER04',3),
		   ('CER05',3),
		   ('CER06',3),
		   ('CER07',3),
		   ('CER08',3),
		   ('CER09',3),
		   ('CER010',3),
		   ('CER011',3),
		   ('CER012',3),
		   ('CER01',4),
		   ('CER02',4),
		   ('CER03',4),
		   ('CER04',4),
		   ('CER05',4),
		   ('CER06',4),
		   ('CER07',5),
		   ('CER08',5),
		   ('CER09',5),
		   ('CER010',5),
		   ('CER011',5),
		   ('CER012',5),
		   ('CER01',6),
		   ('CER02',6),
		   ('CER03',6),
		   ('CER04',6),
		   ('CER05',6),
		   ('CER06',6),
		   ('CER07',7),
		   ('CER08',7),
		   ('CER09',7),
		   ('CER010',7),
		   ('CER011',7),
		   ('CER012',7),
		   ('CER01',8),
		   ('CER02',8),
		   ('CER03',8),
		   ('CER04',8),
		   ('CER05',8),
		   ('CER06',8),
		   ('CER07',8),
		   ('CER08',8),
		   ('CER09',8),
		   ('CER010',8),
		   ('CER011',8),
		   ('CER012',8),
		   ('CER01',9),
		   ('CER02',9),
		   ('CER03',9),
		   ('CER04',9),
		   ('CER05',9),
		   ('CER06',9),
		   ('CER07',10),
		   ('CER08',10),
		   ('CER09',10),
		   ('CER010',10),
		   ('CER011',10),
		   ('CER012',10);
		   

INSERT INTO CALIFICACION_POR_MATERIA(PROMEDIO,CARNET,COD_MATERIA_CARRERA)
	VALUES (75,'UFC101',1),
	       (90,'UFC102',2),
		   (66,'UFC103',2),
		   (90,'UFC104',3),
		   (75,'UFC105',4),
		   (75,'UFC106',5),
		   (90,'UFC103',6),
		   (75,'UFC106',4),
		   (90,'UFC107',10),
		   (96,'UFC101',7);


INSERT INTO FERIADOS(DIA_FERIADO,DESCRIPCION_FERIADO)
VALUES ('2023-01-01','Año Nuevo'),
       ('2023-04-14','Jueves Santo'),
       ('2023-04-15','Viernes Santo'),
       ('2023-04-11','Día de Juan Santamaría'),
       ('2023-05-01','Día del trabajador'),
       ('2023-06-25','Anexión de Guanacaste'),
       ('2023-08-02','Día de la Virgen de los Ángeles'),
       ('2023-08-15','Día de la madre'),
       ('2023-09-19','Día de la Independencia'),
       ('2023-12-05','Día de la abolición del ejército'),
       ('2023-12-25','Día de Navidad');


INSERT INTO PAGOS(NUM_RECIBO,MONTO_PAGAR,DETALLE_PAGO)
	VALUES (1,100000,'PAGO MATRICULA'),
		   (2,150000,'PAGO MATRICULA'),
		   (3,140000,'PAGO MATRICULA'),
		   (4,130000,'PAGO MATRICULA'),
		   (5,120000,'PAGO MATRICULA');




				



				


			

