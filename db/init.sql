-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: civigest
-- ------------------------------------------------------
-- Server version	8.0.42

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
INSERT INTO `userrole` VALUES (1,'Admin'),(2,'Gestor'),(3,'Cliente');
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Surname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BirthdayDate` datetime(6) NOT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RegistrationDate` datetime(6) NOT NULL,
  `UserRoleId` int NOT NULL,
  `Status` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  UNIQUE KEY `IX_User_DNI` (`DNI`),
  UNIQUE KEY `IX_User_Email` (`Email`),
  KEY `UserRoleId_idx` (`UserRoleId`),
  CONSTRAINT `userRoleID` FOREIGN KEY (`UserRoleId`) REFERENCES `userrole` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'John','admin@email.com','$2a$11$nAYl3lKmHl6NY34sPblVJ.fLO.PQlV4qYAsPD2NbyIw7hgeneetpC','Doe','12345678A','600123456','1980-01-15','Calle Admin 1, Ceuta','2025-06-15',1,'Activo'),(2,'Patricia','gestor@email.com','$2a$11$nAYl3lKmHl6NY34sPblVJ.fLO.PQlV4qYAsPD2NbyIw7hgeneetpC','Aranda','87654321B','611234567','1990-05-20','Avenida Gestor 2, Ceuta','2025-06-15',2,'Activo'),(3,'Carmen','user@email.com','$2a$11$nAYl3lKmHl6NY34sPblVJ.fLO.PQlV4qYAsPD2NbyIw7hgeneetpC','Dominguez','23456789C','622345678','2000-11-10','Plaza Usuario 3, Ceuta','2025-06-15',3,'Activo');
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NameSurname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
INSERT INTO `author` VALUES (1,'Gabriel García Márquez'),(2,'Julio Cortázar'),(3,'Jorge Luis Borges'),(4,'Isabel Allende'),(5,'Mario Vargas Llosa'),(6,'Miguel de Cervantes'),(7,'Federico García Lorca'),(8,'Pablo Neruda'),(9,'Octavio Paz'),(10,'Carlos Fuentes'),(11,'Juan Rulfo'),(12,'Laura Esquivel'),(13,'Clarice Lispector'),(14,'Jorge Amado'),(15,'Machado de Assis'),(16,'José Saramago'),(17,'Alejo Carpentier'),(18,'Juan Ramón Jiménez'),(19,'Antonio Machado'),(20,'Miguel Delibes'),(21,'Camilo José Cela'),(22,'Ana María Matute'),(23,'Elena Poniatowska'),(24,'Adolfo Bioy Casares'),(25,'Ernesto Sábato'),(26,'Ricardo Piglia'),(27,'Roberto Bolaño'),(28,'Gioconda Belli'),(29,'Eduardo Galeano'),(30,'Mario Benedetti');
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Author` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PagNum` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PublicationDate` date NOT NULL,
  `Photo` longblob NOT NULL,
  `PhotoMimeType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserCreatedId` int NOT NULL,
  `Publisher` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Book_ISBN` (`ISBN`),
  KEY `IX_Book_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_Book_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
INSERT INTO `book` VALUES (1,'978-0307476465','Cien años de soledad','La saga de la familia Buendía a lo largo de varias generaciones en el pueblo de Macondo.','Gabriel García Márquez',496,'1967-05-30','photo1.jpg','image/jpeg',1,'Editorial Sudamericana'),(2,'978-8437604940','Rayuela','Novela experimental que puede leerse en diferentes órdenes,explorando la relación entre dos amantes.','Julio Cortázar',656,'1963-06-28','photo2.jpg','image/jpeg',1,'Editorial Sudamericana'),(3,'978-8420633118','Ficciones','Colección de cuentos cortos que exploran temas como la metafísica,los laberintos y las bibliotecas infinitas.','Jorge Luis Borges',208,'1944-01-01','photo3.jpg','image/jpeg',1,'Emecé Editores'),(4,'978-0060919937','La casa de los espíritus','Una saga familiar que abarca varias generaciones,mezclando lo real y lo mágico en un país latinoamericano anónimo.','Isabel Allende',448,'1982-01-01','photo4.jpg','image/jpeg',1,'Plaza & Janés'),(5,'978-0374154612','La ciudad y los perros','Novela que retrata la vida en un colegio militar de Lima,explorando la corrupción y la violencia.','Mario Vargas Llosa',432,'1962-01-01','photo5.jpg','image/jpeg',1,'Seix Barral'),(6,'978-8420412140','Don Quijote de la Mancha','Un hidalgo enloquecido por la lectura de libros de caballerías decide convertirse en caballero andante.','Miguel de Cervantes',1056,'1605-01-16','photo6.jpg','image/jpeg',1,'Francisco de Robles'),(7,'978-8437605701','Romancero gitano','Colección de poemas que exploran la cultura gitana,el amor,la muerte y la Andalucía profunda.','Federico García Lorca',192,'1928-01-01','photo7.jpg','image/jpeg',1,'Revista de Occidente'),(8,'978-0679724412','Veinte poemas de amor y una canción desesperada','Colección de poemas líricos que abordan el amor,el desamor y la naturaleza.','Pablo Neruda',112,'1924-01-01','photo8.jpg','image/jpeg',1,'Editorial Nascimento'),(9,'978-9681603038','El laberinto de la soledad','Ensayo que explora la identidad mexicana a través de su historia,cultura y psicología.','Octavio Paz',256,'1950-01-01','photo9.jpg','image/jpeg',1,'Fondo de Cultura Económica'),(10,'978-9681606824','La muerte de Artemio Cruz','Novela que narra la vida de un magnate mexicano en su lecho de muerte,a través de flashbacks y monólogos interiores.','Carlos Fuentes',320,'1962-01-01','photo10.jpg','image/jpeg',1,'Fondo de Cultura Económica'),(11,'978-9681607562','Pedro Páramo','Una novela corta que combina el realismo mágico con la historia de un hombre que busca a su padre en un pueblo fantasma.','Juan Rulfo',160,'1955-01-01','photo11.jpg','image/jpeg',1,'Fondo de Cultura Económica'),(12,'978-0385721213','Como agua para chocolate','Novela que mezcla el realismo mágico y la receta de cocina para narrar una historia de amor y tradición familiar.','Laura Esquivel',256,'1989-01-01','photo12.jpg','image/jpeg',1,'Planeta'),(13,'978-0811210457','La hora de la estrella','Una novela corta que explora la vida de una joven nordestina inmigrante en Río de Janeiro.','Clarice Lispector',96,'1977-01-01','photo13.jpg','image/jpeg',1,'Rocco'),(14,'978-0394747717','Gabriela,clavo y canela','Novela que narra la historia de amor entre una joven mulata y un dueño de plantación de cacao en Brasil.','Jorge Amado',448,'1958-01-01','photo14.jpg','image/jpeg',1,'Martins Fontes'),(15,'978-8571641369','Don Casmurro','Novela que explora la relación de un hombre con su esposa y la posibilidad de su infidelidad.','Machado de Assis',304,'1899-01-01','photo15.jpg','image/jpeg',1,'Livraria Garnier'),(16,'978-0156002741','Ensayo sobre la ceguera','Una epidemia de ceguera blanca se propaga rápidamente,revelando lo peor de la naturaleza humana.','José Saramago',352,'1995-01-01','photo16.jpg','image/jpeg',1,'Editorial Caminho'),(17,'978-9681606138','El reino de este mundo','Novela histórica que explora el realismo mágico en el contexto de la Revolución Haitiana.','Alejo Carpentier',224,'1949-01-01','photo17.jpg','image/jpeg',1,'Arcoiris'),(18,'978-8437604612','Platero y yo','Una obra poética que narra la vida en un pueblo andaluz a través de los ojos de un burro.','Juan Ramón Jiménez',192,'1914-01-01','photo18.jpg','image/jpeg',1,'La Lectura'),(19,'978-8437604629','Campos de Castilla','Colección de poemas que describen el paisaje castellano y reflexionan sobre la existencia.','Antonio Machado',224,'1912-01-01','photo19.jpg','image/jpeg',1,'Renacimiento'),(20,'978-8423307527','La sombra del ciprés es alargada','Una novela de formación que aborda la muerte y la vida rural en Castilla.','Miguel Delibes',288,'1947-01-01','photo20.jpg','image/jpeg',1,'Destino'),(21,'978-8423308906','La familia de Pascual Duarte','Novela que narra la vida violenta y trágica de un campesino extremeño.','Camilo José Cela',192,'1942-01-01','photo21.jpg','image/jpeg',1,'Ediciones Destino'),(22,'978-8423337920','Olvidado Rey Gudú','Una novela épica que narra la historia de un rey imaginario y su reino.','Ana María Matute',720,'1996-01-01','photo22.jpg','image/jpeg',1,'Plaza & Janés'),(23,'978-9684110378','Hasta no verte Jesús mío','Una novela biográfica que narra la vida de una mujer pobre en el México del siglo XX.','Elena Poniatowska',384,'1969-01-01','photo23.jpg','image/jpeg',1,'Editorial Era'),(24,'978-9500705423','La invención de Morel','Una novela corta de ciencia ficción que explora la naturaleza de la realidad y la inmortalidad.','Adolfo Bioy Casares',128,'1940-01-01','photo24.jpg','image/jpeg',1,'Losada'),(25,'978-9504900742','El túnel','Una novela existencialista que narra la obsesión de un pintor por una mujer,llevándolo a un trágico final.','Ernesto Sábato',160,'1948-01-01','photo25.jpg','image/jpeg',1,'Editorial Losada'),(26,'978-9870404098','Respiración artificial','Una novela experimental que mezcla la ficción con la reflexión sobre la historia argentina.','Ricardo Piglia',288,'1980-01-01','photo26.jpg','image/jpeg',1,'Sudamericana'),(27,'978-8432213768','Los detectives salvajes','Dos poetas buscan a una escritora desaparecida,a través de un viaje que abarca décadas y continentes.','Roberto Bolaño',608,'1998-01-01','photo27.jpg','image/jpeg',1,'Anagrama'),(28,'978-8408083818','El país bajo mi piel','Memorias de la autora que exploran su vida,su activismo político y su poesía.','Gioconda Belli',400,'2001-01-01','photo28.jpg','image/jpeg',1,'Seix Barral'),(29,'978-8432313622','Las venas abiertas de América Latina','Ensayo que analiza la historia de explotación de América Latina desde la conquista.','Eduardo Galeano',384,'1971-01-01','photo29.jpg','image/jpeg',1,'Siglo XXI Editores'),(30,'978-8423309996','La tregua','Un diario íntimo de un hombre que,al borde de la jubilación,encuentra un breve respiro en el amor.','Mario Benedetti',192,'1960-01-01','photo30.jpg','image/jpeg',1,'Alfaqueque');
UNLOCK TABLES;

--
-- Table structure for table `authorbook`
--

DROP TABLE IF EXISTS `authorbook`;
CREATE TABLE `authorbook` (
  `AuthorId` int NOT NULL,
  `BookId` int NOT NULL,
  PRIMARY KEY (`BookId`,`AuthorId`),
  KEY `IX_AuthorBook_AuthorId` (`AuthorId`),
  CONSTRAINT `FK_AuthorBook_Author_AuthorId` FOREIGN KEY (`AuthorId`) REFERENCES `author` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AuthorBook_Book_BookId` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authorbook`
--

LOCK TABLES `authorbook` WRITE;
INSERT INTO `authorbook` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Issuer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Audience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserServiceURL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
INSERT INTO `configuration` VALUES (1,'un texto muy largo y bonito, que sirve de algo','AuthService','[\"UserService\",\"AuthService\",\"ProviderService\",\"LibraryService\",\"BookService\",\"SeatService\"]','http://civigest-basicgest:8080/api/Users/');
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
CREATE TABLE `library` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CIF` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Photo` longblob NOT NULL,
  `UserCreatedId` int NOT NULL DEFAULT '0',
  `PhotoMimeType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FloorNumbers` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Library_CIF` (`CIF`),
  UNIQUE KEY `IX_Library_Email` (`Email`),
  KEY `IX_Library_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_Library_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
INSERT INTO `library` (
    id, Name, Email, CIF, PhoneNumber, Address, Description,
    Photo, UserCreatedId, PhotoMimeType, FloorNumbers
) VALUES (1,'Biblioteca Pública Adolfo Suaréz','adolfosuarez@bibceuta.es','45985672H','956500534','C. Manuel Olivencia Amor','Biblioteca Pública Adolfo Suárez: centro de cultura, ocio e información en Ceuta. Promueve el acceso al saber y conserva el patrimonio cultural desde la Consejería de Educación.','',1,'',5),
(2,'Biblioteca Pública El Morro','elmorro@bibceuta.es','45985674T','123456789','Avda. de África','Biblioteca Pública El Morro: espacio cultural en Ceuta para el ocio, la formación y la lectura. Promueve el acceso a la cultura y preserva el patrimonio desde la Consejería local.','',1,'',3),
(3,'Biblioteca Pública Estación del ferrocarril','45985874V','123456783','ferrocarril@bibceuta.es','Avda. de Madrid','Biblioteca Pública El Ferrocarril: espacio de cultura y ocio en Ceuta. Facilita el acceso al saber y protege el patrimonio local desde la Consejería de Educación y Cultura.','',1,'',2);
UNLOCK TABLES;

--
-- Table structure for table `copybook`
--

DROP TABLE IF EXISTS `copybook`;
CREATE TABLE `copybook` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ubication` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EditionNum` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PurchaseDate` date NOT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserCreatedId` int NOT NULL,
  `BookId` int NOT NULL,
  `LibraryId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_CopyBook_BookId` (`BookId`),
  KEY `IX_CopyBook_LibraryId` (`LibraryId`),
  KEY `IX_CopyBook_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_CopyBook_Book_BookId` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_CopyBook_Library_LibraryId` FOREIGN KEY (`LibraryId`) REFERENCES `library` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_CopyBook_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `copybook`
