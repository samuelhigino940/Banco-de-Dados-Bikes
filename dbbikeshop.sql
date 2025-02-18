-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/02/2025 às 20:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbbikeshop`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessorios`
--

CREATE TABLE `acessorios` (
  `id_acessorios` int(11) NOT NULL,
  `nome_acessorios` varchar(50) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id_cargos` int(11) NOT NULL,
  `funcao` varchar(30) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `descricao_cargo` text NOT NULL,
  `beneficios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(30) NOT NULL,
  `descricao_categoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `cpf_cliente` varchar(15) NOT NULL,
  `data_nascimento_cliente` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `contato` int(11) NOT NULL,
  `ENDERECO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `id_contato` int(11) NOT NULL,
  `telefone_residencial` varchar(15) DEFAULT NULL,
  `telefone_comercial` varchar(15) DEFAULT NULL,
  `telefone_celular` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `tipo_logradouro` enum('RUA','AVENIDA','ALAMEDA','TRAVESSA','VIELA','ESTRADA','RODOVIA') DEFAULT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `bicicletas` int(11) NOT NULL,
  `quantidade_total_estoque` int(11) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `acessorios` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_bicicleta` varchar(50) DEFAULT NULL,
  `cnpj` varchar(20) NOT NULL,
  `contato` int(11) NOT NULL,
  `ENDERECO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionarios` int(11) NOT NULL,
  `nome_funcionarios` varchar(100) NOT NULL,
  `cpf_funcionarios` varchar(15) NOT NULL,
  `data_nascimento_funcionario` date NOT NULL,
  `horario_expediente` varchar(20) NOT NULL,
  `contato` int(11) NOT NULL,
  `endereco` int(11) NOT NULL,
  `cargos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historicovenda`
--

CREATE TABLE `historicovenda` (
  `id_historicovenda` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `nome_funcionarios` varchar(50) NOT NULL,
  `data_venda` date NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nome_marca` varchar(50) NOT NULL,
  `fornecedor` varchar(50) NOT NULL,
  `estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `modelo_bicicleta` varchar(50) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `venda` int(11) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `valor_pagar` decimal(6,2) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `valor_parcela` decimal(5,2) NOT NULL,
  `troco` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `precovenda`
--

CREATE TABLE `precovenda` (
  `id_precovenda` int(11) NOT NULL,
  `venda` int(11) NOT NULL,
  `produtos` int(11) NOT NULL,
  `quantidade_vendida` int(11) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `funcionarios` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` decimal(6,2) NOT NULL,
  `itens` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessorios`
--
ALTER TABLE `acessorios`
  ADD PRIMARY KEY (`id_acessorios`),
  ADD KEY `fk_acessorios_pk_fornecedor` (`fornecedor`),
  ADD KEY `fk_acessorios_pk_estoque` (`estoque`);

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargos`),
  ADD UNIQUE KEY `funcao` (`funcao`),
  ADD UNIQUE KEY `descricao_cargo` (`descricao_cargo`) USING HASH;

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria` (`nome_categoria`),
  ADD UNIQUE KEY `descricao_categoria` (`descricao_categoria`) USING HASH;

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  ADD KEY `fk_cliente_pk_endereco` (`ENDERECO`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_contato`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `fk_estoque_pk_modelo` (`modelo`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `fk_fornecedor_pk_endereco` (`ENDERECO`),
  ADD KEY `fk_fornecedor_pk_contato` (`contato`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionarios`),
  ADD UNIQUE KEY `cpf_funcionarios` (`cpf_funcionarios`),
  ADD KEY `fk_funiconarios_pk_endereco` (`endereco`),
  ADD KEY `fk_funiconarios_pk_contato` (`contato`),
  ADD KEY `fk_funiconarios_pk_cargos` (`cargos`);

--
-- Índices de tabela `historicovenda`
--
ALTER TABLE `historicovenda`
  ADD PRIMARY KEY (`id_historicovenda`),
  ADD KEY `fk_historicovenda_pk_venda` (`venda`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `fk_marca_pk_estoque` (`estoque`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `fk_modelo_pk_fornecedor` (`fornecedor`),
  ADD KEY `fk_modelo_pk_categoria` (`categoria`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `fk_pagamento_pk_venda` (`venda`);

--
-- Índices de tabela `precovenda`
--
ALTER TABLE `precovenda`
  ADD PRIMARY KEY (`id_precovenda`),
  ADD KEY `fk_precovenda_pk_venda` (`venda`),
  ADD KEY `fk_precovenda_pk_modelo` (`modelo`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_vendao_pk_cliente` (`cliente`),
  ADD KEY `fk_venda_pk_funcionarios` (`funcionarios`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessorios`
--
ALTER TABLE `acessorios`
  MODIFY `id_acessorios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id_cargos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_estoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historicovenda`
--
ALTER TABLE `historicovenda`
  MODIFY `id_historicovenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `precovenda`
--
ALTER TABLE `precovenda`
  MODIFY `id_precovenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `acessorios`
--
ALTER TABLE `acessorios`
  ADD CONSTRAINT `fk_acessorios_pk_estoque` FOREIGN KEY (`estoque`) REFERENCES `estoque` (`id_estoque`),
  ADD CONSTRAINT `fk_acessorios_pk_fornecedor` FOREIGN KEY (`fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_pk_endereco` FOREIGN KEY (`ENDERECO`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_pk_modelo` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id_modelo`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_fornecedor_pk_contato` FOREIGN KEY (`contato`) REFERENCES `contato` (`id_contato`),
  ADD CONSTRAINT `fk_fornecedor_pk_endereco` FOREIGN KEY (`ENDERECO`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_funiconarios_pk_cargos` FOREIGN KEY (`cargos`) REFERENCES `cargos` (`id_cargos`),
  ADD CONSTRAINT `fk_funiconarios_pk_contato` FOREIGN KEY (`contato`) REFERENCES `contato` (`id_contato`),
  ADD CONSTRAINT `fk_funiconarios_pk_endereco` FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `historicovenda`
--
ALTER TABLE `historicovenda`
  ADD CONSTRAINT `fk_historicovenda_pk_venda` FOREIGN KEY (`venda`) REFERENCES `venda` (`id_venda`);

--
-- Restrições para tabelas `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_marca_pk_estoque` FOREIGN KEY (`estoque`) REFERENCES `estoque` (`id_estoque`);

--
-- Restrições para tabelas `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_modelo_pk_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_modelo_pk_fornecedor` FOREIGN KEY (`fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_pk_venda` FOREIGN KEY (`venda`) REFERENCES `venda` (`id_venda`);

--
-- Restrições para tabelas `precovenda`
--
ALTER TABLE `precovenda`
  ADD CONSTRAINT `fk_precovenda_pk_modelo` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id_modelo`),
  ADD CONSTRAINT `fk_precovenda_pk_venda` FOREIGN KEY (`venda`) REFERENCES `venda` (`id_venda`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_pk_funcionarios` FOREIGN KEY (`funcionarios`) REFERENCES `funcionarios` (`id_funcionarios`),
  ADD CONSTRAINT `fk_vendao_pk_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
