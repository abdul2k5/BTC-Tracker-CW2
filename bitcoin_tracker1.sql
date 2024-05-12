-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2024 at 07:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitcoin_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `max_supply` decimal(40,20) DEFAULT NULL,
  `market_cap` decimal(40,20) DEFAULT NULL,
  `volume_24hr` decimal(40,20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `timestamp`, `name`, `symbol`, `max_supply`, `market_cap`, `volume_24hr`) VALUES
(1, '2024-05-07 14:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1252534460985.75756353113051080000, 8693827284.20563364060302800000),
(2, '2024-05-07 15:10:40', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1253503927277.48989198875083120000, 8688934586.48267332442640060000),
(3, '2024-05-07 16:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1254952252394.09086066817921280000, 8447627559.46171091253823670000),
(4, '2024-05-07 17:10:32', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1266481646566.57425937786413500000, 8278474097.85593418073969370000),
(5, '2024-05-07 18:10:36', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1262684976863.42687012034934500000, 8259234452.75792669308145690000),
(6, '2024-05-07 19:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1262081929187.15497240649673000000, 7827779178.84312185980733810000),
(7, '2024-05-07 20:10:47', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1252970370592.50807855155930000000, 7454244351.85444340962676060000),
(8, '2024-05-07 21:10:27', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1252662238348.46871589843139000000, 7264522641.61049213153927080000),
(9, '2024-05-07 22:10:02', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1256818680583.28112743146491630000, 7014019148.55177440305593960000),
(10, '2024-05-07 23:10:42', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1262268445070.52095382536330580000, 6887777037.09994856941241040000),
(11, '2024-05-08 00:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1257532142981.12081363654906400000, 6733830703.19457633222470270000),
(12, '2024-05-08 01:10:32', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1250914191459.50914516914707400000, 6406288680.46003565779107900000),
(13, '2024-05-08 02:10:23', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1247240501023.20639567915562840000, 6169316377.08482252545755840000),
(14, '2024-05-08 03:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1243566810586.90364618916418280000, 6032344073.70960939312403780000),
(15, '2024-05-08 04:10:34', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1243585314962.43364548916126350000, 6183146451.21457036875914030000),
(16, '2024-05-08 05:10:33', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1239893120151.60089669917273720000, 6231620414.71621697584132510000),
(17, '2024-05-08 06:10:37', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1236200925343.76814790918421090000, 6315216911.95127836959801730000),
(18, '2024-05-08 07:10:32', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1232508730535.93539911919568460000, 6345675015.11655745090798520000),
(19, '2024-05-08 08:10:31', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1230623561325.64279524573012780000, 6378915321.15487419847107790000),
(20, '2024-05-08 09:10:30', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1234138404241.42401267501664540000, 6368168868.80560017315822140000),
(21, '2024-05-08 10:10:30', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1235171678122.13038096855447260000, 6380771837.87367037034419300000),
(22, '2024-05-08 11:10:46', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1236980415005.90726143817082500000, 6376096833.92875320637616850000),
(23, '2024-05-08 12:10:37', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1239861532974.86211440462422500000, 6467304915.72644894077376150000),
(24, '2024-05-08 13:10:32', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1230843011763.66283886722315840000, 6182971833.54144238115133430000),
(25, '2024-05-08 14:10:45', 'Bitcoin', 'BTC', 21000000.00000000000000000000, 1233964171771.81405934961498120000, 6144270929.68047094923296730000);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(40,20) NOT NULL,
  `change_percent` decimal(40,20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `asset_id`, `timestamp`, `price`, `change_percent`) VALUES
(1, 1, '2024-05-07 14:10:31', 63596.58366956548574730000, -0.85626837467843240000),
(2, 1, '2024-05-07 15:10:40', 63645.80765984871954220000, -1.02397844129879540000),
(3, 1, '2024-05-07 16:10:31', 63719.34538062819919680000, -1.26650191548784370000),
(4, 1, '2024-05-07 17:10:32', 64304.56620148586875270000, -1.46441537951535940000),
(5, 1, '2024-05-07 18:10:36', 64111.79341323971607690000, -1.66337049237940330000),
(6, 1, '2024-05-07 19:10:31', 64081.01147936060098230000, -0.44147853374760930000),
(7, 1, '2024-05-07 20:10:47', 63618.38074406873174300000, -1.03781103829498920000),
(8, 1, '2024-05-07 21:10:27', 62696.73562198052895890000, -0.05429178972581380000),
(9, 1, '2024-05-07 22:10:02', 63813.60330550776261710000, 0.47423872328957010000),
(10, 1, '2024-05-07 23:10:42', 64090.30917761953683860000, 1.59220633350588790000),
(11, 1, '2024-05-08 00:10:31', 63849.82858376986528800000, 0.35199927823089870000),
(12, 1, '2024-05-08 01:10:32', 63513.67061589583293150000, 0.02960058114566420000),
(13, 1, '2024-05-08 02:10:23', 63327.14338172650811290000, 0.15932365013140390000),
(14, 1, '2024-05-08 03:10:31', 63201.74652143470134210000, 0.46473156801249780000),
(15, 1, '2024-05-08 04:10:34', 63152.54397021497811420000, 0.53649024566713500000),
(16, 1, '2024-05-08 05:10:33', 63003.92345720165784210000, 0.43564104678931040000),
(17, 1, '2024-05-08 06:10:37', 62949.45378014595687120000, 0.41645013964567850000),
(18, 1, '2024-05-08 07:10:32', 62479.31491097517435980000, 0.44647812031876800000),
(19, 1, '2024-05-08 08:10:31', 62469.58234478236472180000, 0.48297901245351450000),
(20, 1, '2024-05-08 09:10:30', 62661.59148997803752780000, -1.46893413156720720000),
(21, 1, '2024-05-08 10:10:30', 62714.05447596694199820000, -1.78367833897840080000),
(22, 1, '2024-05-08 11:10:46', 62805.78842978764054100000, -1.39902126630664980000),
(23, 1, '2024-05-08 12:10:37', 62952.07278757076181300000, -0.54369054170070440000),
(24, 1, '2024-05-08 13:10:32', 62494.07280394742998640000, -1.52323456459878700000),
(25, 1, '2024-05-08 14:10:45', 62652.54467966022342270000, -1.46713057526201160000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_id` (`asset_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4254;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