--

LOCK TABLES `copybook` WRITE;
INSERT INTO `copybook` VALUES (1,'Disponible','Sección A1 estante 1','1º Edición','2023-01-15','',1,1,1),(2,'Disponible','Sección A2 estante 2','1º Edición','2023-01-15','',1,2,1),(3,'Disponible','Sección A3 estante 2','1º Edición','2023-01-15','',1,3,1),(4,'Disponible','Sección A4 estante 3','1º Edición','2023-01-15','',1,4,1),(5,'Disponible','Sección A5 estante 4','1º Edición','2023-01-15','',1,5,1),(6,'Disponible','Sección A6 estante 4','1º Edición','2023-01-15','',1,6,1),(7,'Disponible','Sección A7 estante 2','1º Edición','2023-01-15','',1,7,1),(8,'Disponible','Sección A8 estante 1','1º Edición','2023-01-15','',1,8,1),(9,'Disponible','Sección A9 estante 1','1º Edición','2023-01-15','',1,9,1),(10,'Disponible','Sección A10 estante 1','1º Edición','2023-01-15','',1,10,1),(11,'Disponible','Sección B1 estante 2','1º Edición','2023-01-15','',1,11,1),(12,'Disponible','Sección B2 estante 2','1º Edición','2023-01-15','',1,12,1),(13,'Disponible','Sección B3 estante 3','1º Edición','2023-01-15','',1,13,1),(14,'Disponible','Sección B4 estante 3','1º Edición','2023-01-15','',1,14,1),(15,'Disponible','Sección B5 estante 3','1º Edición','2023-01-15','',1,15,1),(16,'Disponible','Sección B6 estante 4','1º Edición','2023-01-15','',1,16,1),(17,'Disponible','Sección B7 estante 5','1º Edición','2023-01-15','',1,17,1),(18,'Disponible','Sección B8 estante 6','1º Edición','2023-01-15','',1,18,1),(19,'Disponible','Sección B9 estante 5','1º Edición','2023-01-15','',1,19,1),(20,'Disponible','Sección B10 estante 2','1º Edición','2023-01-15','',1,20,1),(21,'Disponible','Sección C1 estante 3','1º Edición','2023-01-15','',1,21,1),(22,'Disponible','Sección C2 estante 3','1º Edición','2023-01-15','',1,22,1),(23,'Disponible','Sección C3 estante 1','1º Edición','2023-01-15','',1,23,1),(24,'Disponible','Sección C4 estante 1','1º Edición','2023-01-15','',1,24,1),(25,'Disponible','Sección C5 estante 1','1º Edición','2023-01-15','',1,25,1),(26,'Disponible','Sección C6 estante 2','1º Edición','2023-01-15','',1,26,1),(27,'Disponible','Sección C7 estante 2','1º Edición','2023-01-15','',1,27,1),(28,'Disponible','Sección C8 estante 4','1º Edición','2023-01-15','',1,28,1),(29,'Disponible','Sección C9 estante 4','1º Edición','2023-01-15','',1,29,1),(30,'Disponible','Sección C10 estante 4','1º Edición','2023-01-15','',1,30,1),(31,'Disponible','Sección A17 estante 4','1º Edición','2023-01-15','',1,27,2),(32,'Disponible','Sección A2 estante 2','1º Edición','2023-01-15','',1,28,2),(33,'Disponible','Sección A4 estante 3','1º Edición','2023-01-15','',1,29,2),(34,'Disponible','Sección A3 estante 2','1º Edición','2023-01-15','',1,30,2);
UNLOCK TABLES;


