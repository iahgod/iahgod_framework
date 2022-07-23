-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Jul-2022 às 22:23
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `iahgod_framework`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fila_emails`
--

CREATE TABLE `fila_emails` (
  `id` int(11) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `to_name` varchar(255) NOT NULL,
  `to_assunto` varchar(255) NOT NULL,
  `to_body` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fila_emails`
--

INSERT INTO `fila_emails` (`id`, `from_email`, `from_name`, `to_email`, `to_name`, `to_assunto`, `to_body`, `status`) VALUES
(1, 'iagovinicius.12328@gmail.com', 'Iago Vinicios', 'iagovinicius.12328@gmail.com', 'Iago Vinicios', 'Sua nova senha', 'Iago Vinicios, Segue a sua nova senha do sistema Teste, sua nova senha é: 32d3cc6c14d4dddf747f01d61670665f', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_admins`
--

CREATE TABLE `menu_admins` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `icone` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordem` int(11) NOT NULL,
  `ativo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_admins`
--

INSERT INTO `menu_admins` (`id`, `titulo`, `icone`, `url`, `ordem`, `ativo`) VALUES
(1, 'Home', 'fas fa-tachometer-alt', '/admin', 1, 1),
(2, 'Minha conta', 'zmdi zmdi-account', '/admin/minha-conta', 2, 1),
(3, 'Configurações', 'zmdi zmdi-settings', '/admin/configuracoes', 3, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_admin_subs`
--

CREATE TABLE `menu_admin_subs` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacaos`
--

CREATE TABLE `notificacaos` (
  `id` int(11) NOT NULL,
  `to_user` int(11) DEFAULT NULL,
  `from_user` int(11) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notificacaos`
--

INSERT INTO `notificacaos` (`id`, `to_user`, `from_user`, `mensagem`, `data`) VALUES
(1, NULL, NULL, 'Olá seus puto', '2022-07-23 15:10:34'),
(2, NULL, NULL, 'Vagabundos', '2022-07-15 15:10:34'),
(3, NULL, NULL, 'Olá seus corno', '2022-07-03 15:10:34'),
(4, NULL, NULL, 'Vagabundos de merfda', '2022-07-17 15:10:34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao_relacaos`
--

CREATE TABLE `notificacao_relacaos` (
  `id` int(11) NOT NULL,
  `id_notificacao` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notificacao_relacaos`
--

INSERT INTO `notificacao_relacaos` (`id`, `id_notificacao`, `id_user`, `status`) VALUES
(9, 1, 1, '1'),
(10, 3, 3, '1'),
(11, 4, 3, '1'),
(12, 3, 1, '1'),
(13, 2, 1, '1'),
(14, 4, 1, '1'),
(15, 3, 1, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` date NOT NULL,
  `token` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'avatar-01.jpg',
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `senha`, `criado_em`, `token`, `foto`, `admin`) VALUES
(1, 'Iago', 'iagovinicius.12328@gmail.com', '$2y$10$sWjAcYHPlsGlGwlQhdBo3OXc6VtVOTsu6aWobYk1MhdtQ4B02cr3O', '2022-07-19', 'd6810736e6e40158b5373843913d76fd', '6d9f8c39eb95c2ea4e53c0e1c710d6da.jpg', 0),
(2, 'iago', 'iahgod@gmail.com', '$2y$10$VgcO/ry/fzubHCoKJplk8up5AnrQQPdc7BFKiXCPANcQP7zOfAUQe', '2022-07-19', '4568a40686d8f5105700d059c1bdc39c', 'avatar-01.jpg', 0),
(3, 'iago 2', 'iago@gmail.com', '$2y$10$u0mdO7sK.ihBJn93ULYdoeCpohIx23Q6DZ0tqATMezYViQa7OyF/e', '2022-07-23', '138de6bf9af2c2b915bba01ca4048ac0', 'avatar-01.jpg', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fila_emails`
--
ALTER TABLE `fila_emails`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `menu_admins`
--
ALTER TABLE `menu_admins`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `menu_admin_subs`
--
ALTER TABLE `menu_admin_subs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notificacaos`
--
ALTER TABLE `notificacaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notificacao_relacaos`
--
ALTER TABLE `notificacao_relacaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fila_emails`
--
ALTER TABLE `fila_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `menu_admins`
--
ALTER TABLE `menu_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `menu_admin_subs`
--
ALTER TABLE `menu_admin_subs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `notificacaos`
--
ALTER TABLE `notificacaos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `notificacao_relacaos`
--
ALTER TABLE `notificacao_relacaos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
