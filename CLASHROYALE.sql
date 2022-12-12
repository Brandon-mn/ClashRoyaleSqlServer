
--SQL
USE master;
GO
IF DB_ID (N'ClashRoyale') IS NOT NULL
	DROP DATABASE ClashRoyale;

GO
CREATE DATABASE ClashRoyale
ON 
( NAME = ClashRoyale_dat,
	FILENAME = 'C:\BD\ClashRoyale.mdf',
	SIZE = 10,
	MAXSIZE = 50,
	FILEGROWTH = 5)
LOG ON 
(NAME = ClashRoyale_log,
	FILENAME = 'C:\BD\ClashRoyale.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB);
GO
USE ClashRoyale;
GO
CREATE TABLE Jugador
(
	idJugador int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	codigo VARCHAR(8) NOT NULL,
	puntosEstelares VARCHAR (50) not null,
	experiencia VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
	idDesafio INT not null,
	idLibro INT not null,
	idClan INT not null,
	idTorneo INT not null,
	idPase INT not null,
	idCaminoTrofeo INT not null,
	idCaminoLeyenda INT not null,
	idEstadistica INT not null,
);
GO
CREATE TABLE Registro
(
	idRegistro  int IDENTITY (1,1),
	modalidad VARCHAR (50) NOT NULL,
	duracion VARCHAR(8) NOT NULL,
	estatus BIT DEFAULT 1 not null,
	idArena INT not null,
);
GO
CREATE TABLE CaminoTrofeo
(
	idCaminoTrofeo  int IDENTITY (1,1),
	trofeos VARCHAR (50) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	recompensa VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
	idArena INT not null,
	idLiga INT not null,
);
GO
CREATE TABLE CaminoLeyenda
(
	idCaminoLeyenda  int IDENTITY (1,1),
	trofeos VARCHAR (50) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	recompensa VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
	idArena INT not null,
);
GO
CREATE TABLE Liga
(
	idLiga  int IDENTITY (1,1),
	coronas VARCHAR (50) NOT NULL,
	recompensa VARCHAR(50) NOT NULL,
	nombre VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
	idArena INT not null,
);
GO
CREATE TABLE Arena
(
	idArena  int IDENTITY (1,1),
	tematica VARCHAR (50) NOT NULL,
	numero VARCHAR(8) NOT NULL,
	nombre VARCHAR (50) not null,
	rango VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Adorno
(
	idAdorno  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	tematica VARCHAR(8) NOT NULL,
	calidad VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Marco
(
	idMarco  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	calidad VARCHAR(50) NOT NULL,
	fondo VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Tvroyale
(
	idTvroyale  int IDENTITY (1,1),
	jugador1 VARCHAR (50) NOT NULL,
	jugador2 VARCHAR(50) NOT NULL,
	reproducciones VARCHAR (10) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Clasificacionn
(
	idClasificacion  int IDENTITY (1,1),
	medallas VARCHAR (50) NOT NULL,
	puesto VARCHAR(4) NOT NULL,
	reproducciones VARCHAR (10) not null,
	idJugador INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Torneo
(
	idTorneo  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	duracion VARCHAR(4) NOT NULL,
	capacidad VARCHAR (10) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Cofre
(
	idCofre  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	cantidadOro VARCHAR(4) NOT NULL,
	cartas VARCHAR (10) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Pase
(
	idPase  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	temporada VARCHAR(4) NOT NULL,
	tematica VARCHAR (10) not null,
	estatus BIT DEFAULT 1 not null,
	idAspecto INT not null,
	idReaccion INT not null,
	idNivel INT not null,
);
GO
CREATE TABLE Nivel
(
	idNivel int IDENTITY (1,1),
	numero VARCHAR (50) NOT NULL,
	recompensaRoyale VARCHAR(50) NOT NULL,
	recompensaGratis VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Tienda
(
	idTienda int IDENTITY (1,1),
	oro VARCHAR (50) NOT NULL,
	gemas VARCHAR(50) NOT NULL,
	cantidad VARCHAR (50) not null,
	idCofre INT not null,
	idReaccion INT not null,
	idOferta INT not null,
	idCodigoRegalo INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Reaccion
(
	idReaccion int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	audio VARCHAR(50) NOT NULL,
	animacion VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Oferta
(
	idOferta int IDENTITY (1,1),
	descripcion VARCHAR (50) NOT NULL,
	fechaVencimiento DATETIME not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Pago
(
	idPago int IDENTITY (1,1),
	numeroTarjeta VARCHAR (50) NOT NULL,
	fechaVencimiento DATETIME not null,
	nombre VARCHAR (50) not null,
	apellidPaterno VARCHAR (50) not null,
	apellidoMaterno VARCHAR (50) not null,
	codigoPostal VARCHAR (5) not null,
	correo VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE CodigoRegalo 
(
	idCodigoRegalo int IDENTITY (1,1),
	codigo VARCHAR (50) NOT NULL,
	credito VARCHAR (50)not null,
	fechaVencimiento  DATETIME not null, 
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Desafio
(
	idDesafio int IDENTITY (1,1),
	duracion VARCHAR (50) NOT NULL,
	victorias VARCHAR (50)not null,
	nombre  VARCHAR (50)not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Mazo
(
	idMazo int IDENTITY (1,1),
	nivel VARCHAR (50) NOT NULL,
	tipo VARCHAR (50)not null,
	coste VARCHAR (50)not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Maestro
(
	idMaestro int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	nivel VARCHAR (50)not null,
	dificultad VARCHAR (50)not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Cartaa
(
	idCartaa int IDENTITY (1,1),
	calidad VARCHAR (50) NOT NULL,
	descripcion VARCHAR (50)not null,
	idMaestria int not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Echizo
(
	idEchizo int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	dañoTorres VARCHAR(50) NOT NULL,
	ancho VARCHAR (50)not null,
	alcance VARCHAR (50)not null,
	coste VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
	idCarta int NOT NULL,
);
GO
CREATE TABLE Tropa
(
	idTropa int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	vida VARCHAR(50) NOT NULL,
	velocidad VARCHAR (50)not null,
	daño VARCHAR (50)not null,
	alcance VARCHAR (50) NOT NULL,
	objetivo VARCHAR (50) NOT NULL,
	coste VARCHAR (50) NOT NULL,
	idCarta int NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Estructura 
(
	idEstructura int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	vida VARCHAR(50) NOT NULL,
	velocidad VARCHAR (50)not null,
	alcance VARCHAR (50) NOT NULL,
	objetivo VARCHAR (50) NOT NULL,
	coste VARCHAR (50) NOT NULL,
	idCarta int NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Campeon 
(
	idCampeon int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	vida VARCHAR(50) NOT NULL,
	velocidad VARCHAR (50)not null,
	alcance VARCHAR (50) NOT NULL,
	daño VARCHAR (50) NOT NULL,
	coste VARCHAR (50) NOT NULL,
	idCarta int NOT NULL,
	idHabilidad int NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Habilidad 
(
	idHabilidad int IDENTITY(1,1),
	nombre VARCHAR (50) NOT NULL,
	duracion VARCHAR(50) NOT NULL,
	coste VARCHAR (50)not null,
	recarga VARCHAR (50) NOT NULL,
	descripcion VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Estadistica  
(
	idEstadistica int IDENTITY (1,1),
	victorias VARCHAR (50) NOT NULL,
	tresCoronas VARCHAR(50) NOT NULL,
	donaciones VARCHAR (50)not null,
	coleccion VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Logro  
(
	idLogro int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	dificultad VARCHAR(50) NOT NULL,
	descripcion VARCHAR (50)not null, 
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Comodin  
(
	idComodin int IDENTITY (1,1),
	almacen VARCHAR (50) NOT NULL,
	maximo VARCHAR(50) NOT NULL,
	uso VARCHAR (50)not null, 
	calidad VARCHAR (50)not null, 
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Libro  
(
    idLibro int IDENTITY (1,1), 
	calidad VARCHAR (50) NOT NULL,
	uso VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Mision  
(
	idMision int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	tarea VARCHAR(50) NOT NULL,
	idBonus int NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Bonus  
(
    idBonus int IDENTITY (1,1),
	diario VARCHAR (50) NOT NULL,
	semanal VARCHAR(50) NOT NULL,
	experiencia VARCHAR(50) NOT NULL,
	recompensa VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Supercell  
(
    idSupercell int IDENTITY (1,1),
	correo VARCHAR (50) NOT NULL,
	codigo VARCHAR(50) NOT NULL,
	juegos VARCHAR(50) NOT NULL,
	idJugador int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Empleado  
(
    idEmpleado int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	apellidoPaterno VARCHAR(50) NOT NULL,
	apellidoMaterno VARCHAR(50) NOT NULL,
	pais VARCHAR (50) NOT NULL,
	calle VARCHAR (50) NOT NULL,
	colonia VARCHAR (50) NOT NULL,
	municipo VARCHAR (50) NOT NULL,
	idPuesto int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Puesto  
(
    idPuesto int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	sueldo VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE CreadorContenido  
(
    idCreadorContenido int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	suscriptores VARCHAR(50) NOT NULL,
	codigo VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Clan  
(
    idClan int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	trofeos VARCHAR(50) NOT NULL,
	miembros VARCHAR(50) NOT NULL,
	codigo VARCHAR(50) NOT NULL,
	idModoJuego int Not null,
	idMercader int Not null,
	idLigClan int Not null,
	idPedido int Not null,
	idIntercambio int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Guerra  
(
    idGuerra int IDENTITY (1,1),
	trofeos VARCHAR (50) NOT NULL,
	puesto VARCHAR(50) NOT NULL,
	ataques VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
	idBotin  int Not null,
);
GO
CREATE TABLE Botin  
(
    idBotin int IDENTITY (1,1),
	oro VARCHAR (50) NOT NULL,
	cartas VARCHAR(50) NOT NULL,
	comodines VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Mercader  
(
    idMercader  int IDENTITY (1,1),
	ficha VARCHAR (50) NOT NULL,
	opcion VARCHAR(50) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Solicitud  
(
    idSolicitud  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	trofeos VARCHAR(50) NOT NULL, 
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE LigClan  
(
    idLigaClan  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	rango VARCHAR(50) NOT NULL, 
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE ModoJuego  
(
    idModoJuego  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	dificultad VARCHAR(50) NOT NULL,
	descripcion VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Intrercambio  
(
    idIntercambio  int IDENTITY (1,1),
	calidad  VARCHAR (50) NOT NULL,
	fecha datetime not null,
	cantidad VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Pedido  
(
    idPedido  int IDENTITY (1,1),
	tiempo VARCHAR (50) NOT NULL,
	calidad datetime not null,
	cantidad VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
		idDonacion int Not null,

);
GO
CREATE TABLE Donacion  
(
    idDonacion  int IDENTITY (1,1),
	cantidad VARCHAR (50) NOT NULL,
	calidad datetime not null,
	codigo VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,

);
GO
CREATE TABLE Maestria   
(
    idMaestria  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	dificultad  VARCHAR (50) NOT NULL,
	calidad VARCHAR (50) NOT NULL,
	experiencia VARCHAR (50) NOT NULL,
	definicion VARCHAR (50) NOT NULL,
	recompensa VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Aspecto   
(
    idAspecto  int IDENTITY (1,1),
	nombre VARCHAR (50) NOT NULL,
	ruta  VARCHAR (50) NOT NULL,
	temporada VARCHAR (50) NOT NULL,
	calidad VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE RegistroJugador   
(
    idRegistroJugador int IDENTITY (1,1),
	ganador VARCHAR (50) NOT NULL,
	fecha  VARCHAR (50) NOT NULL,
	idRegistro int Not null,
	idJugador int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE SupercellEmpleado   
(
    idSupercellEmpleado int IDENTITY (1,1),
	idSupercell int Not null,
	idEmpleado int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE SupercellCreadoConrtenido   
(
    idSupercellCreadoConrtenido int IDENTITY (1,1),
	idSupercell int Not null,
	idCreadorContenido int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE ClanSolicitud   
(
    idClanSolicitud int IDENTITY (1,1),
	fecha datetime not null,
	idClan int Not null,
	idSolicitud int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE ClanGuerra	   
(
    idClanGuerra int IDENTITY (1,1),
	duracion datetime not null,
	idClan int Not null,
	idGuerra int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE MisionJugador	   
(
    idMisionJugador int IDENTITY (1,1),
	idMision int Not null,
	idJugador int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE LibroJugador	   
(
    idLibroJugador int IDENTITY (1,1),
	idLibro int Not null,
	idJugador  int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorComodin	   
(
    idJugadorComodin int IDENTITY (1,1),
	idJugador int Not null,
	idComodin int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE LogroJugador	   
(
    idLogroJugador int IDENTITY (1,1),
	idLogro int Not null,
	idJugador int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE MaestroJugador	   
(
    idMaestroJugador int IDENTITY (1,1),
	idMaestro int Not null,
	idJugador int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorMazo	   
(
    idJugadorMazo int IDENTITY (1,1),
	idJugador int Not null,
	idMazo int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE PaseTienda	   
(
    idPaseTienda int IDENTITY (1,1),
	idPase int Not null,
	idTienda int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorCofre	   
(
    idJugadorCofre int IDENTITY (1,1),
	idJugador int Not null,
	idCofre int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE TiendaPago
(
    idTiendaPago int IDENTITY (1,1),
	idTienda int Not null,
	idPago int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorMarco
(
    idJugadorMarco int IDENTITY (1,1),
	idJugador int Not null,
	idMarco int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorTvroyale
(
    idJugadorTvroyale int IDENTITY (1,1),
	idJugador int Not null,
	idTvroyale int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JugadorAdorno
(
    idJugadorAdorno int IDENTITY (1,1),
	idJugador int Not null,
	idAdorno int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE MazoCarta
(
    idMazoCarta int IDENTITY (1,1),
	idMazo int Not null,
	idCarta int Not null,
	estatus BIT DEFAULT 1 not null,
);
GO
--Llaves Primarias 
ALTER TABLE Pago ADD CONSTRAINT PK_Pago PRIMARY KEY (idPago)
ALTER TABLE Mazo ADD CONSTRAINT PK_Mazo PRIMARY KEY (idMazo)
ALTER TABLE Maestro ADD CONSTRAINT PK_Maestro PRIMARY KEY (idMaestro)
ALTER TABLE Desafio ADD CONSTRAINT PK_Desafio PRIMARY KEY (idDesafio)
ALTER TABLE Jugador ADD CONSTRAINT PK_Jugador PRIMARY KEY (idJugador)
ALTER TABLE Registro ADD CONSTRAINT PK_Registro PRIMARY KEY (idRegistro)
ALTER TABLE CaminoTrofeo ADD CONSTRAINT PK_CaminoTrofeo PRIMARY KEY (idCaminoTrofeo)
ALTER TABLE CaminoLeyenda ADD CONSTRAINT PK_CaminoLeyenda PRIMARY KEY (idCaminoLeyenda)
ALTER TABLE Liga ADD CONSTRAINT PK_Liga PRIMARY KEY (idLiga)
ALTER TABLE Arena ADD CONSTRAINT PK_Arena PRIMARY KEY (idArena)
ALTER TABLE Adorno ADD CONSTRAINT PK_Adorno PRIMARY KEY (idAdorno)
ALTER TABLE Marco ADD CONSTRAINT PK_Marco PRIMARY KEY (idMarco)
ALTER TABLE Tvroyale ADD CONSTRAINT PK_Tvroyale PRIMARY KEY (idTvroyale)
ALTER TABLE Clasificacionn ADD CONSTRAINT PK_Clasificacionn PRIMARY KEY (idClasificacion)
ALTER TABLE Torneo ADD CONSTRAINT PK_Torneo PRIMARY KEY (idTorneo)
ALTER TABLE Cofre ADD CONSTRAINT PK_Cofre PRIMARY KEY (idCofre)
ALTER TABLE Pase ADD CONSTRAINT PK_Pase PRIMARY KEY (idPase)
ALTER TABLE Nivel ADD CONSTRAINT PK_Nivel PRIMARY KEY (idNivel)
ALTER TABLE Tienda ADD CONSTRAINT PK_Tienda PRIMARY KEY (idTienda)
ALTER TABLE Reaccion ADD CONSTRAINT PK_Reaccion PRIMARY KEY (idReaccion)
ALTER TABLE Oferta ADD CONSTRAINT PK_Oferta PRIMARY KEY (idOferta)
ALTER TABLE CodigoRegalo ADD CONSTRAINT PK_CodigoRegalo PRIMARY KEY (idCodigoRegalo)
ALTER TABLE Cartaa ADD CONSTRAINT PK_Cartaa PRIMARY KEY (idCartaa)
ALTER TABLE Echizo ADD CONSTRAINT PK_Echizo PRIMARY KEY (idEchizo)
ALTER TABLE Tropa ADD CONSTRAINT PK_Tropa PRIMARY KEY (idTropa)
ALTER TABLE Estructura ADD CONSTRAINT PK_Estructura PRIMARY KEY (idEstructura)
ALTER TABLE Campeon ADD CONSTRAINT PK_Campeon PRIMARY KEY (idCampeon)
ALTER TABLE Habilidad ADD CONSTRAINT PK_Habilidad PRIMARY KEY (idHabilidad) 
ALTER TABLE Estadistica ADD CONSTRAINT PK_Estadistica PRIMARY KEY (idEstadistica)
ALTER TABLE Logro ADD CONSTRAINT PK_Logro PRIMARY KEY (idLogro)
ALTER TABLE Comodin ADD CONSTRAINT PK_Comodin PRIMARY KEY (idComodin)
ALTER TABLE Libro ADD CONSTRAINT PK_Libro PRIMARY KEY (idLibro)
ALTER TABLE Mision ADD CONSTRAINT PK_Mision PRIMARY KEY (idMision)
ALTER TABLE Bonus ADD CONSTRAINT PK_Bonus PRIMARY KEY (idBonus)
ALTER TABLE Supercell ADD CONSTRAINT PK_Supercell PRIMARY KEY (idSupercell)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE Puesto ADD CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto)
ALTER TABLE CreadorContenido ADD CONSTRAINT PK_CreadorContenido PRIMARY KEY (idCreadorContenido)
ALTER TABLE Clan ADD CONSTRAINT PK_Clan PRIMARY KEY (idClan)
ALTER TABLE Guerra ADD CONSTRAINT PK_Guerra PRIMARY KEY (idGuerra)
ALTER TABLE Botin ADD CONSTRAINT PK_Botin PRIMARY KEY (idBotin)
ALTER TABLE Mercader ADD CONSTRAINT PK_Mercader PRIMARY KEY (idMercader)
ALTER TABLE Solicitud ADD CONSTRAINT PK_Solicitud PRIMARY KEY (idSolicitud)
ALTER TABLE LigClan ADD CONSTRAINT PK_LigaClan PRIMARY KEY (idLigaClan)
ALTER TABLE ModoJuego ADD CONSTRAINT PK_ModoJuego PRIMARY KEY (idModoJuego)
ALTER TABLE Intrercambio ADD CONSTRAINT PK_Intrercambio PRIMARY KEY (idIntercambio)
ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido PRIMARY KEY (idPedido)
ALTER TABLE Donacion ADD CONSTRAINT PK_Donacion PRIMARY KEY (idDonacion)
ALTER TABLE Maestria ADD CONSTRAINT PK_Maestria PRIMARY KEY (idMaestria)
ALTER TABLE Aspecto ADD CONSTRAINT PK_Aspecto PRIMARY KEY (idAspecto)
ALTER TABLE RegistroJugador ADD CONSTRAINT PK_RegistroJugador PRIMARY KEY (idRegistroJugador)
ALTER TABLE SupercellEmpleado ADD CONSTRAINT PK_SupercellEmpleado PRIMARY KEY (idSupercellEmpleado)
ALTER TABLE SupercellCreadoConrtenido ADD CONSTRAINT PK_SupercellCreadoConrtenido PRIMARY KEY (idSupercellCreadoConrtenido)
ALTER TABLE ClanSolicitud ADD CONSTRAINT PK_ClanSolicitud PRIMARY KEY (idClanSolicitud)
ALTER TABLE ClanGuerra ADD CONSTRAINT PK_ClanGuerra PRIMARY KEY (idClanGuerra)
ALTER TABLE MisionJugador ADD CONSTRAINT PK_MisionJugador PRIMARY KEY (idMisionJugador)
ALTER TABLE LibroJugador ADD CONSTRAINT PK_LibroJugador PRIMARY KEY (idLibroJugador)
ALTER TABLE JugadorComodin ADD CONSTRAINT PK_JugadorComodin PRIMARY KEY (idJugadorComodin)
ALTER TABLE LogroJugador ADD CONSTRAINT PK_LogroJugador PRIMARY KEY (idLogroJugador)
ALTER TABLE MaestroJugador ADD CONSTRAINT PK_MaestroJugador PRIMARY KEY (idMaestroJugador)
ALTER TABLE JugadorMazo ADD CONSTRAINT PK_JugadorMazo PRIMARY KEY (idJugadorMazo)
ALTER TABLE PaseTienda ADD CONSTRAINT PK_PaseTienda PRIMARY KEY (idPaseTienda)
ALTER TABLE JugadorCofre ADD CONSTRAINT PK_JugadorCofre PRIMARY KEY (idJugadorCofre)
ALTER TABLE TiendaPago ADD CONSTRAINT PK_TiendaPago PRIMARY KEY (idTiendaPago)
ALTER TABLE JugadorMarco ADD CONSTRAINT PK_JugadorMarco PRIMARY KEY (idJugadorMarco)
ALTER TABLE JugadorTvroyale ADD CONSTRAINT PK_JugadorTvroyale PRIMARY KEY (idJugadorTvroyale)
ALTER TABLE JugadorAdorno ADD CONSTRAINT PK_JugadorAdorno PRIMARY KEY (idJugadorAdorno)


--Llaves Foraneas
--JUGADOR
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorDesafio FOREIGN KEY (idDesafio) REFERENCES Desafio (idDesafio)
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorLibro FOREIGN KEY (idLibro) REFERENCES Libro (idLibro)
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorClan FOREIGN KEY (idCLan) REFERENCES Clan (idCLan)
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorTorneo FOREIGN KEY (idTorneo) REFERENCES Torneo (idTorneo)
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorPase  FOREIGN KEY (idPase ) REFERENCES Pase  (idPase)
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorCaminoTrofeo  FOREIGN KEY (idCaminoTrofeo) REFERENCES CaminoTrofeo (idCaminoTrofeo )
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorCaminoLeyenda   FOREIGN KEY (idCaminoLeyenda ) REFERENCES CaminoLeyenda  (idCaminoLeyenda  )
ALTER TABLE Jugador ADD CONSTRAINT FK_JugadorEstadistica   FOREIGN KEY (idEstadistica ) REFERENCES Estadistica  (idEstadistica  )
ALTER TABLE Supercell ADD CONSTRAINT FK_SupercellJugador  FOREIGN KEY (idJugador ) REFERENCES Jugador  (idJugador  )

ALTER TABLE Guerra ADD CONSTRAINT FK_GuerraBotin   FOREIGN KEY (idBotin ) REFERENCES Botin   (idBotin  )

--Registro
ALTER TABLE Registro ADD CONSTRAINT FK_RegistroArena FOREIGN KEY (idArena) REFERENCES Arena (idArena)
--CaminoTrofeo
ALTER TABLE CaminoTrofeo ADD CONSTRAINT FK_CaminoTrofeoArena FOREIGN KEY (idArena) REFERENCES Arena (idArena)
ALTER TABLE CaminoTrofeo ADD CONSTRAINT FK_CaminoTrofeoLiga FOREIGN KEY (idLiga ) REFERENCES Liga  (idLiga )
--CaminoLeyenda
ALTER TABLE CaminoLeyenda ADD CONSTRAINT FK_CaminoLeyendaArena FOREIGN KEY (idArena) REFERENCES Arena (idArena)
--Pase
ALTER TABLE Pase ADD CONSTRAINT FK_PaseAspecto  FOREIGN KEY (idAspecto ) REFERENCES Aspecto  (idAspecto )
ALTER TABLE Pase ADD CONSTRAINT FK_PaseReaccion  FOREIGN KEY (idReaccion) REFERENCES Reaccion   (idReaccion  )
ALTER TABLE Pase ADD CONSTRAINT FK_PaseNivel  FOREIGN KEY (idNivel) REFERENCES Nivel  (idNivel )
--Tienda
ALTER TABLE Tienda ADD CONSTRAINT FK_TiendaCodre  FOREIGN KEY (idCofre  ) REFERENCES Cofre   (idCofre  )
ALTER TABLE Tienda ADD CONSTRAINT FK_TiendaReaccion  FOREIGN KEY (idReaccion) REFERENCES Reaccion   (idReaccion  )
ALTER TABLE Tienda ADD CONSTRAINT FK_TiendaOferta FOREIGN KEY (idOferta ) REFERENCES Oferta   (idOferta  )
ALTER TABLE Tienda ADD CONSTRAINT FK_TiendaCodigoRegalo FOREIGN KEY (idCodigoRegalo  ) REFERENCES CodigoRegalo    (idCodigoRegalo   )
--Echizo
ALTER TABLE Echizo ADD CONSTRAINT FK_EchizoCarta  FOREIGN KEY (idCarta) REFERENCES Cartaa (idCartaa)
--Tropa
ALTER TABLE Tropa ADD CONSTRAINT FK_TropaCarta   FOREIGN KEY (idCarta  ) REFERENCES Cartaa    (idCartaa  )
--Tropa
ALTER TABLE Estructura  ADD CONSTRAINT FK_EstructuraCarta  FOREIGN KEY (idCarta  ) REFERENCES Cartaa (idCartaa  )
--Tropa
ALTER TABLE Campeon   ADD CONSTRAINT FK_CampeonCarta  FOREIGN KEY (idCarta) REFERENCES Cartaa  (idCartaa )
ALTER TABLE Campeon   ADD CONSTRAINT FK_CampeonHabilidad FOREIGN KEY (idHabilidad) REFERENCES Habilidad  (idHabilidad)
--Mision
ALTER TABLE Mision ADD CONSTRAINT FK_MisionBonus FOREIGN KEY (idBonus  ) REFERENCES Bonus (idBonus)
--Empleado
ALTER TABLE Empleado  ADD CONSTRAINT FK_EmpleadoPuesto  FOREIGN KEY (idPuesto ) REFERENCES Puesto (idPuesto)
--Clan
ALTER TABLE Clan  ADD CONSTRAINT FK_ClanModoJuego FOREIGN KEY (idModoJuego   ) REFERENCES ModoJuego  (idModoJuego   )
ALTER TABLE Clan  ADD CONSTRAINT FK_ClanMercader  FOREIGN KEY (idMercader  ) REFERENCES Mercader (idMercader  )
ALTER TABLE Clan  ADD CONSTRAINT FK_ClanLigClan   FOREIGN KEY (idLigClan ) REFERENCES LigClan  (idLigaClan )
ALTER TABLE Clan  ADD CONSTRAINT FK_ClanPedido    FOREIGN KEY (idPedido  ) REFERENCES Pedido   (idPedido  )
ALTER TABLE Clan  ADD CONSTRAINT FK_ClanIntercambio     FOREIGN KEY (idIntercambio ) REFERENCES Intrercambio (idIntercambio)
--RegistroJugador
ALTER TABLE RegistroJugador  ADD CONSTRAINT FK_RegistroJugadorRegistro FOREIGN KEY (idRegistro) REFERENCES Registro (idRegistro)
ALTER TABLE RegistroJugador  ADD CONSTRAINT FK_RegistroJugadorJugador FOREIGN KEY (idJugador) REFERENCES Jugador (idJugador)
--SupercellEmpleado   
ALTER TABLE SupercellEmpleado ADD CONSTRAINT FK_SupercellEmpleadoSupercell FOREIGN KEY (idSupercell) REFERENCES Supercell (idSupercell)
ALTER TABLE SupercellEmpleado ADD CONSTRAINT FK_SupercellEmpleadoEmpleado FOREIGN KEY (idEmpleado ) REFERENCES Empleado (idEmpleado )
--SupercellCreadoConrtenido      
ALTER TABLE SupercellCreadoConrtenido ADD CONSTRAINT FK_SupercellCreadoConrtenidoSupercell  FOREIGN KEY (idSupercell) REFERENCES Supercell (idSupercell)
ALTER TABLE SupercellCreadoConrtenido ADD CONSTRAINT FK_SupercellCreadoConrtenidoCreadorContenido  FOREIGN KEY (idCreadorContenido  ) REFERENCES CreadorContenido  (idCreadorContenido  )
--ClanSolicitud         
ALTER TABLE ClanSolicitud  ADD CONSTRAINT FK_ClanSolicitudClan  FOREIGN KEY (idClan ) REFERENCES Clan  (idClan )
ALTER TABLE ClanSolicitud  ADD CONSTRAINT FK_ClanSolicitudSolicitud  FOREIGN KEY (idSolicitud   ) REFERENCES Solicitud   (idSolicitud   )
--ClanGuerra	            
ALTER TABLE ClanGuerra	ADD CONSTRAINT FK_ClanGuerraGuerra  FOREIGN KEY (idGuerra) REFERENCES Guerra   (idGuerra  )
ALTER TABLE ClanGuerra  ADD CONSTRAINT FK_ClanGuerraClan  FOREIGN KEY (idClan ) REFERENCES Clan    (idClan)
--LibroJugador	   	            
ALTER TABLE LibroJugador ADD CONSTRAINT FK_LibroJugadorLibro	FOREIGN KEY (idLibro ) REFERENCES Libro (idLibro)
ALTER TABLE LibroJugador ADD CONSTRAINT FK_LibroJugadorJugador FOREIGN KEY (idJugador ) REFERENCES Jugador (idJugador)
--MisionJugador
ALTER TABLE MisionJugador  ADD CONSTRAINT FK_MisionJugadorMision  FOREIGN KEY (idMision  ) REFERENCES Mision (idMision )
ALTER TABLE MisionJugador  ADD CONSTRAINT FK_MisionJugadorJugador FOREIGN KEY (idJugador ) REFERENCES Jugador (idJugador)
--JugadorComodin
ALTER TABLE JugadorComodin  ADD CONSTRAINT FK_JugadorComodinJugador FOREIGN KEY (idJugador ) REFERENCES Jugador (idJugador)
ALTER TABLE JugadorComodin  ADD CONSTRAINT FK_JugadorComodinComodin FOREIGN KEY (idComodin) REFERENCES Comodin (idComodin)
--JugadorComodin
ALTER TABLE LogroJugador  ADD CONSTRAINT FK_LogroJugadoLogro FOREIGN KEY (idLogro  ) REFERENCES Logro  (idLogro )
ALTER TABLE LogroJugador  ADD CONSTRAINT FK_LogroJugadorJugador FOREIGN KEY (idJugador ) REFERENCES Jugador  (idJugador )
--MaestroJugador
ALTER TABLE MaestroJugador  ADD CONSTRAINT FK_MaestroJugadorMaestro FOREIGN KEY (idMaestro) REFERENCES Maestro  (idMaestro )
ALTER TABLE MaestroJugador  ADD CONSTRAINT FK_MaestroJugadorJugador FOREIGN KEY (idJugador ) REFERENCES Jugador  (idJugador )
--JugadorMazo
ALTER TABLE JugadorMazo  ADD CONSTRAINT FK_JugadorMazoJugador FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador )
ALTER TABLE JugadorMazo  ADD CONSTRAINT FK_JugadorMazoMazo FOREIGN KEY (idMazo ) REFERENCES Mazo  (idMazo )
--PaseTienda
ALTER TABLE PaseTienda  ADD CONSTRAINT FK_PaseTiendaPase FOREIGN KEY (idPase) REFERENCES Pase(idPase)
ALTER TABLE PaseTienda  ADD CONSTRAINT FK_PaseTiendaTienda FOREIGN KEY (idTienda ) REFERENCES Tienda  (idTienda )
--JugadorCofre
ALTER TABLE JugadorCofre  ADD CONSTRAINT FK_JugadorCofreJugador FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador)
ALTER TABLE JugadorCofre  ADD CONSTRAINT FK_JugadorCofreCofre FOREIGN KEY (idCofre ) REFERENCES Cofre  (idCofre )
--TiendaPago
ALTER TABLE TiendaPago  ADD CONSTRAINT FK_TiendaPagoTienda FOREIGN KEY (idTienda) REFERENCES Tienda  (idTienda)
ALTER TABLE TiendaPago  ADD CONSTRAINT FK_TiendaPagoPago FOREIGN KEY (idPago ) REFERENCES Pago  (idPago )
--JugadorMarco
ALTER TABLE JugadorMarco ADD CONSTRAINT FK_JugadorMarcoJugador  FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador)
ALTER TABLE JugadorMarco ADD CONSTRAINT FK_JugadorMarcoMarco FOREIGN KEY (idMarco ) REFERENCES Marco  (idMarco )
--JugadorTvroyale
ALTER TABLE JugadorTvroyale ADD CONSTRAINT FK_JugadorTvroyaleJugador  FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador)
ALTER TABLE JugadorTvroyale ADD CONSTRAINT FK_JugadorTvroyaleTvroyale FOREIGN KEY (idTvroyale) REFERENCES Tvroyale (idTvroyale)
--JugadorAdorno
ALTER TABLE JugadorAdorno ADD CONSTRAINT FK_JugadorAdornoJugador  FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador)
ALTER TABLE JugadorAdorno ADD CONSTRAINT FK_JugadorAdornoAdorno FOREIGN KEY (idAdorno ) REFERENCES Adorno  (idAdorno )
--MazoCarta
ALTER TABLE MazoCarta ADD CONSTRAINT FK_MazoCartaMazo  FOREIGN KEY (idMazo) REFERENCES Mazo  (idMazo)
ALTER TABLE MazoCarta ADD CONSTRAINT FK_MazoCartaCarta FOREIGN KEY (idCarta) REFERENCES Cartaa  (idCartaa)
--CartaMaestria
ALTER TABLE Cartaa ADD CONSTRAINT FK_CartaaMaestria  FOREIGN KEY (idMaestria) REFERENCES Maestria  (idMaestria)
--Clasificacion
ALTER TABLE Clasificacionn ADD CONSTRAINT FK_ClasificacionnJugador  FOREIGN KEY (idJugador) REFERENCES Jugador  (idJugador)

ALTER TABLE Pedido ADD CONSTRAINT FK_PedidoDonacion  FOREIGN KEY (idDonacion) REFERENCES Donacion  (idDonacion)

--INDICES
CREATE INDEX IX_Pago ON Pago (idPago)
CREATE INDEX IX_Mazo ON Mazo (idMazo)
CREATE INDEX IX_Desafio ON Desafio(idDesafio)
CREATE INDEX IX_Jugador ON Jugador(idJugador)
CREATE INDEX IX_Registro ON Registro(idRegistro)
CREATE INDEX IX_CaminoTrofeo ON CaminoTrofeo(idCaminoTrofeo)
CREATE INDEX IX_Liga ON Liga(idLiga)
CREATE INDEX IX_Arena ON Arena(idArena)
CREATE INDEX IX_Adorno ON Adorno(idAdorno)
CREATE INDEX IX_Marco ON Marco(idMarco)
CREATE INDEX IX_Tvroyale ON Tvroyale(idTvroyale)
CREATE INDEX IX_Clasificacionn ON Clasificacionn(idClasificacion)
CREATE INDEX IX_Torneo ON Torneo(idTorneo)
CREATE INDEX IX_Cofre ON Cofre(idCofre)
CREATE INDEX IX_Pase ON Pase(idPase)
CREATE INDEX IX_Nivel ON Nivel(idNivel)
CREATE INDEX IX_Tienda ON Tienda(idTienda)
CREATE INDEX IX_Reaccion ON Reaccion(idReaccion)
CREATE INDEX IX_Oferta ON Oferta(idOferta)
CREATE INDEX IX_Carta ON Cartaa(idCartaa)
CREATE INDEX IX_Echizo ON Echizo(idEchizo)
CREATE INDEX IX_Tropa ON Tropa(idTropa)
CREATE INDEX IX_Estructura ON Estructura(idEstructura)
CREATE INDEX IX_Campeon ON Campeon(idCampeon)
CREATE INDEX IX_Habilidad ON Habilidad(idHabilidad)
CREATE INDEX IX_Estadistica ON Estadistica(idEstadistica)
CREATE INDEX IX_Logro ON Logro(idLogro)
CREATE INDEX IX_Comodin ON Comodin(idComodin)
CREATE INDEX IX_Libro ON Libro(idLibro)
CREATE INDEX IX_Mision  ON Mision(idMision)
CREATE INDEX IX_Bonus  ON Bonus(idBonus)
CREATE INDEX IX_Supercell ON Supercell(idSupercell)
CREATE INDEX IX_Empleado ON Empleado (idEmpleado)
CREATE INDEX IX_Puesto ON Puesto (idPuesto)
CREATE INDEX IX_CreadorContenido   ON CreadorContenido (idCreadorContenido)
CREATE INDEX IX_Clan ON Clan (idClan)
CREATE INDEX IX_Guerra ON Guerra (idGuerra)
CREATE INDEX IX_Botin ON Botin (idBotin)
CREATE INDEX IX_Mercader ON Mercader (idMercader)
CREATE INDEX IX_LigClan ON LigClan (idLigaClan)
CREATE INDEX IX_ModoJuego ON ModoJuego (idModoJuego)
CREATE INDEX IX_Intrercambio ON Intrercambio (idIntercambio)
CREATE INDEX IX_Donacion ON Donacion (idDonacion)
CREATE INDEX IX_Maestria ON Maestria (idMaestria)
CREATE INDEX IX_Aspecto ON Aspecto (idAspecto)
CREATE INDEX IX_RegistroJugador ON RegistroJugador (idRegistroJugador)
CREATE INDEX IX_SupercellEmpleado ON SupercellEmpleado (idSupercellEmpleado)
CREATE INDEX IX_SupercellCreadoConrtenido ON SupercellCreadoConrtenido (idSupercellCreadoConrtenido)
CREATE INDEX IX_ClanSolicitud ON ClanSolicitud (idClanSolicitud)
CREATE INDEX IX_ClanGuerra ON ClanGuerra (idClanGuerra)
CREATE INDEX IX_MisionJugador ON MisionJugador(idMisionJugador)
CREATE INDEX IX_LibroJugador ON LibroJugador(idLibroJugador)
CREATE INDEX IX_JugadorComodin ON JugadorComodin(idJugadorComodin)
CREATE INDEX IX_LogroJugador ON LogroJugador(idLogroJugador)
CREATE INDEX IX_MaestroJugador ON MaestroJugador(idMaestroJugador)
CREATE INDEX IX_JugadorMazo ON JugadorMazo(idJugadorMazo)
CREATE INDEX IX_PaseTienda ON PaseTienda(idPaseTienda)
CREATE INDEX IX_JugadorCofre ON JugadorCofre(idJugadorCofre)
CREATE INDEX IX_TiendaPago ON TiendaPago (idTiendaPago)
CREATE INDEX IX_JugadorMarco ON JugadorMarco(idJugadorMarco)
CREATE INDEX IX_JugadorTvroyale ON JugadorTvroyale(idJugadorTvroyale)
CREATE INDEX IX_JugadorAdorno ON JugadorAdorno (idJugadorAdorno)

--ARENA
INSERT INTO Arena(tematica, numero, nombre, rango) values ('bosque','1','inicial','0-200')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('fuego','2','volcan','200-400')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('hielo','3','montaña','400-600')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('magia','4','caldero','600-800')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('selva','5','fortaleza','600-800')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('mina','6','mina','800-1000')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('dundes','7','estadio duende','1000-1200')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('pekka','8','fortaleza del pekka','1200-1400')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('electricidad','9','electrovalle','1400-1600')
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('real','10','palacio','1600-1800')
go

UPDATE Arena set nombre= 'fuerte del pekka' WHERE idArena = 8
go
DELETE FROM Arena WHERE idArena = 1
--sin el where borra todo
go
INSERT INTO Arena(tematica, numero, nombre, rango) values ('Aire','11','Isla','1800-1600')
go
SELECT *FROM Arena

--Liga
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('4','100 oro','bronce 1','1' )
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena, estatus) values ('5','100 oro','bronce 2','2', '1')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('6','100 oro','bronce 3','3')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('7','100 oro','plata 1','4')
go  
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('8','100 oro','plata 2','5')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('9','100 oro','plata 3','6')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('10','100 oro','diamante 1','7')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('11','100 oro','diamante 2','8')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('12','100 oro','diamante 3','9')
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('13','100 oro','Maestro 1','10')
go

UPDATE Liga set recompensa= '500 oro' WHERE idLiga =10
go
DELETE FROM Liga WHERE idLiga = 1
--sin el where borra todo
go
INSERT INTO Liga(coronas, recompensa, nombre, idArena) values ('14','100 oro','Maestro 2','11')
go
SELECT *FROM Liga

--Registro
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','5' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','4' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','4' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','2 minuto','3' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','5' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','6' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','3 minuto','8' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','8' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','4 minuto','5' )
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','2' )
go
UPDATE Registro set modalidad= 'muertte subita' WHERE idRegistro =10
go
DELETE FROM Registro WHERE idRegistro = 1
--sin el where borra todo
go
INSERT INTO Registro(modalidad, duracion, idArena) values ('batalla','1 minuto','2' )
go
SELECT *FROM Registro

--Adorno
INSERT INTO Adorno(nombre, tematica, calidad) values ('kung fu monje','templo','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('barbaro bailarin','baile','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('esqueelteos','terror','normal' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('monta puerco','valle','epico' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('dragon','fuego','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('monje','templo','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('espiritu fuego','lava','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('kung ','templo','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values (' fu','templo','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('kung fu monje','templo','mitica' )
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('arquera','GUERRA','especial' )
go
SELECT *FROM Registro
UPDATE Adorno set calidad= 'legendaria' WHERE idAdorno =4
go
DELETE FROM Adorno WHERE idAdorno = 1
--sin el where borra todo
go
INSERT INTO Adorno(nombre, tematica, calidad) values ('arquera','ninguna','especial' )
go

SELECT *FROM Adorno

--Marco
INSERT INTO Marco(nombre, calidad, fondo) values ('hojas','mitica','arboles' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('fuego','mitica','volcan' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hielo','especial','montaña' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('murcielagos','mitica','cueva' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('espiritus','mitica','magia' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('pixelart','legendaria','pueblo' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hallowen','mitica','brujas' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hojas','mitica','espceial' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hojas','mitica','espceial' )
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hojas','mitica','espceial' )
go
SELECT *FROM Marco
UPDATE Marco set calidad= 'legendaria' WHERE idMarco =4
go
DELETE FROM Marco WHERE idMarco = 1
--sin el where borra todo
go
INSERT INTO Marco(nombre, calidad, fondo) values ('hojas','mitica','espceial' )
go
SELECT *FROM Marco


--TvRoyale
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('gil','YAHIR','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','milton','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('nose','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pepe','marcos','1123213' )
go

SELECT *FROM Tvroyale
UPDATE Tvroyale set reproducciones = '123413' WHERE idTvroyale =4
go
DELETE FROM Tvroyale WHERE idTvroyale = 1
--sin el where borra todo
go
INSERT INTO Tvroyale(jugador1, jugador2, reproducciones) values ('pewepe','madsfgfrcos','1123213' )
go
SELECT *FROM Tvroyale



--Cofre
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de plata','1233','1231' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de oro','1234','545' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de madera','6547','445' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de plata','1233','1231' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre magico ','4332','32424' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de super magico','4234','12334241' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de gigante','2443','12334241' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de rayo','334','123' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de reyaja','4334','189231' )
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de plata','1233','1231' )
go
SELECT *FROM Cofre
UPDATE Cofre set nombre = 'fortuna' WHERE idCofre = 3
go
DELETE FROM Cofre WHERE idCofre = 10
--sin el where borra todo
go
INSERT INTO Cofre(nombre, cantidadOro, cartas) values ('cofre de rey','3244','189231' )
go
SELECT *FROM Cofre


--Reaccion
INSERT INTO Reaccion(nombre, audio, animacion) values ('esqueleto','choque','golpe de 2 esqueletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('esqueleto','choerque','goldfspe de 2 esquesdfletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('esqueleto23','ch34que','golpe de 2 esqueletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('esque32rewleto','choqerue','golpe rede 2 esqueletrtos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('esquelesfdo','choerque','goelrpe de 2 esrrequeletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('eserwqueleto','choqrerue','golpe de 2 esquelerertos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('rey','choque','golpe de 2 esqueletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('nose','choque','golpe de 2 esqueletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('esqueleto','choque','golpe ewr 2 esqueletos' )
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('apruebeme','choque','golewrewpe de 2 esqueletos' )
go
SELECT *FROM Reaccion
UPDATE Reaccion set nombre = 'erwrew' WHERE idReaccion = 3
go
DELETE FROM Reaccion WHERE idReaccion = 4
--sin el where borra todo
go
INSERT INTO Reaccion(nombre, audio, animacion) values ('apruebemex2','choeweque','goewelewrewpewe de 2 esqewueletos' )
go
SELECT *FROM Reaccion

--Oferta
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('2 cartas legendarias','2022-1-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('3 cartas legendarias','2022-1-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('3 cartas legendarias','2022-1-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('4 cartas legendarias','2022-1-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('5 cartas legendarias','2022-6-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('6 cartas legendarias','2022-7-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('7 cartas legendarias','2022-2-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('8 cartas legendarias','2022-1-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('9 cartas legendarias','2022-2-12')
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('10 cartas legendarias','2022-8-12')
go
SELECT *FROM Oferta
UPDATE Oferta set fechaVencimiento = '2022-8-12' WHERE idOferta = 3
go
DELETE FROM Oferta WHERE idOferta = 4
--sin el where borra todo
go
INSERT INTO Oferta(descripcion, fechaVencimiento) values ('1 cartas legendarias','8-12-2022')
go
SELECT *FROM Oferta

--Torneo
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo1','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo10','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo2','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo3','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo4','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo5','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo6','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo7','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo8','10','100')
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo9','10','100')
go
SELECT *FROM Torneo
UPDATE Torneo set capacidad = '122' WHERE idTorneo = 3
go
DELETE FROM Torneo WHERE idTorneo = 4
--sin el where borra todo
go
INSERT INTO Torneo(nombre, duracion, capacidad) values ('torneo22','10','100')
go
SELECT *FROM Torneo

--CodigoRegalo
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasdsd33312','1200','2022-8-12')
go
SELECT *FROM CodigoRegalo
UPDATE CodigoRegalo set credito = '12222' WHERE idCodigoRegalo = 3
go
DELETE FROM CodigoRegalo WHERE idCodigoRegalo = 4
--sin el where borra todo
go
INSERT INTO CodigoRegalo(codigo, credito, fechaVencimiento) values ('12ffsasFdsd33312','13232','2022-8-12')
go
SELECT *FROM CodigoRegalo

--Pago
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno, codigoPostal, correo)
values ('123123123','2022-8-12','nombre1', 'apellidoP1', 'apellidoM1','25870','correo1')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre2', 'apellidoP2', 'apellidoM2','25870','correo2')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre3', 'apellidoP3', 'apellidoM3','25870','correo3')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre4', 'apellidoP4', 'apellidoM4','25870','correo4')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre5', 'apellidoP5', 'apellidoM5','25870','correo5')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre6', 'apellidoP6', 'apellidoM6','25870','correo6')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre1', 'apellidoP7', 'apellidoM7','25870','correo7')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre8', 'apellidoP8', 'apellidoM8','25870','correo8')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre9', 'apellidoP9', 'apellidoM9','25870','correo9')
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre10', 'apellidoP10', 'apellidoM10','25870','correo10')
go
SELECT *FROM Pago
UPDATE Pago set nombre = 'nombreUpdate' WHERE idPago= 3
go
DELETE FROM Pago WHERE  idPago= 4
--sin el where borra todo
go
INSERT INTO Pago(numeroTarjeta, fechaVencimiento, nombre, apellidPaterno, apellidoMaterno,codigoPostal,correo)
values ('123123123','2022-8-12','nombre10', 'apellidoP10', 'apellidoM10','25870','correo10')
go
SELECT *FROM Pago

--Aspecto
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre1','ruta1','temporada1','calidad1')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre2','ruta2','temporada2','calidad2')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre3','ruta3','temporada3','calidad3')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre4','ruta4','temporada4','calidad4')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre5','ruta5','temporada5','calidad5')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre6','ruta6','temporada6','calidad6')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre7','ruta7','temporada7','calidad7')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre8','ruta8','temporada8','calidad8')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre9','ruta9','temporada9','calidad9')
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre10','ruta10','temporada10','calidad10')
go
SELECT *FROM Aspecto
UPDATE Aspecto set nombre = 'nombreUpdate' WHERE idAspecto= 3
go
DELETE FROM Aspecto WHERE  idAspecto= 4
--sin el where borra todo
go
INSERT INTO Aspecto(nombre, ruta, temporada, calidad) values ('nombre11','ruta11','temporada11','calidad11')
go
SELECT *FROM Aspecto

--Nivel
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('1','recompensa1','recompensa1')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('2','recompensa2','recompensa2')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('3','recompensa3','recompensa3')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('4','recompensa4','recompensa4')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('5','recompensa5','recompensa5')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('6','recompensa6','recompensa6')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('7','recompensa7','recompensa7')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('8','recompensa8','recompensa8')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('9','recompensa9','recompensa9')
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('10','recompensa10','recompensa10')
go
SELECT *FROM Nivel
UPDATE Nivel set recompensaGratis = 'recompensaUpdate' WHERE idNivel= 3
go
DELETE FROM Nivel WHERE  idNivel= 6
--sin el where borra todo
go
INSERT INTO Nivel(numero, recompensaGratis, recompensaRoyale) values ('1','recompensa11','recompensa11')
go
SELECT *FROM Nivel

--Desafio
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre1')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre2')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre3')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre4')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre5')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre6')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre7')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre8')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre9')
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre10')
go
SELECT *FROM Desafio
UPDATE Desafio set nombre = 'nombreUpdate' WHERE idDesafio= 3
go
DELETE FROM Desafio WHERE  idDesafio= 6
--sin el where borra todo
go
INSERT INTO Desafio(duracion, victorias, nombre) values ('20','14','nombre11')
go
SELECT *FROM Desafio

--Habilidad
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre1','duracion1','1','recarga1', 'descripcion1')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre2','duracion2','1','recarga1', 'descripcion2')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre3','duracion3','1', 'recarga1','descripcion3')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre4','duracion4','1', 'recarga1','descripcion4')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre5','duracion5','1','recarga1', 'descripcion5')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre6','duracion6','1', 'recarga1','descripcion6')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre7','duracion7','1','recarga1', 'descripcion7')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre8','duracion8','1','recarga1', 'descripcion8')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre9','duracion9','1','recarga1', 'descripcion9')
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre10','duracion10','1','recarga1', 'descripcion10')
go
SELECT *FROM Habilidad
UPDATE Habilidad set nombre = 'nombreUpdate' WHERE idHabilidad= 3
go
DELETE FROM Habilidad WHERE  idHabilidad= 6
--sin el where borra todo
go
INSERT INTO Habilidad(nombre, duracion, coste, recarga, descripcion) values ('nombre11','duracion11','1','recarga1', 'descripcion11')
go
SELECT *FROM Habilidad

--Maestria
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre1','dificultad1','calidad1', 'experiencia1', 'definicion1', 'recompensa1')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre12','dificultad3','calidad2', 'experiencia2', 'definicion2', 'recompensa2')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre3','dificultad4','calidad3', 'experiencia3', 'definicion3', 'recompensa3')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre4','dificultad5','calidad4', 'experiencia4', 'definicion4', 'recompensa4')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre5','dificultad6','calidad5', 'experiencia5', 'definicion5', 'recompensa5')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre6','dificultad7','calidad6', 'experiencia6', 'definicion6', 'recompensa6')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre7','dificultad8','calidad7', 'experiencia7', 'definicion7', 'recompensa7')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre8','dificultad8','calidad8', 'experiencia8', 'definicion8', 'recompensa8')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre9','dificultad9','calidad9', 'experiencia9', 'definicion9', 'recompensa9')
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre10','dificultad10','calidad10', 'experiencia10', 'definicion10', 'recompensa10')
go
SELECT *FROM Maestria
UPDATE Maestria set nombre = 'nombreUpdate' WHERE idMaestria= 3
go
DELETE FROM Maestria WHERE  idMaestria= 6
--sin el where borra todo
go
INSERT INTO Maestria(nombre,dificultad, calidad, experiencia,definicion,recompensa) 
values ('nombre11','dificultad11','calidad11', 'experiencia11', 'definicion11', 'recompensa11')
go
SELECT *FROM Maestria

--Carta
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad1','descripcion1', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad2','descripcion2', '2')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad3','descripcion3', '2')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad14','descripcion4', '2')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad5','descripcion5', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad6','descripcion6', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad7','descripcion7', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad8','descripcion8', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad9','descripcion9', '1')
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad10','descripcion10', '1')
go
SELECT *FROM Cartaa
UPDATE Cartaa set calidad = 'calidadUpdate' WHERE idCartaa= 3
go
DELETE FROM Cartaa WHERE  idCartaa= 6
--sin el where borra todo
go
INSERT INTO Cartaa(calidad, descripcion, idMaestria) values ('calidad11','descripcion11', '1')
go
SELECT *FROM Cartaa

--Mazo
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel1','tipo1','coste1' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel2','tipo2','coste2' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel3','tipo3','coste3' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel4','tipo4','coste4' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel5','tipo5','coste5' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel6','tipo6','coste6' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel7','tipo7','cost47' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel8','tipo8','coste8' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel9','tipo9','coste9' )
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel10','tipo10','coste10' )
go
SELECT *FROM Mazo
UPDATE Mazo set tipo = 'TipoUpdate' WHERE idMazo= 3
go
DELETE FROM Mazo WHERE  idMazo= 6
--sin el where borra todo
go
INSERT INTO Mazo(nivel, tipo, coste) values ('nivel11','tipo11','coste11' )
go
SELECT *FROM Mazo

--Maestro
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre1','nivel1','difiultad1' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre2','nivel4','difiultad2' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre3','nivel4','difiultad3' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre4','nivel5','difiultad4' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre5','niveñ6','difiultad5' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre6','nivel7','difiultad6' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre7','nivel8','difiultad7' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre8','nivel8','difiultad8' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre9','nivel9','difiultad9' )
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre10','nivel10','difiultad10' )
go
SELECT *FROM Maestro
UPDATE Maestro set nombre = 'nombreUpdate' WHERE idMaestro= 3
go
DELETE FROM Maestro WHERE  idMaestro= 6
--sin el where borra todo
go
INSERT INTO Maestro(nombre,nivel,dificultad) values ('nombre11','nivel11','difiultad11' )
go
SELECT *FROM Maestro


--Estadistica
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3332','1231','12344','100/100' )
go
SELECT *FROM Estadistica
UPDATE Estadistica set victorias = '213212' WHERE idEstadistica= 3
go
DELETE FROM Estadistica WHERE  idEstadistica= 6
--sin el where borra todo
go
INSERT INTO Estadistica(victorias, tresCoronas, donaciones, coleccion) values ('3323432','1232431','12234344','99/100' )
go
SELECT *FROM Estadistica

--Logro
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre1','dificultad1','descripcion1' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre2','dificultad2','descripcion2' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre3','dificultad3','descripcion3' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre4','dificultad4','descripcion4' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre5','dificultad5','descripcion5' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre6','dificultad6','descripcion6' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre7','dificultad7','descripcion7' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre8','dificultad8','descripcion8' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre9','dificultad9','descripcion9' )
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre10','dificultad10','descripcion10' )
go
SELECT *FROM Logro
UPDATE Logro set nombre = 'nombreUpdate' WHERE idLogro= 3
go
DELETE FROM Logro WHERE  idLogro= 6
--sin el where borra todo
go
INSERT INTO Logro(nombre,dificultad,descripcion) values ('nombre11','dificultad11','descripcion11' )
go
SELECT *FROM Logro

--Comodin
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso1','calidad1' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso2','calidad2' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso3','calidad3' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso4','calidad4' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso5','calidad5' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso6','calidad6' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso7','calidad7' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso8','calidad8' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso9','calidad9' )
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('234','1000','uso10','calidad10' )
go
SELECT *FROM Comodin
UPDATE Comodin set almacen = '103' WHERE idComodin= 3
go
DELETE FROM Comodin WHERE  idComodin= 6
--sin el where borra todo
go
INSERT INTO Comodin(almacen,maximo,uso,calidad) values ('2324','1000','uso11','calidad11' )
go
SELECT *FROM Comodin

--Botin
INSERT INTO Botin(oro, cartas, comodines) values ('12333','1233112','2133' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('8333','8979','456' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('987','567','987689' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('36','4567','24434' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('9687','67','687' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('687','679','69' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('69','79','2136973' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('7679','69','219633' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('978','8768','976' )
go
INSERT INTO Botin(oro, cartas, comodines) values ('69','123316912','769' )
go
SELECT *FROM Botin
UPDATE Botin set cartas = '103' WHERE idBotin= 3
go
DELETE FROM Botin WHERE  idBotin= 6
--sin el where borra todo
go
INSERT INTO Botin(oro, cartas, comodines) values ('32','9312','4554' )
go
SELECT *FROM Botin

--Bonus
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario1','semanal1','12332','recompensa1' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario2','semanal2','1233232','recompensa2' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario3','semanal3','1233432','recompensa3' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario4','semanal4','12332','recompensa4' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario5','semanal5','129332','recompensa5' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario6','semanal6','1238732','recompensa6' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario7','semanal7','12345332','recompensa7' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario8','semanal8','123732','recompensa8' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario9','semanal9','1288332','recompensa9' )
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario10','semanal10','1266332','recompensa10' )
go
SELECT *FROM Bonus
UPDATE Bonus set recompensa = 'recompensaUpdate' WHERE idBonus= 3
go
DELETE FROM Bonus WHERE  idBonus= 6
--sin el where borra todo
go
INSERT INTO Bonus(diario, semanal, experiencia, recompensa) values ('diario11','semanal11','12231332','recompensa11' )
go
SELECT *FROM Bonus

--Libro
INSERT INTO Libro(calidad, uso) values ('calidad1','Uso1' )
go
INSERT INTO Libro(calidad, uso) values ('calidad2','Uso2' )
go
INSERT INTO Libro(calidad, uso) values ('calidad3','Uso3' )
go
INSERT INTO Libro(calidad, uso) values ('calidad4','Uso4' )
go
INSERT INTO Libro(calidad, uso) values ('calidad5','Uso5' )
go
INSERT INTO Libro(calidad, uso) values ('calidad6','Uso6' )
go
INSERT INTO Libro(calidad, uso) values ('calidad7','Uso7' )
go
INSERT INTO Libro(calidad, uso) values ('calidad8','Uso8' )
go
INSERT INTO Libro(calidad, uso) values ('calidad9','Uso9' )
go
INSERT INTO Libro(calidad, uso) values ('calidad10','Uso10' )
go
SELECT *FROM Libro
UPDATE Libro set calidad = 'calidadaUpdate' WHERE idLibro= 3
go
DELETE FROM Libro WHERE  idLibro= 6
--sin el where borra todo
go
INSERT INTO Libro(calidad, uso) values ('calidad11','Uso11' )
go
SELECT *FROM Libro

--Intercambio
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad1','2022-8-12','cantidad1' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad2','2022-8-12','cantidad2' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad3','2022-8-12','cantidad3' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad4','2022-8-12','cantidad4' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad5','2022-8-12','cantidad5' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad6','2022-8-12','cantidad6' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad7','2022-8-12','cantidad7' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad8','2022-8-12','cantidad8' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad9','2022-8-12','cantidad9' )
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad10','2022-8-12','cantidad10' )
go
SELECT *FROM Intrercambio
UPDATE Intrercambio set calidad = 'calidadaUpdate' WHERE idIntercambio= 3
go
DELETE FROM Intrercambio WHERE  idIntercambio= 6
--sin el where borra todo
go
INSERT INTO Intrercambio(calidad, fecha, cantidad) values ('calidad11','2022-8-12','cantidad11' )
go
SELECT *FROM Intrercambio

--Donacion
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad1','2022-8-12','codigo1' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad2','2022-8-12','codigo2' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad3','2022-8-12','codigo3' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad4','2022-8-12','codigo4' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad5','2022-8-12','codigo5' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad6','2022-8-12','codigo6' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad7','2022-8-12','codigo7' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad8','2022-8-12','codigo8' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad9','2022-8-12','codigo9' )
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad10','2022-8-12','codigo10' )
go
SELECT *FROM Donacion
UPDATE Donacion set calidad = '2022-8-12' WHERE idDonacion= 3
go
DELETE FROM Donacion WHERE  idDonacion= 6
--sin el where borra todo
go
INSERT INTO Donacion(cantidad, calidad, codigo) values ('cantidad11','2022-8-12','codigo11' )
go
SELECT *FROM Donacion

--Donacion
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre1','dificultad1','descrpicion1' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre2','dificultad2','descrpicion2' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre3','dificultad3','descrpicion3' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre4','dificultad4','descrpicion4' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre5','dificultad5','descrpicion5' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre6','dificultad6','descrpicion6' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre7','dificultad7','descrpicion7' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre8','dificultad8','descrpicion8' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre9','dificultad','descrpicion9' )
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre10','dificultad10','descrpicion10' )
go
SELECT *FROM ModoJuego
UPDATE ModoJuego set nombre = 'nombreUpdate' WHERE idModoJuego= 3
go
DELETE FROM ModoJuego WHERE  idModoJuego= 6
--sin el where borra todo
go
INSERT INTO ModoJuego(nombre, dificultad, descripcion) values ('nombre11','dificultad11','descrpicion11' )
go
SELECT *FROM ModoJuego

--LigaClan
INSERT INTO LigClan(nombre, rango) values ('nombre1','rango1' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre2','rango2' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre3','rango3' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre4','rango4' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre5','rango5' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre6','rango6' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre7','rango7' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre8','rango8' )
go
INSERT INTO LigClan(nombre, rango) values ('nombre9','rango9' )
go
INSERT INTO LigClan(nombre, rango) values ('nombr10','rango10' )
go
SELECT *FROM LigClan
UPDATE LigClan set nombre = 'nombreUpdate' WHERE idLigaClan= 3
go
DELETE FROM LigClan WHERE  idLigaClan= 6
--sin el where borra todo
go
INSERT INTO LigClan(nombre, rango) values ('nombr111','rango11' )
go
SELECT *FROM LigClan


--Solicitud
INSERT INTO Solicitud(nombre, trofeos) values ('nombre1','1324' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre2','1312324' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre3','1321234' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre4','3123' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre5','1312312324' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre6','34323' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre7','2347876' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre8','86347986' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre9','13536454724' )
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre10','654' )
go
SELECT *FROM Solicitud
UPDATE Solicitud set nombre = 'nombreUpdate' WHERE idSolicitud= 3
go
DELETE FROM Solicitud where idSolicitud = 6
--sin el where borra todo
go
INSERT INTO Solicitud(nombre, trofeos) values ('nombre11','6532194' )
go
SELECT *FROM Solicitud

--Puesto
INSERT INTO Puesto(nombre, sueldo) values ('nombre1','5646' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre2','435' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre3','865' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre4','94521' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre5','46767' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre6','12309043' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre7','12343' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre8','123434356' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre9','1233443' )
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre10','132343' )
go
SELECT *FROM Puesto
UPDATE Puesto set nombre = 'nombreUpdate' WHERE idPuesto= 3
go
DELETE FROM Puesto where idPuesto = 6
--sin el where borra todo
go
INSERT INTO Puesto(nombre, sueldo) values ('nombre11','1323439292' )
go
SELECT *FROM Puesto


--CreadorContenido
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre1','8756464','Codigo1' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre2','5646894','Codigo2' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre3','564964','Codigo3' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre4','567464','Codigo4' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre5','5649864','Codigo5' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre6','56464534','Codigo6' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre7','564564','Codigo7' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre8','564464','Codigo8' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre9','536464','Codigo9' )
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre10','1256464','Codigo10' )
go
SELECT *FROM CreadorContenido
UPDATE CreadorContenido set nombre = 'nombreUpdate' WHERE idCreadorContenido= 3
go
DELETE FROM CreadorContenido where idCreadorContenido = 6
--sin el where borra todo
go
INSERT INTO CreadorContenido(nombre, suscriptores, codigo) values ('nombre10','1256464','Codigo11' )
go
SELECT *FROM Liga

--Mercader
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha1','opcion1','tipo1' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha2','opcion2','tipo2' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha3','opcion3','tipo3' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha4','opcion4','tipo4' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha5','opcion5','tipo5' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha6','opcion6','tipo6' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha7','opcion7','tipo7' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha8','opcion8','tipo8' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha9','opcion9','tipo9' )
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha10','opcion10','tipo10' )
go
SELECT *FROM Mercader
UPDATE Mercader set tipo = 'tipoUpdtae' WHERE idMercader= 3
go
DELETE FROM Mercader where idMercader = 6
--sin el where borra todo
go
INSERT INTO Mercader(ficha, opcion, tipo) values ('ficha11','opcion11','tipo11' )
go
SELECT *FROM Liga

--CaminoTrofe
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre1','recompensa1', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre2','recompensa1', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre3','recompensa1', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre4','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre5','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre6','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre7','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre8','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre9','recompensa10', '10', '11' )
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre10','recompensa10', '10', '11' )
go
SELECT *FROM CaminoTrofeo
UPDATE CaminoTrofeo set nombre = 'nombreUpdate' WHERE idCaminoTrofeo= 3
go
DELETE FROM CaminoTrofeo where idCaminoTrofeo = 6
--sin el where borra todo
go
INSERT INTO CaminoTrofeo(trofeos, nombre, recompensa, idArena, idLiga) values ('123','nombre1234','recompensa10', '10', '11' )
go
SELECT *FROM CaminoTrofeo


--CaminoLeyenda
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre1','recompensa1', '3' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre2','recompensa2', '4' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre3','recompensa3', '6' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre4','recompensa4', '3' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre5','recompensa5', '8' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre6','recompensa6', '7' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre7','recompensa7', '3' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre8','recompensa8', '3' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre9','recompensa9', '3' )
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre10','recompensa10', '3' )
go
SELECT *FROM CaminoLeyenda
UPDATE CaminoLeyenda set nombre = 'nombreUpdate' WHERE idCaminoLeyenda= 3
go
DELETE FROM CaminoLeyenda where idCaminoLeyenda = 6
--sin el where borra todo
go
INSERT INTO CaminoLeyenda(trofeos, nombre, recompensa, idArena) values ('1233','nombre11','recompensa11', '3' )
go
SELECT *FROM CaminoLeyenda


--Paswe
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre1','1','tematica1', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre2','2','tematica2', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre3','3','tematica3', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre4','4','tematica4', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre5','5','tematica5', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre6','6','tematica6', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre7','7','tematica7', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre8','8','tematica8', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre9','9','tematica9', '1','1','1' )
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre10','10','tematica10', '1','1','1' )
go
SELECT *FROM Pase
UPDATE Pase set nombre = 'nombreUpdate' WHERE idPase= 3
go
DELETE FROM Pase where idPase = 6
--sin el where borra todo
go
INSERT INTO Pase(nombre, temporada, tematica, idAspecto,idReaccion, idNivel) values ('nombre11','11','tematica11', '1','1','1' )
go
SELECT *FROM Pase

--Tienad
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro1','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro2','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro3','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro4','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro5','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro6','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro7','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro8','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro9','1','gemas1', '4','6','7','10' )
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro10','1','gemas1', '4','6','7','10' )
go
SELECT *FROM Tienda
UPDATE Tienda set oro = 'oroUpdate' WHERE idTienda= 3
go
DELETE FROM Tienda where idTienda = 6
--sin el where borra todo
go
INSERT INTO Tienda(oro, gemas, cantidad, idCofre, idReaccion, idOferta, idCodigoRegalo) 
values ('oro11','1','gemas1', '4','6','7','10' )
go
SELECT *FROM Tienda

--Campeon
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre1','123','velocidad2','alcance1', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre2','123','velocidad2','alcance2', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre3','123','velocidad3','alcance3', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre4','123','velocidad4','alcance4', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre5','123','velocidad5','alcance5', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre6','123','velocidad6','alcance6', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre7','123','velocidad7','alcance7', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre8','123','velocidad8','alcance8', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre9','123','velocidad9','alcance9', '324','4','3','5' )
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre10','123','velocidad10','alcance10', '324','4','3','5' )
go
SELECT *FROM Campeon
UPDATE Campeon set nombre = 'oroUpdate' WHERE idCampeon= 3
go
DELETE FROM Campeon where idCampeon = 6
--sin el where borra todo
go
INSERT INTO Campeon(nombre, vida, velocidad, alcance,daño, coste, idCarta, idHabilidad) 
values ('nombre11','123','velocidad11','alcance11', '324','4','3','5' )
go
SELECT *FROM Campeon

--Estructura
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre2','123','velocidad2','alcance2', 'objetivo2','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre3','123','velocidad3','alcance3', 'objetivo3','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre4','123','velocidad4','alcance4', 'objetivo4','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre5','123','velocidad5','alcance5', 'objetivo5','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre6','123','velocidad6','alcance6', 'objetivo6','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre7','123','velocidad7','alcance7', 'objetivo7','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre8','123','velocidad8','alcance8', 'objetivo8','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre9','123','velocidad9','alcance9', 'objetivo9','4','3')
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre10','123','velocidad10','alcance10', 'objetivo10','4','3')
go
SELECT *FROM Estructura
UPDATE Estructura set nombre = 'nombreUpdate' WHERE idEstructura= 3
go
DELETE FROM Estructura where idEstructura = 6
--sin el where borra todo
go
INSERT INTO Estructura(nombre, vida, velocidad, alcance,objetivo, coste, idCarta) 
values ('nombre10','123','velocidad10','alcance10', 'objetivo10','4','3')
go
SELECT *FROM Estructura

--Tropa
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','1323','velocidad1','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad2','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad3','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad4','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad5','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad6','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre1','123','velocidad7','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre8','123','velocidad8','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre9','123','velocidad9','daño1','alcance1', 'objetivo1','4','3')
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre10','123','velocidad10','daño1','alcance1', 'objetivo1','4','3')
go
SELECT *FROM Tropa
UPDATE Tropa set nombre = 'nombreUpdate' WHERE idTropa= 3
go
DELETE FROM Tropa where idTropa = 6
--sin el where borra todo
go
INSERT INTO Tropa(nombre, vida, velocidad, daño, alcance,objetivo, coste, idCarta) 
values ('nombre12','123','velocidad12','daño1','alcance12', 'objetivo12','4','3')
go
SELECT *FROM Tropa


--Echizo
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre1','1323','dañoTorres1','alcance1', 'coste1','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre2','1323','dañoTorres2','alcance2', 'coste2','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre3','1323','dañoTorres3','alcance3', 'coste3','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre4','1323','dañoTorres4','alcance4', 'coste4','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre5','1323','dañoTorres5','alcance5', 'coste5','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre6','1323','dañoTorres6','alcance6', 'coste6','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre7','1323','dañoTorres7','alcance7', 'coste7','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre8','1323','dañoTorres8','alcance8', 'coste8','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre9','1323','dañoTorres9','alcance9', 'coste9','3')
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre10','1323','dañoTorres10','alcance10', 'coste10','3')
go
SELECT *FROM Echizo
UPDATE Echizo set nombre = 'nombreUpdate' WHERE idEchizo= 3
go
DELETE FROM Echizo where idEchizo = 6
--sin el where borra todo
go
INSERT INTO Echizo(nombre, dañoTorres,ancho, alcance, coste, idCarta) 
values ('nombre11','1323','ancho11','alcance11', 'coste11','3')
go
SELECT *FROM Echizo

--Pedido
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo1','2022-8-12','cantidad1','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo2','2022-8-12','cantidad2','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo3','2022-8-12','cantidad3','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo4','2022-8-12','cantidad4','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo5','2022-8-12','cantidad5','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo6','2022-8-12','cantidad6','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo7','2022-8-12','cantidad7','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo8','2022-8-12','cantidad8','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo9','2022-8-12','cantidad9','1')
go
INSERT INTO Pedido(tiempo, calidad, cantidad,idDonacion) values ('tiempo10','2022-8-12','cantidad1','1')
go
SELECT *FROM Pedido
UPDATE Pedido set cantidad = 'cantidadUpdate' WHERE idPedido= 3
go
DELETE FROM Pedido where idPedido = 6
--sin el where borra todo
go
INSERT INTO Pedido(tiempo, calidad, cantidad) values ('tiempo11','2022-8-12','cantidad11','1')
go
SELECT *FROM Pedido


--Clan
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre1', 'tipo1', 'trofeo1', 'miembros1', 'codigo1','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre2', 'tipo2', 'trofeo2', 'miembros1', 'codigo1','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre3', 'tipo3', 'trofeo3', 'miembros2', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre4', 'tipo4', 'trofeo4', 'miembros4', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre5', 'tipo5', 'trofeo5', 'miembros5', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre6', 'tipo6', 'trofeo6', 'miembros6', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre7', 'tipo7', 'trofeo7', 'miembros7', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre8', 'tipo8', 'trofeo8', 'miembros8', 'codigo2','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre9', 'tipo9', 'trofeo9', 'miembros9', 'codigo9','1','1','1','4','10' )
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre10', 'tipo10', 'trofeo10', 'miembros10', 'codigo10','1','1','1','4','10' )
go
SELECT *FROM Clan
UPDATE Clan set nombre = 'nombreUpdate' WHERE idClan= 3
go
DELETE FROM Clan where idClan = 6
--sin el where borra todo
go
INSERT INTO Clan(nombre, tipo , trofeos, miembros, codigo, idModoJuego, idMercader, idLigClan, idPedido, idIntercambio) 
values ('nombre11', 'tipo11', 'trofeo11', 'miembros11', 'codigo11','1','1','1','4','10' )
go
SELECT *FROM Clan

--Mision
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre1', 'tarea1', '10' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre2', 'tarea2', '5' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre3', 'tarea3', '3' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre4', 'tarea4', '2' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre5', 'tarea5', '10' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre6', 'tarea6', '10' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre7', 'tarea7', '8' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre8', 'tarea8', '10' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre9', 'tarea9', '10' )
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre10', 'tarea10', '10' )
go
SELECT *FROM Mision
UPDATE Mision set nombre = 'nombreUpdate' WHERE idMision= 3
go
DELETE FROM Mision where idMision = 6
--sin el where borra todo
go
INSERT INTO Mision(nombre, tarea, idBonus)  values ('nombre11', 'tarea11', '10' )
go
SELECT *FROM Mision

--Jugador
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
SELECT *FROM Jugador
UPDATE Jugador set nombre = 'nombreUpdate' WHERE idJugador= 3
go
DELETE FROM Jugador where idJugador = 6
--sin el where borra todo
go
INSERT INTO Jugador(nombre, codigo, puntosEstelares,experiencia, idDesafio, idLibro,idClan, idTorneo, idPase, idCaminoTrofeo,idCaminoLeyenda,idEstadistica)
values ('nombre1','codigo1', '1244', '4324', '2', '1', '10', '1', '1','11', '3','3')
go
SELECT *FROM Jugador

--Clasificacion
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('345', '412', '10254', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('3453', '344', '4354535', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('453443', '131', '435454', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('4353453', '654', '45435', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('234543', '876', '334543', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('234', '234', '87857', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('45442', '432', '113124', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('345345', '463', '909767', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('345435', '865', '576547', '10')
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('5435', '422', '657567', '10')
go
SELECT *FROM Clasificacionn
UPDATE Clasificacionn set medallas = '12321' WHERE idJugador= 3
go
DELETE FROM Clasificacionn where idJugador = 6
--sin el where borra todo
go
INSERT INTO Clasificacionn(medallas, puesto, reproducciones, idJugador)  values ('312432', '131', '134234', '10')
go
SELECT *FROM Clasificacionn


--Supercell
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo1', 'codgio1', 'juego1','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo2', 'codgio2', 'juego2','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo3', 'codgio3', 'juego3','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo4', 'codgio4', 'juego4','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo5', 'codgio5', 'juego5','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo6', 'codgio6', 'juego6','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo7', 'codgio7', 'juego7','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo8', 'codgio8', 'juego8','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo9', 'codgio9', 'juego9','1')
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo10', 'codgio10', 'juego10','1')
go

SELECT *FROM Supercell
UPDATE Supercell set correo = 'correo11' WHERE idSupercell= 3
go
DELETE FROM Supercell where idSupercell = 6
--sin el where borra todo
go
INSERT INTO Supercell(correo, codigo, juegos,idJugador)  values ('correo10', 'codgio10', 'juego11','1')
go
SELECT *FROM Supercell

--Empleado  
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre1', 'apellidoPaterno1', 'apellidoMaterno1', 'pais1', 'calle1','colonia1','municipio1','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre2', 'apellidoPaterno2', 'apellidoMaterno2', 'pais2', 'calle2','colonia2','municipio2','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre3', 'apellidoPaterno3', 'apellidoMaterno3', 'pais3', 'calle3','colonia3','municipio3','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre4', 'apellidoPaterno4', 'apellidoMaterno4', 'pais4', 'calle4','colonia4','municipio4','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre5', 'apellidoPaterno5', 'apellidoMaterno5', 'pais5', 'calle5','colonia5','municipio5','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre6', 'apellidoPaterno6', 'apellidoMaterno6', 'pais6', 'calle6','colonia6','municipio6','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre7', 'apellidoPaterno7', 'apellidoMaterno7', 'pais7', 'calle7','colonia7','municipio7','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre8', 'apellidoPaterno8', 'apellidoMaterno8', 'pais8', 'calle8','colonia8','municipio8','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre9', 'apellidoPaterno9', 'apellidoMaterno9', 'pais9', 'calle9','colonia9','municipio9','1')
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre10', 'apellidoPaterno10', 'apellidoMaterno10', 'pais10', 'calle10','colonia10','municipio10','1')
go

SELECT *FROM Empleado
UPDATE Empleado set nombre = 'nombreUpdate' WHERE idEmpleado= 3
go
DELETE FROM Empleado where idEmpleado = 6
--sin el where borra todo
go
INSERT INTO Empleado(nombre, apellidoPaterno, apellidoMaterno, pais, calle, colonia, municipo, idPuesto) 
values ('nombre11', 'apellidoPaterno11', 'apellidoMaterno11', 'pais11', 'calle11','colonia11','municipio11','1')
go
SELECT *FROM Empleado

--Guerra
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto1', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin) values ('314', 'puesto2', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin) values ('314', 'puesto3', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto4', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto5', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto6', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto7', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto8', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto9', '1232','2')
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto10', '1232','2')
go
SELECT *FROM Guerra
UPDATE Guerra set puesto = 'puestoUpdate' WHERE idGuerra= 3
go
DELETE FROM Guerra where idGuerra = 6
--sin el where borra todo
go
INSERT INTO Guerra(trofeos, puesto, ataques,idBotin)  values ('314', 'puesto10', '1232','2')
go
SELECT *FROM Guerra

--RegistroJugadpr
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador1', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador2', '2022-8-12', '7','1')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador3', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador4', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador5', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador6', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador7', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador8', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador', '2022-8-12', '7','11')
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador10', '2022-8-12', '7','11')
go
SELECT *FROM RegistroJugador
UPDATE RegistroJugador set ganador = 'ganadorUpdate' WHERE idRegistroJugador= 3
go
DELETE FROM RegistroJugador where idRegistroJugador = 6
--sin el where borra todo
go
INSERT INTO RegistroJugador(ganador, fecha, idRegistro,idJugador)  values ('ganador11', '2022-8-12', '7','11')
go
SELECT *FROM RegistroJugador

--SupercellEmpleado
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('1', '1')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('2', '2')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('3', '3')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('4', '4')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('5', '5')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('5', '5')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('7', '7')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('8', '8')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('9', '9')
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('10', '10')
go
SELECT *FROM SupercellEmpleado
UPDATE SupercellEmpleado set idSupercell = '2' WHERE idSupercell= 3
go
DELETE FROM SupercellEmpleado where idSupercell = 6
--sin el where borra todo
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('3', '3')
go
SELECT *FROM SupercellEmpleado

--SupercellCreadoConrtenido
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('80', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('9', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
INSERT INTO SupercellCreadoConrtenido (idSupercell,idCreadorContenido)  values ('10', '10')
go
SELECT *FROM SupercellCreadoConrtenido
UPDATE SupercellEmpleado set idSupercell = '2' WHERE idSupercell= 3
go
DELETE FROM SupercellEmpleado where idSupercell = 6
--sin el where borra todo
go
INSERT INTO SupercellEmpleado (idSupercell,idEmpleado)  values ('3', '3')
go
SELECT *FROM SupercellCreadoConrtenido


--ClanSolicitud
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','5','1')  
go
SELECT *FROM ClanSolicitud
UPDATE ClanSolicitud set idClan = '2' WHERE idClanSolicitud= 3
go
DELETE FROM ClanSolicitud where idClanSolicitud = 6
--sin el where borra todo
go
INSERT INTO ClanSolicitud(fecha, idClan,idSolicitud) values ('2022-8-12','9','9')  
go
SELECT *FROM ClanSolicitud

--ClanGuerra
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','1','2022-8-12')
go

SELECT *FROM ClanGuerra
UPDATE ClanGuerra set idClan = '2' WHERE idClanGuerra= 3
go
DELETE FROM ClanGuerra where idClanGuerra = 6
--sin el where borra todo
go
INSERT INTO ClanGuerra(idClan,idGuerra,duracion) values ('10','7','2022-8-12')
go
SELECT *FROM ClanGuerra

--LibroJugador
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','10')
go
SELECT *FROM LibroJugador
UPDATE LibroJugador set idJugador = '2' WHERE idLibroJugador= 3
go
DELETE FROM LibroJugador where idLibroJugador = 6
--sin el where borra todo
go
INSERT INTO LibroJugador(idJugador,idLibro) values ('10','9')
go
SELECT *FROM LibroJugador

--LibroJugador
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go

SELECT *FROM Comodin
UPDATE JugadorComodin set idJugador = '11' WHERE idJugadorComodin= 3
go
DELETE FROM JugadorComodin where idJugadorComodin = 6
--sin el where borra todo
go
INSERT INTO JugadorComodin(idJugador,idComodin) values ('10','11')
go
SELECT *FROM JugadorComodin

--LibroJugador
INSERT INTO LogroJugador(idLogro,idJugador) values ('5','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('4','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('4','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('2','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('3','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('9','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('5','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('5','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('9','10')
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('5','10')
go
SELECT *FROM LogroJugador
UPDATE LogroJugador set idJugador = '9' WHERE idLogroJugador= 1
go
DELETE FROM LogroJugador where idLogroJugador = 6
--sin el where borra todo
go
INSERT INTO LogroJugador(idLogro,idJugador) values ('5','9')
go
SELECT *FROM LogroJugador


--MaestroJugador
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','7')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('3','7')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('7','7')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('8','4')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('9','4')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('9','5')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','9')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','8')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','7')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','7')
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','7')
go
SELECT *FROM MaestroJugador
UPDATE MaestroJugador set idJugador = '8' WHERE idMaestroJugador= 1
go
DELETE FROM MaestroJugador where idMaestroJugador = 6
--sin el where borra todo
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','7')
go
SELECT *FROM MaestroJugador

--JugasdorMazo
INSERT INTO JugadorMazo(idMazo,idJugador) values ('5','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('4','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('7','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('8','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('9','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('10','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('11','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('5','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('5','7')
go
INSERT INTO JugadorMazo(idMazo,idJugador) values ('5','7')
go
SELECT *FROM JugadorMazo
UPDATE JugadorMazo set idJugador = '11' WHERE idJugadorMazo= 1
go
DELETE FROM JugadorMazo where idJugadorMazo = 6
--sin el where borra todo
go
INSERT INTO MaestroJugador(idMaestro,idJugador) values ('5','4')
go
SELECT *FROM Tienda

--PasoTienda
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
INSERT INTO PaseTienda(idPase,idTienda) values ('5','11')
go
SELECT *FROM PaseTienda
UPDATE PaseTienda set idPase = '11' WHERE idPaseTienda= 1
go
DELETE FROM PaseTienda where idPaseTienda = 6
--sin el where borra todo
go
INSERT INTO PaseTienda(idPase,idTienda) values ('7','11')
go
SELECT *FROM Jugador

--JugadorCofre
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go
INSERT INTO JugadorCofre(idJugador, idCofre) values ('11','7')
go

SELECT *FROM JugadorCofre
UPDATE JugadorCofre set idJugador = '11' WHERE idJugadorCofre= 1
go
DELETE FROM JugadorCofre where idJugadorCofre = 6
--sin el where borra todo
go
INSERT INTO JugadorCofre(idJugador, idCofre) values('11','7')
go
SELECT *FROM JugadorCofre


---TiendaPago
INSERT INTO TiendaPago(idTienda, idPago) values ('5','1')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','2')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','3')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','3')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','5')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','6')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','7')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','8')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','9')
go
INSERT INTO TiendaPago(idTienda, idPago) values ('5','10')
go
SELECT *FROM TiendaPago
UPDATE TiendaPago set idTienda = '11' WHERE idTiendaPago= 1
go
DELETE FROM TiendaPago where idTiendaPago = 6
--sin el where borra todo
go
INSERT INTO TiendaPago(idTienda, idPago) values ('7','10')
go
SELECT *FROM TiendaPago

--JugadorTvroyale
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('7','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('9','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('5','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('7','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('8','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('9','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('2','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('3','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('4','10')
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('1','10')
go
SELECT *FROM JugadorTvroyale
UPDATE JugadorTvroyale set idJugador = '11' WHERE idJugadorTvroyale= 1
go
DELETE FROM JugadorTvroyale where idJugadorTvroyale = 6
--sin el where borra todo
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('2','10')
go
SELECT *FROM JugadorTvroyale

--JugadorAdorno
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('7','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('5','8')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('3','2')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('2','5')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('8','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('9','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('2','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('4','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('5','11')
go
INSERT INTO JugadorAdorno(idJugador, idAdorno) values ('8','11')
go
SELECT *FROM JugadorAdorno
UPDATE JugadorAdorno set idJugador = '11' WHERE idJugadorAdorno= 1
go
DELETE FROM JugadorAdorno where idJugadorAdorno = 6
--sin el where borra todo
go
INSERT INTO JugadorTvroyale(idJugador, idTvroyale) values ('2','10')
go
SELECT *FROM JugadorTvroyale

--MazoCarta
INSERT INTO MazoCarta(idMazo, idCarta) values ('3','3')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('4','4')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('5','5')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('9','9')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('7','7')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('8','8')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('9','9')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('10','10')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('3','3')
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('4','4')
go
SELECT *FROM MazoCarta
UPDATE MazoCarta set idMazo = '11' WHERE idMazoCarta= 1
go
DELETE FROM MazoCarta where idMazoCarta = 6
--sin el where borra todo
go
INSERT INTO MazoCarta(idMazo, idCarta) values ('4','4')
go
SELECT *FROM MazoCarta