--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ContactPersonName` varchar(45) NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DNI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserCreatedId` int NOT NULL DEFAULT '0',
  `PhoneNumber` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  UNIQUE KEY `IX_Provider_DNI` (`DNI`),
  UNIQUE KEY `IX_Provider_Email` (`Email`),
  KEY `IX_Provider_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_Provider_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
INSERT INTO `provider` VALUES (1,'Ana García','ana.garcia@librosceuta.es','12345678A',1,'600111222','Calle Real 10,Ceuta','Libros Ceuta SL'),(2,'Pedro Martínez','pedro.martinez@distribucionesfaro.com','87654321B',1,'611222333','Avenida de África 25,Ceuta','Distribuciones Faro'),(3,'Sofía López','sofia.lopez@editorialmediterraneo.es','23456789C',1,'622333444','Paseo de las Palmeras 5,Ceuta','Editorial Mediterráneo'),(4,'Javier Ruiz','javier.ruiz@papeleraexpress.net','98765432D',1,'633444555','Polígono Industrial Erta,Nave 7,Ceuta','Papelera Express'),(5,'Laura Fernández','laura.fernandez@encuadernacionesrapidas.com','34567890E',1,'644555666','Calle Isabel La Católica 1,Ceuta','Encuadernaciones Rápidas');
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SeatNum` int NOT NULL,
  `FloorNum` int NOT NULL,
  `RoomNum` int NOT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `HasWindow` tinyint(1) NOT NULL,
  `HasSocket` tinyint(1) NOT NULL,
  `IsWCNear` tinyint(1) NOT NULL,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserCreatedId` int NOT NULL,
  `LibraryId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Seat_Library_LibraryId` (`LibraryId`),
  KEY `FK_Seat_User_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_Seat_Library_LibraryId` FOREIGN KEY (`LibraryId`) REFERENCES `library` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Seat_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
INSERT INTO `seat` VALUES (1,'01',1,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(2,'02',1,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(3,'03',1,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(4,'04',1,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(5,'05',1,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(6,'06',1,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(7,'07',1,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(8,'08',1,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(9,'09',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(10,'10',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(11,'11',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(12,'12',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(13,'13',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(14,'14',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(15,'15',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(16,'16',1,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(17,'17',1,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(18,'18',1,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(21,'01',1,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(22,'02',1,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(23,'03',1,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(24,'04',1,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(25,'05',1,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(26,'06',1,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(27,'07',1,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(28,'08',1,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(29,'09',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(30,'10',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(31,'11',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(32,'12',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(33,'13',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(34,'14',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(35,'15',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(36,'16',1,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(37,'17',1,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(38,'18',1,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(41,'01',1,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(42,'02',1,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(43,'03',1,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(44,'04',1,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(45,'05',1,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(46,'06',1,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(47,'07',1,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(48,'08',1,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(49,'09',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(50,'10',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(51,'11',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(52,'12',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(53,'13',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(54,'14',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(55,'15',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(56,'16',1,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(57,'17',1,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(58,'18',1,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(61,'01',1,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(62,'02',1,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(63,'03',1,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(64,'04',1,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(65,'05',1,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(66,'06',1,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(67,'07',1,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(68,'08',1,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(69,'09',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(70,'10',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(71,'11',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(72,'12',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(73,'13',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(74,'14',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(75,'15',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(76,'16',1,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(77,'17',1,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(78,'18',1,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(81,'01',2,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(82,'02',2,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(83,'03',2,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(84,'04',2,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(85,'05',2,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(86,'06',2,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(87,'07',2,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(88,'08',2,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(89,'09',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(90,'10',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(91,'11',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(92,'12',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(93,'13',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(94,'14',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(95,'15',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(96,'16',2,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(97,'17',2,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(98,'18',2,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(101,'01',2,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(102,'02',2,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(103,'03',2,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(104,'04',2,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(105,'05',2,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(106,'06',2,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(107,'07',2,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(108,'08',2,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(109,'09',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(110,'10',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(111,'11',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(112,'12',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(113,'13',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(114,'14',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(115,'15',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(116,'16',2,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(117,'17',2,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(118,'18',2,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(121,'01',2,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(122,'02',2,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(123,'03',2,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(124,'04',2,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(125,'05',2,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(126,'06',2,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(127,'07',2,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(128,'08',2,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(129,'09',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(130,'10',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(131,'11',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(132,'12',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(133,'13',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(134,'14',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(135,'15',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(136,'16',2,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(137,'17',2,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(138,'18',2,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(141,'01',2,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(142,'02',2,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(143,'03',2,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(144,'04',2,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(145,'05',2,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(146,'06',2,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(147,'07',2,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(148,'08',2,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(149,'09',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(150,'10',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(151,'11',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(152,'12',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(153,'13',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(154,'14',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(155,'15',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(156,'16',2,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(157,'17',2,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(158,'18',2,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(161,'01',3,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(162,'02',3,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(163,'03',3,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(164,'04',3,'1','Vista al jardín',TRUE,FALSE,FALSE,'Disponible',1,1),(165,'05',3,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(166,'06',3,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(167,'07',3,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(168,'08',3,'1','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(169,'09',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(170,'10',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(171,'11',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(172,'12',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(173,'13',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(174,'14',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(175,'15',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(176,'16',3,'1','',FALSE,FALSE,FALSE,'Disponible',1,1),(177,'17',3,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(178,'18',3,'1','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(181,'01',3,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(182,'02',3,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(183,'03',3,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(184,'04',3,'2','Vista a la calle',TRUE,FALSE,FALSE,'Disponible',1,1),(185,'05',3,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(186,'06',3,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(187,'07',3,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(188,'08',3,'2','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(189,'09',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(190,'10',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(191,'11',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(192,'12',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(193,'13',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(194,'14',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(195,'15',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(196,'16',3,'2','',FALSE,FALSE,FALSE,'Disponible',1,1),(197,'17',3,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(198,'18',3,'2','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(201,'01',3,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(202,'02',3,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(203,'03',3,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(204,'04',3,'3','Vista a la plaza',TRUE,FALSE,FALSE,'Disponible',1,1),(205,'05',3,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(206,'06',3,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(207,'07',3,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(208,'08',3,'3','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(209,'09',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(210,'10',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(211,'11',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(212,'12',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(213,'13',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(214,'14',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(215,'15',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(216,'16',3,'3','',FALSE,FALSE,FALSE,'Disponible',1,1),(217,'17',3,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(218,'18',3,'3','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(221,'01',3,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(222,'02',3,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(223,'03',3,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(224,'04',3,'4','Vista interior',TRUE,FALSE,FALSE,'Disponible',1,1),(225,'05',3,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(226,'06',3,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(227,'07',3,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(228,'08',3,'4','Cerca del enchufe',FALSE,TRUE,FALSE,'Disponible',1,1),(229,'09',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(230,'10',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(231,'11',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(232,'12',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(233,'13',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(234,'14',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(235,'15',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(236,'16',3,'4','',FALSE,FALSE,FALSE,'Disponible',1,1),(237,'17',3,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1),(238,'18',3,'4','Cerca del baño',FALSE,FALSE,TRUE,'Disponible',1,1);
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TokenAuth` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Expiration` datetime(6) NOT NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PublicationDate` date NOT NULL,
  `FileMimeType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `File` longblob NOT NULL,
  `UserCreatedId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Archive_UserCreatedId` (`UserCreatedId`),
  CONSTRAINT `FK_Archive_User_UserCreatedId` FOREIGN KEY (`UserCreatedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
