CREATE SCHEMA velozcar1;
USE velozcar1;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    ano_fabricacao INT NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE aluguel (
    id_aluguel INT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    local_retirada VARCHAR(100) NOT NULL,
    local_devolucao VARCHAR(100) NOT NULL,
    km_inicial INT NOT NULL,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY,
    valor_pagamento DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    metodo_pagamento VARCHAR(20) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    desconto DECIMAL(10,2),
    multa DECIMAL(10,2),
    comprovante VARCHAR(100),
    id_aluguel INT NOT NULL UNIQUE,
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel)
);

CREATE TABLE manutencao (
    id_manutencao INT PRIMARY KEY,
    descricao_servico VARCHAR(200) NOT NULL,
    custo DECIMAL(10,2) NOT NULL,
    data_manutencao DATE NOT NULL,
    responsavel VARCHAR(100) NOT NULL,
    tipo_manutencao VARCHAR(50) NOT NULL,
    status_manutencao VARCHAR(20) NOT NULL,
    proxima_revisao DATE,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

INSERT INTO cliente (id_cliente, nome, cpf, data_nascimento, telefone, email, endereco, data_cadastro) VALUES
(1, 'Matheus Duarte', '111.111.111-01', '2004-06-12', '(83) 98888-1001', 'matheus1@email.com', 'Rua das Acacias, 101', '2025-01-10'),
(2, 'Ana Souza', '111.111.111-02', '1998-03-21', '(83) 98888-1002', 'ana.souza@email.com', 'Av. Epitacio Pessoa, 202', '2025-01-12'),
(3, 'Carlos Lima', '111.111.111-03', '1995-08-09', '(83) 98888-1003', 'carlos.lima@email.com', 'Rua das Flores, 303', '2025-01-15'),
(4, 'Fernanda Alves', '111.111.111-04', '1992-11-02', '(83) 98888-1004', 'fernanda.alves@email.com', 'Rua Aderbal Piragibe, 404', '2025-01-18'),
(5, 'Joao Pedro', '111.111.111-05', '2000-01-30', '(83) 98888-1005', 'joao.pedro@email.com', 'Rua Bancario Sergio Guerra, 505', '2025-01-20'),
(6, 'Mariana Costa', '111.111.111-06', '1997-05-17', '(83) 98888-1006', 'mariana.costa@email.com', 'Rua Josefa Taveira, 606', '2025-01-24'),
(7, 'Lucas Ferreira', '111.111.111-07', '1989-09-14', '(83) 98888-1007', 'lucas.ferreira@email.com', 'Rua das Trincheiras, 707', '2025-01-27'),
(8, 'Beatriz Santos', '111.111.111-08', '1994-12-08', '(83) 98888-1008', 'beatriz.santos@email.com', 'Rua Pedro II, 808', '2025-02-01'),
(9, 'Rafael Martins', '111.111.111-09', '1990-07-11', '(83) 98888-1009', 'rafael.martins@email.com', 'Av. Rui Carneiro, 909', '2025-02-03'),
(10, 'Juliana Rocha', '111.111.111-10', '1999-04-26', '(83) 98888-1010', 'juliana.rocha@email.com', 'Rua Maxima, 1000', '2025-02-05');

INSERT INTO funcionario (id_funcionario, nome, cpf, cargo, telefone, email, salario, data_admissao) VALUES
(1, 'Ricardo Nunes', '222.222.222-01', 'Atendente', '(83) 97777-2001', 'ricardo.nunes@velozcar.com', 2500.00, '2024-03-01'),
(2, 'Paula Medeiros', '222.222.222-02', 'Gerente', '(83) 97777-2002', 'paula.medeiros@velozcar.com', 4800.00, '2023-06-15'),
(3, 'Bruno Henrique', '222.222.222-03', 'Atendente', '(83) 97777-2003', 'bruno.henrique@velozcar.com', 2600.00, '2024-01-10'),
(4, 'Larissa Gomes', '222.222.222-04', 'Financeiro', '(83) 97777-2004', 'larissa.gomes@velozcar.com', 3200.00, '2023-11-20'),
(5, 'Eduardo Silva', '222.222.222-05', 'Mecanico', '(83) 97777-2005', 'eduardo.silva@velozcar.com', 3500.00, '2022-09-05'),
(6, 'Camila Barros', '222.222.222-06', 'Atendente', '(83) 97777-2006', 'camila.barros@velozcar.com', 2550.00, '2024-05-08'),
(7, 'Sergio Oliveira', '222.222.222-07', 'Mecanico', '(83) 97777-2007', 'sergio.oliveira@velozcar.com', 3600.00, '2022-12-12'),
(8, 'Patricia Lima', '222.222.222-08', 'Financeiro', '(83) 97777-2008', 'patricia.lima@velozcar.com', 3300.00, '2023-08-18'),
(9, 'Gustavo Araujo', '222.222.222-09', 'Supervisor', '(83) 97777-2009', 'gustavo.araujo@velozcar.com', 4200.00, '2023-02-27'),
(10, 'Renata Freitas', '222.222.222-10', 'Atendente', '(83) 97777-2010', 'renata.freitas@velozcar.com', 2700.00, '2024-07-01');

INSERT INTO veiculo (id_veiculo, placa, modelo, marca, cor, ano_fabricacao, valor_diaria, status) VALUES
(1, 'QFA1A11', 'Onix', 'Chevrolet', 'Prata', 2022, 120.00, 'disponivel'),
(2, 'QFA2B22', 'HB20', 'Hyundai', 'Branco', 2021, 115.00, 'disponivel'),
(3, 'QFA3C33', 'Argo', 'Fiat', 'Preto', 2023, 130.00, 'alugado'),
(4, 'QFA4D44', 'Ka', 'Ford', 'Vermelho', 2020, 105.00, 'manutencao'),
(5, 'QFA5E55', 'Cronos', 'Fiat', 'Cinza', 2022, 125.00, 'disponivel'),
(6, 'QFA6F66', 'Gol', 'Volkswagen', 'Branco', 2019, 98.00, 'disponivel'),
(7, 'QFA7G77', 'Pulse', 'Fiat', 'Azul', 2024, 160.00, 'alugado'),
(8, 'QFA8H88', '208', 'Peugeot', 'Prata', 2023, 140.00, 'disponivel'),
(9, 'QFA9I99', 'Sandero', 'Renault', 'Preto', 2021, 110.00, 'manutencao'),
(10, 'QFB0J00', 'Corolla', 'Toyota', 'Branco', 2024, 220.00, 'disponivel');

INSERT INTO aluguel (id_aluguel, data_inicio, data_fim, valor_total, status, local_retirada, local_devolucao, km_inicial, id_cliente, id_funcionario, id_veiculo) VALUES
(1, '2025-02-10', '2025-02-13', 360.00, 'finalizado', 'Loja Centro', 'Loja Centro', 15230, 1, 1, 1),
(2, '2025-02-12', '2025-02-15', 345.00, 'finalizado', 'Loja Centro', 'Loja Centro', 28110, 2, 3, 2),
(3, '2025-02-18', '2025-02-22', 520.00, 'finalizado', 'Loja Sul', 'Loja Sul', 9900, 3, 6, 3),
(4, '2025-02-20', '2025-02-23', 375.00, 'finalizado', 'Loja Norte', 'Loja Norte', 22450, 4, 10, 5),
(5, '2025-02-25', '2025-02-28', 294.00, 'finalizado', 'Loja Centro', 'Loja Centro', 45200, 5, 1, 6),
(6, '2025-03-01', '2025-03-04', 480.00, 'finalizado', 'Loja Sul', 'Loja Sul', 3500, 6, 3, 7),
(7, '2025-03-03', '2025-03-06', 420.00, 'finalizado', 'Loja Centro', 'Loja Centro', 8700, 7, 6, 8),
(8, '2025-03-05', '2025-03-08', 660.00, 'finalizado', 'Loja Norte', 'Loja Norte', 1100, 8, 10, 10),
(9, '2025-03-10', '2025-03-13', 390.00, 'ativo', 'Loja Centro', 'Loja Sul', 10450, 9, 1, 3),
(10, '2025-03-14', '2025-03-17', 480.00, 'atrasado', 'Loja Sul', 'Loja Centro', 3900, 10, 6, 7);

INSERT INTO pagamento (id_pagamento, valor_pagamento, data_pagamento, metodo_pagamento, status_pagamento, desconto, multa, comprovante, id_aluguel) VALUES
(1, 360.00, '2025-02-10', 'pix', 'concluido', 0.00, 0.00, 'comp_001.pdf', 1),
(2, 345.00, '2025-02-12', 'cartao', 'concluido', 0.00, 0.00, 'comp_002.pdf', 2),
(3, 500.00, '2025-02-18', 'boleto', 'concluido', 20.00, 0.00, 'comp_003.pdf', 3),
(4, 375.00, '2025-02-20', 'pix', 'concluido', 0.00, 0.00, 'comp_004.pdf', 4),
(5, 294.00, '2025-02-25', 'cartao', 'concluido', 0.00, 0.00, 'comp_005.pdf', 5),
(6, 480.00, '2025-03-01', 'pix', 'concluido', 0.00, 0.00, 'comp_006.pdf', 6),
(7, 420.00, '2025-03-03', 'cartao', 'concluido', 0.00, 0.00, 'comp_007.pdf', 7),
(8, 660.00, '2025-03-05', 'boleto', 'pendente', 0.00, 0.00, 'comp_008.pdf', 8),
(9, 390.00, '2025-03-10', 'pix', 'pendente', 0.00, 0.00, 'comp_009.pdf', 9),
(10, 450.00, '2025-03-14', 'cartao', 'pendente', 0.00, 30.00, 'comp_010.pdf', 10);

INSERT INTO manutencao (id_manutencao, descricao_servico, custo, data_manutencao, responsavel, tipo_manutencao, status_manutencao, proxima_revisao, id_veiculo) VALUES
(1, 'Troca de oleo e filtros', 320.00, '2025-01-08', 'Eduardo Silva', 'preventiva', 'concluida', '2025-07-08', 1),
(2, 'Alinhamento e balanceamento', 180.00, '2025-01-12', 'Sergio Oliveira', 'preventiva', 'concluida', '2025-07-12', 2),
(3, 'Revisao completa', 650.00, '2025-01-18', 'Eduardo Silva', 'preventiva', 'concluida', '2025-07-18', 3),
(4, 'Troca de pastilhas de freio', 420.00, '2025-02-01', 'Sergio Oliveira', 'corretiva', 'em_andamento', '2025-08-01', 4),
(5, 'Higienizacao interna', 150.00, '2025-02-03', 'Eduardo Silva', 'preventiva', 'concluida', '2025-08-03', 5),
(6, 'Troca de pneus dianteiros', 980.00, '2025-02-07', 'Sergio Oliveira', 'corretiva', 'concluida', '2025-08-07', 6),
(7, 'Revisao dos 10 mil km', 540.00, '2025-02-10', 'Eduardo Silva', 'preventiva', 'concluida', '2025-08-10', 7),
(8, 'Troca de bateria', 600.00, '2025-02-14', 'Sergio Oliveira', 'corretiva', 'concluida', '2025-08-14', 8),
(9, 'Correia e tensores', 730.00, '2025-02-20', 'Eduardo Silva', 'corretiva', 'agendada', '2025-08-20', 9),
(10, 'Polimento e vitrificacao', 900.00, '2025-02-25', 'Sergio Oliveira', 'estetica', 'concluida', '2025-08-25', 10);

UPDATE veiculo
SET status = 'manutencao'
WHERE id_veiculo = 4;

UPDATE pagamento
SET status_pagamento = 'concluido'
WHERE id_pagamento = 8;

SELECT data_cadastro, COUNT(*) AS total_clientes
FROM cliente
GROUP BY data_cadastro;

SELECT YEAR(data_nascimento) AS ano_nascimento, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY YEAR(data_nascimento);

SELECT cargo, COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY cargo;

SELECT cargo, AVG(salario) AS media_salarial
FROM funcionario
GROUP BY cargo;

SELECT status, COUNT(*) AS total_veiculos
FROM veiculo
GROUP BY status;

SELECT marca, AVG(valor_diaria) AS media_valor_diaria
FROM veiculo
GROUP BY marca;

SELECT status, COUNT(*) AS total_alugueis
FROM aluguel
GROUP BY status;

SELECT id_funcionario, SUM(valor_total) AS total_movimentado
FROM aluguel
GROUP BY id_funcionario;

SELECT status_pagamento, COUNT(*) AS total_pagamentos
FROM pagamento
GROUP BY status_pagamento;

SELECT metodo_pagamento, SUM(valor_pagamento) AS total_recebido
FROM pagamento
GROUP BY metodo_pagamento;

SELECT status_manutencao, COUNT(*) AS total_manutencoes
FROM manutencao
GROUP BY status_manutencao;

SELECT responsavel, SUM(custo) AS custo_total_manutencao
FROM manutencao
GROUP BY responsavel;

SELECT a.id_aluguel, c.nome AS cliente, v.modelo AS veiculo, a.data_inicio, a.data_fim, a.status
FROM aluguel a
INNER JOIN cliente c ON a.id_cliente = c.id_cliente
INNER JOIN veiculo v ON a.id_veiculo = v.id_veiculo;

SELECT a.id_aluguel, f.nome AS funcionario, c.nome AS cliente, a.valor_total
FROM aluguel a
INNER JOIN funcionario f ON a.id_funcionario = f.id_funcionario
INNER JOIN cliente c ON a.id_cliente = c.id_cliente;

SELECT p.id_pagamento, a.id_aluguel, c.nome AS cliente, p.metodo_pagamento, p.status_pagamento, p.valor_pagamento
FROM pagamento p
INNER JOIN aluguel a ON p.id_aluguel = a.id_aluguel
INNER JOIN cliente c ON a.id_cliente = c.id_cliente;

SELECT m.id_manutencao, v.modelo, v.placa, m.tipo_manutencao, m.status_manutencao, m.custo
FROM manutencao m
LEFT JOIN veiculo v ON m.id_veiculo = v.id_veiculo;

SELECT v.marca, COUNT(a.id_aluguel) AS total_alugueis
FROM veiculo v
LEFT JOIN aluguel a ON v.id_veiculo = a.id_veiculo
GROUP BY v.marca;
