-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 05 déc. 2023 à 23:25
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `panneaudeme`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_administrateur` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `super_admin` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `id_super_admin` int(11) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_administrateur`, `email`, `mot_de_passe`, `nom`, `prenom`, `super_admin`, `active`, `photo`, `id_super_admin`, `telephone`) VALUES
(1, 'adamakonake@gmail.com', '$2a$10$UlpXsTzyfiqa4Wc7UT7AOOELw0haHtM9O3RBNpzparGHAtn.R.Rai', 'Konake', 'Adama', b'1', b'1', '/panneau/administrateurs/adamakonake@gmail.com.png', NULL, '77-77-77-77'),
(2, 'allassaneberthe@gmail.com', '$2a$10$TUDNlBR0f13B.q.XMuHf8.j4mD69UMUsiQD/y7vgk1SF9XUVJaIBq', 'Al Hassane', 'Berthé', b'0', b'1', '/panneau/administrateurs/allassaneberthe@gmail.com.png', 1, '77777777');

-- --------------------------------------------------------

--
-- Structure de la table `appareil`
--

CREATE TABLE `appareil` (
  `id_appareil` int(11) NOT NULL,
  `heure_conso` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `puissance` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appareil`
--

INSERT INTO `appareil` (`id_appareil`, `heure_conso`, `nom`, `puissance`, `quantite`, `id_utilisateur`) VALUES
(1, 3, 'Ampoule', 5, 5, 1),
(2, 4, 'Televiseur', 50, 2, 1),
(4, 4, 'Refrigirateur', 75, 1, 1),
(5, 2, 'Micro-onde', 20, 1, 1),
(6, 5, 'Ventilateur', 15, 2, 1),
(7, 1, 'Fer à repasser', 5, 1, 1),
(8, 2, 'Radio', 12, 1, 1),
(9, 5, 'Lampe electrique', 12, 3, 6),
(10, 6, 'Ventillateur', 65, 4, 6),
(11, 4, 'Televiseur', 145, 2, 6),
(12, 24, 'Refrigirateur', 300, 1, 2),
(13, 6, 'Cimatisation', 1200, 1, 2),
(14, 3, 'Televiseur', 170, 1, 2),
(15, 4, 'PC', 70, 1, 2),
(16, 3, 'Eclairage', 60, 1, 2),
(17, 1, 'Have linge', 500, 1, 2),
(19, 3, 'Radi', 10, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `dimensionnement`
--

CREATE TABLE `dimensionnement` (
  `id_dimensionnement` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `capacite_batterie` int(11) NOT NULL,
  `puissance_crete` int(11) NOT NULL,
  `puissance_onduleur` int(11) NOT NULL,
  `puissance_regulateur` int(11) NOT NULL,
  `tension_travail` int(11) NOT NULL,
  `id_electricien` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dimensionnement`
--

INSERT INTO `dimensionnement` (`id_dimensionnement`, `date`, `description`, `capacite_batterie`, `puissance_crete`, `puissance_onduleur`, `puissance_regulateur`, `tension_travail`, `id_electricien`, `id_utilisateur`) VALUES
(1, '2023-12-05', 'Dimensionnent exemple', 125, 208, 204, 208, 12, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `electricien`
--

CREATE TABLE `electricien` (
  `id_electricien` int(11) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `experience` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id_administrateur` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `electricien`
--

INSERT INTO `electricien` (`id_electricien`, `active`, `email`, `experience`, `nom`, `photo`, `prenom`, `telephone`, `id_administrateur`, `latitude`, `longitude`) VALUES
(4, b'1', 'lancinakeita@gmail.com', 3, 'Keïta', '/panneau/electriciens/lancinakeita@gmail.com.png', 'Lancina', '77777777', 1, 12.6162125, -8.0455064),
(5, b'1', 'adamakonake@gmail.com', 2, 'Konake', '/panneau/electriciens/adamakonake@gmail.com.png', 'Adama', '77777777', 1, 12.6388305, -8.0103745),
(6, b'1', 'allassaneberthe@gmail.com', 1, 'Berthé', '/panneau/electriciens/allassaneberthe@gmail.com.png', 'Al Hassane', '77777777', 1, 12.634966, -8.00654);

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(11) NOT NULL,
  `intensite` int(11) DEFAULT 0,
  `marque` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `puissance` int(11) DEFAULT 0,
  `tension` int(11) DEFAULT 0,
  `id_type` int(11) DEFAULT NULL,
  `id_administrateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `intensite`, `marque`, `nom`, `prix`, `puissance`, `tension`, `id_type`, `id_administrateur`) VALUES
(8, 40, 'Voltronic', 'AXPERT VM1K', 131000, 500, 12, 14, 1),
(9, 50, 'Voltronic', 'AXPERT VP 3000', 222700, 1200, 24, 14, 1),
(10, 60, 'Voltronic', 'AXPERT VM 3000', 294750, 1500, 24, 14, 1),
(11, 60, 'Voltronic', 'AXPERT MKS', 320950, 1500, 24, 14, 1),
(12, 80, 'Voltronic', 'AXPERT MKS 5K', 450000, 4000, 48, 14, 1),
(13, 10, 'Victron energy', 'SmartSolar MPPT 75/10', 43000, 290, 24, 13, 1),
(14, 10, 'Victron energy', 'SmartSolar MPPT 75/10 12V', 43000, 145, 12, 13, 1),
(15, 15, 'Victron energy', 'SmartSolar MPPT 75/15', 47000, 400, 24, 13, 1),
(16, 15, 'Victron energy', 'SmartSolar MPPT 75/15 12V', 47000, 220, 12, 13, 1),
(17, 15, 'Victron energy', 'SmartSolar MPPT 100/15', 55500, 440, 24, 13, 1),
(18, 15, 'Victron energy', 'SmartSolar MPPT 100/15 12V', 55500, 220, 12, 13, 1),
(19, 20, 'Victron energy', 'SmartSolar MPPT 100/20', 63500, 1600, 48, 13, 1),
(20, 20, 'Victron energy', 'SmartSolar MPPT 100/20 24V', 63500, 580, 24, 13, 1),
(21, 20, 'Victron energy', 'SmartSolar MPPT 100/20 12V', 63500, 290, 12, 13, 1),
(22, 30, 'Victron energy', 'SmartSolar MPPT 100/30 12V', 91000, 440, 12, 13, 1),
(23, 30, 'Victron energy', 'SmartSolar MPPT 100/30', 91000, 880, 24, 13, 1),
(24, 50, 'Victron energy', 'SmartSolar MPPT 100/50', 131000, 1400, 24, 13, 1),
(25, 50, 'Victron energy', 'SmartSolar MPPT 100/50 12V', 131000, 700, 12, 13, 1),
(26, 120, 'Voltronic', 'AXPERT VM III', 394500, 5000, 24, 14, 1),
(27, 100, 'GOWATT', 'SPF5000-ES', 489000, 5500, 48, 14, 1),
(28, 100, 'Voltronic', 'AXPERT VM III 48', 444500, 5000, 48, 14, 1),
(29, 120, 'Voltronic', 'AXPERT VM III 6KW', 468000, 6000, 48, 14, 1),
(30, 120, 'Voltronic', 'AXPERT VM IV', 539500, 6000, 48, 14, 1),
(31, 35, 'Voltronic', 'SmartSolar MPPT 150/35', 131000, 2000, 48, 13, 1),
(32, 35, 'Voltronic', 'SmartSolar MPPT 150/35 24V', 131000, 1000, 24, 13, 1),
(33, 35, 'Voltronic', 'SmartSolar MPPT 150/35 12V', 131000, 500, 12, 13, 1),
(34, 45, 'Voltronic', 'SmartSolar MPPT 150/45', 155000, 2600, 48, 13, 1),
(35, 45, 'Voltronic', 'SmartSolar MPPT 150/45 24V', 155000, 1300, 24, 13, 1),
(36, 45, 'Voltronic', 'SmartSolar MPPT 150/45 12V', 131000, 650, 12, 13, 1),
(37, 60, 'Voltronic', 'SmartSolar MPPT 150/60-TR', 250000, 3440, 48, 13, 1),
(38, 60, 'Voltronic', 'SmartSolar MPPT 150/60-TR 24V', 250000, 1720, 24, 13, 1),
(39, 60, 'Voltronic', 'SmartSolar MPPT 150/60-TR 12V', 250000, 860, 12, 13, 1),
(40, 7, 'SunPower', 'Panneau monocristallin 250W', 64000, 250, 44, 10, 1),
(41, 7, 'SunPower', 'Panneau monocristallin 260W', 68500, 260, 44, 10, 1),
(42, 8, 'SunPower', 'Panneau monocristallin 270W', 71000, 270, 44, 10, 1),
(43, 8, 'SunPower', 'Panneau monocristallin 280W', 73000, 280, 44, 10, 1),
(44, 8, 'SunPower', 'Panneau monocristallin 285W', 75000, 285, 44, 10, 1),
(45, 8, 'SunPower', 'Panneau monocristallin 290W', 76400, 290, 44, 10, 1),
(46, 8, 'SunPower', 'Panneau monocristallin 300W', 89000, 325, 44, 10, 1),
(47, 100, 'Ultracell', 'Batterie GEL', 143400, 0, 12, 11, 1),
(48, 100, 'MES 12V', 'Batterie MES', 100000, 0, 12, 11, 1),
(49, 100, 'Ultimatron', 'Batterie plomb', 123000, 0, 12, 11, 1),
(50, 100, 'Victron energy', 'Batterie GEL', 124000, 0, 12, 11, 1),
(51, 100, 'SOLARFAM', 'Batterie GEL', 106500, 0, 12, 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `list_app`
--

CREATE TABLE `list_app` (
  `id_list_app` int(11) NOT NULL,
  `id_appareil` int(11) DEFAULT NULL,
  `id_dimensionnement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `list_app`
--

INSERT INTO `list_app` (`id_list_app`, `id_appareil`, `id_dimensionnement`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `list_equi`
--

CREATE TABLE `list_equi` (
  `id_list_equi` int(11) NOT NULL,
  `id_dimensionnement` int(11) DEFAULT NULL,
  `id_equipement` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `list_equi`
--

INSERT INTO `list_equi` (`id_list_equi`, `id_dimensionnement`, `id_equipement`, `quantite`) VALUES
(1, 1, 40, 1),
(2, 1, 47, 2),
(3, 1, 14, 2),
(4, 1, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id_note` int(11) NOT NULL,
  `valeur` double NOT NULL,
  `id_electricien` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_dimensionnement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `valeur`, `id_electricien`, `id_utilisateur`, `id_dimensionnement`) VALUES
(1, 0, 4, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_equipement`
--

CREATE TABLE `type_equipement` (
  `id_type_equipement` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_equipement`
--

INSERT INTO `type_equipement` (`id_type_equipement`, `titre`, `id_admin`) VALUES
(10, 'Panneau', 1),
(11, 'Batterie', 1),
(13, 'Régulateur', 1),
(14, 'Onduleur hybride', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `email`, `mot_de_passe`, `nom`, `prenom`) VALUES
(1, 'adamakonake@gmail.com', '$2a$10$.L9OxpRzq74E/T4Rdz.vCuYFVhyVef4jatXkW5Z3Nn8GFKXrn9r8y', 'Konaké', 'Adama'),
(2, 'ousmatotoure98@gmail.com', '$2a$10$pJoswM/KjZ9q4Kfui3iwc.Z9Ciplr47KJoVeB2BZBQOkf2ZvzU7dK', 'Touré', 'Ousmane'),
(3, 'isacdiakite3@gmail.com', '$2a$10$m6E6fevfiKbOeIv1WdyUu.3xDE6jtJSObmQqwj3pwUMOe9xTF1FyW', 'Diakité', 'Isaac'),
(4, 'dribojo@gmail.com', '$2a$10$7B9EBXGaMa4HeAzzpyD4SepgYOhbMyXHoLDqrpfrHJ21.I.YgEhVq', 'Togo', 'Drissa'),
(5, 'md9624561@gmail.com', '$2a$10$V1.uTVanJFHh9EnoncJvBu4zemB03sy5eApxvoeNDxcMxO4eQkNY6', 'Diarra', 'Mohamed'),
(6, 'mohameddiarrajunior@gmail.com', '$2a$10$iE/k3rfXCzF5S43qrBWfmegQBuEmHX95NJfMRncJrBAzaDGOYGV.O', 'Diarra', 'Mohamed');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_administrateur`),
  ADD KEY `FK2yutcmkamy6scs93gccs8k4ag` (`id_super_admin`);

--
-- Index pour la table `appareil`
--
ALTER TABLE `appareil`
  ADD PRIMARY KEY (`id_appareil`),
  ADD KEY `FKaki0eh2kw74mvtwpmyt8daymj` (`id_utilisateur`);

--
-- Index pour la table `dimensionnement`
--
ALTER TABLE `dimensionnement`
  ADD PRIMARY KEY (`id_dimensionnement`),
  ADD KEY `FKerg5r30b4wqx4ynwfidg93ty6` (`id_electricien`),
  ADD KEY `FKbfgbxxehkphcvk948fcnxnigg` (`id_utilisateur`);

--
-- Index pour la table `electricien`
--
ALTER TABLE `electricien`
  ADD PRIMARY KEY (`id_electricien`),
  ADD KEY `FKeb0j6jxgi8t5pj35hicgb8lvp` (`id_administrateur`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`),
  ADD KEY `FK3g20v3xlf4m2ds9eko67dan2x` (`id_type`),
  ADD KEY `FKmnvpupara2k3eud8k7cjg296g` (`id_administrateur`);

--
-- Index pour la table `list_app`
--
ALTER TABLE `list_app`
  ADD PRIMARY KEY (`id_list_app`),
  ADD KEY `FK5ivu9ujwgv0er6yg67c28rdns` (`id_appareil`),
  ADD KEY `FK50flfj7nhqewab7wesqdiqrup` (`id_dimensionnement`);

--
-- Index pour la table `list_equi`
--
ALTER TABLE `list_equi`
  ADD PRIMARY KEY (`id_list_equi`),
  ADD KEY `FKo92h1ektkgbd48s7fd24sbuxs` (`id_dimensionnement`),
  ADD KEY `FKcx9mvebltsyab9cwi3o06fk7k` (`id_equipement`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id_note`),
  ADD KEY `FKt6x3m0fjcrhdjr2mb94xuf81l` (`id_electricien`),
  ADD KEY `FK36tqo5th8abnwthnnkshoh9rq` (`id_utilisateur`),
  ADD KEY `FKho0aviqvy8hlvrhei64tag8wf` (`id_dimensionnement`);

--
-- Index pour la table `type_equipement`
--
ALTER TABLE `type_equipement`
  ADD PRIMARY KEY (`id_type_equipement`),
  ADD KEY `FKnx6jr2qml6ywenx19s6vrf07p` (`id_admin`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_administrateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `appareil`
--
ALTER TABLE `appareil`
  MODIFY `id_appareil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `dimensionnement`
--
ALTER TABLE `dimensionnement`
  MODIFY `id_dimensionnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `electricien`
--
ALTER TABLE `electricien`
  MODIFY `id_electricien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_equipement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `list_app`
--
ALTER TABLE `list_app`
  MODIFY `id_list_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `list_equi`
--
ALTER TABLE `list_equi`
  MODIFY `id_list_equi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_equipement`
--
ALTER TABLE `type_equipement`
  MODIFY `id_type_equipement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `FK2yutcmkamy6scs93gccs8k4ag` FOREIGN KEY (`id_super_admin`) REFERENCES `administrateur` (`id_administrateur`);

--
-- Contraintes pour la table `appareil`
--
ALTER TABLE `appareil`
  ADD CONSTRAINT `FKaki0eh2kw74mvtwpmyt8daymj` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `dimensionnement`
--
ALTER TABLE `dimensionnement`
  ADD CONSTRAINT `FKbfgbxxehkphcvk948fcnxnigg` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `FKerg5r30b4wqx4ynwfidg93ty6` FOREIGN KEY (`id_electricien`) REFERENCES `electricien` (`id_electricien`);

--
-- Contraintes pour la table `electricien`
--
ALTER TABLE `electricien`
  ADD CONSTRAINT `FKeb0j6jxgi8t5pj35hicgb8lvp` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`);

--
-- Contraintes pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD CONSTRAINT `FK3g20v3xlf4m2ds9eko67dan2x` FOREIGN KEY (`id_type`) REFERENCES `type_equipement` (`id_type_equipement`),
  ADD CONSTRAINT `FKmnvpupara2k3eud8k7cjg296g` FOREIGN KEY (`id_administrateur`) REFERENCES `administrateur` (`id_administrateur`);

--
-- Contraintes pour la table `list_app`
--
ALTER TABLE `list_app`
  ADD CONSTRAINT `FK50flfj7nhqewab7wesqdiqrup` FOREIGN KEY (`id_dimensionnement`) REFERENCES `dimensionnement` (`id_dimensionnement`),
  ADD CONSTRAINT `FK5ivu9ujwgv0er6yg67c28rdns` FOREIGN KEY (`id_appareil`) REFERENCES `appareil` (`id_appareil`);

--
-- Contraintes pour la table `list_equi`
--
ALTER TABLE `list_equi`
  ADD CONSTRAINT `FKcx9mvebltsyab9cwi3o06fk7k` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`),
  ADD CONSTRAINT `FKo92h1ektkgbd48s7fd24sbuxs` FOREIGN KEY (`id_dimensionnement`) REFERENCES `dimensionnement` (`id_dimensionnement`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK36tqo5th8abnwthnnkshoh9rq` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `FKho0aviqvy8hlvrhei64tag8wf` FOREIGN KEY (`id_dimensionnement`) REFERENCES `dimensionnement` (`id_dimensionnement`),
  ADD CONSTRAINT `FKt6x3m0fjcrhdjr2mb94xuf81l` FOREIGN KEY (`id_electricien`) REFERENCES `electricien` (`id_electricien`);

--
-- Contraintes pour la table `type_equipement`
--
ALTER TABLE `type_equipement`
  ADD CONSTRAINT `FKnx6jr2qml6ywenx19s6vrf07p` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_administrateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