UNLOCK TABLES;


-- Dump completed on 2025-06-20 20:45:46

--
-- Table structure for table `authorarchive`
--

DROP TABLE IF EXISTS `authorarchive`;
CREATE TABLE `authorarchive` (
  `AuthorId` int NOT NULL,
  `ArchiveId` int NOT NULL,
  PRIMARY KEY (`ArchiveId`,`AuthorId`),
  KEY `IX_AuthorArchive_AuthorId` (`AuthorId`),
  CONSTRAINT `FK_AuthorArchive_Archive_ArchiveId` FOREIGN KEY (`ArchiveId`) REFERENCES `archive` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AuthorArchive_Author_AuthorId` FOREIGN KEY (`AuthorId`) REFERENCES `author` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `authorarchive`
--

LOCK TABLES `authorarchive` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ReserveDate` date NOT NULL,
  `Status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserReservedId` int NOT NULL,
  `SeatReservedId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Reserve_SeatReservedId` (`SeatReservedId`),
  KEY `IX_Reserve_UserReservedId` (`UserReservedId`),
  CONSTRAINT `FK_Reserve_Seat_SeatReservedId` FOREIGN KEY (`SeatReservedId`) REFERENCES `seat` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Reserve_User_UserReservedId` FOREIGN KEY (`UserReservedId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
INSERT INTO `reserve` VALUES (1,'2025-06-22',NULL,19,3),(2,'2025-06-19','Asiste',19,4),(3,'2025-06-18','Ausencia',19,4);
UNLOCK TABLES;