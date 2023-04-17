-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 28 mars 2023 à 11:14
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dsq`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID`, `Nom`) VALUES
(1, 'Disque dur interne'),
(2, 'disque dur externe'),
(3, 'PC de bureau'),
(4, 'Interface avec l\'ordinateur');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

DROP TABLE IF EXISTS `connexion`;
CREATE TABLE IF NOT EXISTS `connexion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Pwd` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `connexion`
--

INSERT INTO `connexion` (`ID`, `Nom`, `Prenom`, `Mail`, `Pwd`) VALUES
(1, 'kalim', 'koli', 'kalim@gmail.com', 'kolili'),
(2, 'nacim', 'marwa', 'marwa@gmail.com', 'nacimar'),
(3, 'menayami', 'perside', 'perside@gmail.com', 'menaypersi'),
(4, 'said', 'ahadi', 'ahadi@gmail.com', 'saidah'),
(5, 'malike', 'omar', 'omar@gmail.com', 'mailkomar'),
(6, 'ali', 'loula', 'loula@gmail.com', 'loulali');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`ID`, `Nom`) VALUES
(1, 'Sandisk'),
(2, 'Western Digital'),
(3, 'Seagate Technology'),
(4, 'Seagate Technology'),
(5, 'Toshiba'),
(6, 'Seagate');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CONNEXION` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `ID_PRODUIT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `inder` (`ID_CONNEXION`),
  KEY `inderi` (`ID_PRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prix` float NOT NULL,
  `Description` text NOT NULL,
  `Capacite` varchar(50) NOT NULL,
  `ID_MARQUE` int(11) NOT NULL,
  `ID_CATEGORIE` int(11) NOT NULL,
  `Image` text,
  PRIMARY KEY (`ID`),
  KEY `INDU` (`ID_MARQUE`),
  KEY `INDO` (`ID_CATEGORIE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`ID`, `Nom`, `Prix`, `Description`, `Capacite`, `ID_MARQUE`, `ID_CATEGORIE`, `Image`) VALUES
(1, 'Sandisk Extreme Portable SSD V2 - 2 To', 299, 'Le disque SSD robuste portable SanDisk Extreme offre des transferts haute vitesse avec des vitesses de lecture s’élevant jusqu’à 1050 Mo / s. Une solution idéale pour l’enregistrement et l’édition de photos et vidéos haute résolution. De classe IP55, il est également résistant à la pluie, aux éclaboussures, aux déversements et à la poussière.', '2 To', 1, 2, 'images/Sandisk Extreme Portable SSD V2 - 2 To.jpg\r\n'),
(2, 'Western Digital WD Red - 4 To - 256 Mo', 199, 'Western Digital est passé maître dans la conception de disques durs dédiés au stockage de donnée et répondant parfaitement aux attentes d\'utilisateurs de système NAS, serveur, stations de travail et installation home-cinéma. Un micrologiciel WD NASWare a ainsi été installé sur le disque dur Red afin de permettre l\'utilisation du disque en continu tout en préservant vos données et des performances optimales en silence grâce à sa vitesse de rotation à 5400 RPM. Vous n’avez qu’à choisir le mode RAID qui vous convient le mieux (ou pas)et accédez à vos fichiers à tout moment avec des taux de transfert pouvant atteindre 210 Mo/s ! Et pour répondre au mieux à vos besoins, la compatibilité de ce disque dur Red est également assurée avec la plupart des serveurs NAS de grands fabricants tels que Qnap, Synology, Asustor ou encore Netgear.', '4 To', 2, 3, 'images/Western Digital WD Red - 4 To - 256 Mo image.jpg'),
(3, 'Seagate Expansion Portable - 2 To', 94, 'Le Seagate Expansion Portable dernière génération est l\'archétype de la solution de stockage de base. Un disque dur simple, portable avec un unique câble de connexion USB Type A, pas d\'options ou de fonctionnalité diverses et variées.. Répondant à la norme USB 3.2 Gen 1, il pour saura être connecter à tout ordinateur équipé d\'un port USB Type A et ce de l\'USB 2.0 à l\'USB 3.2 via sa rétrocompatibilité. Le Seagate Expansion Portable est disponible en plusieurs capacités jusqu\'à 5 To. Attention cependant à ce dernier (ainsi qu\'à son homologue de 4 To), il sera plus épais et plus lourd que ses homologues de plus petite capacité ; mais cela reste très raisonnable. Aucune source d\'alimentation supplémentaire nécessaire, le câble USB suffit aussi bien pour le transfert des données que pour l\'alimentation électrique, même en USB 2.0.', '2 To', 3, 2, 'images/Seagate Expansion Portable - 2 To.jpg'),
(4, 'Seagate Exos X20 - 20 To - 256 Mo', 439, 'Les disques durs Seagate Exos sont des disques durs d’entreprise destinés au stockage et au applications de données de masse. En assemblant des serveurs de données à base de disques durs Seagate Exos, vous êtes certain de disposer d\'une infrastructure de stockage s’adaptant à vos besoins croissants. Conçus pour des usages intensifs et exigeants les disques Seagate Exos affiche un MTBF de 2.5 millions d\'heures ainsi qu\'une garantie de 5 ans.', '20 To', 3, 4, 'images/Seagate Exos X20 - 20 To - 256 Mo.jpg'),
(5, 'Toshiba X300 - 12 To - 256 Mo', 549, 'Avec une vitesse de rotation de 7200 tr/min et une mémoire tampon jusqu\'à 256 Mo, vos données sont stockées en toute sécurité et accessibles rapidement. Qu\'il s\'agisse de l\'enregistrement rapide de jeux, de la sauvegarde d\'un fichier volumineux ou de l\'exécution de plusieurs applications, le X300 maintient ses performances élevées tout au long de la journée, chaque jour. Idéal pour les concepteurs graphiques et les professionnels créatifs, le X300 est capable de gérer pratiquement n\'importe quelle charge de travail.\r\n\r\nLe double actionneur du X300, améliore la précision de positionnement, en atténuant les effets des vibrations sur l\'alignement tête-voie. Cette conception offre des vitesses de lecture et d\'écriture plus rapides et plus précises, ainsi qu\'un accès instantané à vos données.', '12 To', 5, 4, 'images/Toshiba X300 - 12 To - 256 Mo.jpg'),
(6, 'Seagate IronWolf - 1 To - 64 Mo', 399, 'Gagnez en productivité avec la technologie multi-utilisateurs. Permet des flux de travail de l\'utilisateur allant jusqu\'à 180 To/an sur IronWolf, plusieurs utilisateurs peuvent charger et télécharger des données sur un serveur NAS avec confiance. Que vous soyez un pro créatif ou une petite entreprise, IronWolf est à vos côtés.', '1 To', 6, 4, 'images/Seagate IronWolf - 1 To - 64 Mo.jpg'),
(7, 'Seagate BarraCuda Pro Mobile - 1 To - 128 Mo', 215, 'BarraCuda domine le marché en proposant les meilleures capacités pour les ordinateurs de bureau et périphériques mobiles. La plus grande capacité de la gamme BarraCuda étant de 10 To, ces disques conviennent parfaitement aux mises à niveau et à tous les budgets. L\'intransigeant BarraCuda Pro combine la meilleure capacité du secteur à une vitesse de rotation de 7200 tr/min pour offrir des performances et des temps de chargement sensationnels lorsque vous jouez ou traitez des charges de travail intensives. BarraCuda Pro est également couvert par une garantie de cinq ans.', '1 To', 3, 4, 'images/Seagate BarraCuda Pro Mobile - 1 To - 128 Mo.jpg'),
(8, 'Seagate IronWolf - 3 To - 256 Mo', 123, 'Gagnez en productivité avec la technologie multi-utilisateurs. Permet des flux de travail de l\'utilisateur allant jusqu\'à 180 To/an sur IronWolf, plusieurs utilisateurs peuvent charger et télécharger des données sur un serveur NAS avec confiance. Que vous soyez un pro créatif ou une petite entreprise, IronWolf est à vos côtés.', '3 To', 6, 4, 'images/Seagate.jpg'),
(9, 'Toshiba N300 - 16 To - 512 Mo', 456, 'Le disque, qui peut prendre en charge plusieurs systèmes multi-RAID avec jusqu\'à 8 disques durs, permet un stockage et une utilisation fiables d\'importants volumes de données par plusieurs clients 24 h sur 24 et 7 jours sur 7. ', '16 To', 5, 4, 'images/Toshiba.jpg'),
(10, 'Western Digital WD Gold - 20 To - 512 Mo', 699, 'Basés sur différentes technologies exclusives Western Digital, ces disques bénéficient d\'un double actionneur et d\'une mémoire cache jusqu\'à 512 Mo de RAM ainsi qu\'un cache UFS de 64 Go iNAND. Cette nouvelle technologie est sensée soulager le contrôleur principal et améliorer les performance de l\'unité de stockage. Avec jusqu\'à 2,5 millions d\'heures MTBF les disques durs WD Gold offrent une fiabilité et une durabilité maximales au sein des environnements de travail les plus exigeants.', '20 To', 2, 4, 'images/Western Digital.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`ID_CONNEXION`) REFERENCES `connexion` (`ID`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `produit` (`ID`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`ID_CATEGORIE`) REFERENCES `categorie` (`ID`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`ID_MARQUE`) REFERENCES `marque` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
