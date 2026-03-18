CREATE SCHEMA desafio;

USE desafio;

CREATE TABLE aluno(
id_aluno INT PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(50),
telefone VARCHAR(20)
);

INSERT INTO aluno(id_aluno, nome, email, telefone)
VALUES (11, 'Matheus Duarte', 'matheus@gmail.com', '987654300'),
(22, 'Ana Júlia', 'ana@gmail.com', '988880000'),
(33, 'Carlos Silva', 'carlos@gmail.com', '981112223'),
(44, 'Fernanda Souza', 'fernanda@gmail.com', '982223334'),
(55, 'Lucas Pereira', 'lucas@gmail.com', '983334445'),
(66, 'Juliana Costa', 'juliana@gmail.com', '984445556'),
(77, 'Rafael Mendes', 'rafael@gmail.com', '985556667'),
(88, 'Bruno Alves', 'bruno@gmail.com', '986667778'),
(99, 'Camila Rocha', 'camila@gmail.com', '987778889'),
(100, 'Gustavo Lima', 'gustavo@gmail.com', '988889990');

CREATE TABLE treino(
 id_treino INT PRIMARY KEY,
 tipo_treino VARCHAR(50),
 duracao_min INT,
 id_aluno INT,
 
 FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

INSERT INTO treino(id_treino, tipo_treino, duracao_min, id_aluno)
VALUES (1, 'Peito e Triceps', 60, 11),
(2, 'Costas e Biceps', 55, 11),
(3, 'Pernas', 70, 22),
(4, 'Ombro', 50, 33),
(5, 'Cardio', 40, 44),
(6, 'Full Body', 65, 55),
(7, 'Gluteo e Posterior', 60, 66),
(8, 'Abdomen', 30, 77),
(9, 'Peito', 45, 88),
(10, 'Costas', 50, 99);

UPDATE treino SET tipo_treino = 'Lower Day' WHERE id_treino = 1;

SELECT *  FROM treino;

SELECT aluno.nome, treino.tipo_treino, treino.duracao_min
FROM treino
JOIN aluno
ON treino.id_aluno = aluno.id_aluno
WHERE aluno.nome = 'Matheus Duarte';

SELECT COUNT(*) AS total_treinos
FROM treino;

SELECT id_aluno, COUNT(*) AS total_treinos
FROM treino
GROUP BY id_aluno;

SELECT aluno.nome, treino.tipo_treino, treino.duracao_min
FROM treino
JOIN aluno
ON treino.id_aluno = aluno.id_aluno;








