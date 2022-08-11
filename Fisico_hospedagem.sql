/* Lógico_hospedagem: */

CREATE TABLE Cliente (
    endereco VARCHAR(50),
    telefone INTEGER,
    ID INTEGER PRIMARY KEY UNIQUE,
    PCD BOOLEAN,
    genero CHARACTER,
    lingua VARCHAR(10)
);

CREATE TABLE Cliente_pf (
    nome VARCHAR(50),
    cpf NUMERIC,
    ID_cliente INTEGER PRIMARY KEY UNIQUE,
    trabalho VARCHAR(30)
);

CREATE TABLE Cliente_pj (
    cnpj INTEGER,
    razao_social VARCHAR(50),
    ID_cliente INTEGER PRIMARY KEY UNIQUE,
    departamento VARCHAR(30)
);

CREATE TABLE Hospedagem (
    checkin DATE,
    checkout DATE,
    ID INTEGER PRIMARY KEY UNIQUE,
    ID_reserva INTEGER,
    ID_quarto INTEGER,
    ID_cliente INTEGER
);

CREATE TABLE reserva (
    ID INTEGER PRIMARY KEY UNIQUE,
    data_reserva DATE,
    data_entrada DATE,
    data_saida DATE,
    stats VARCHAR(10),
    ID_cliente INTEGER,
    ID_quarto INTEGER
);

CREATE TABLE quarto (
    ID INTEGER PRIMARY KEY UNIQUE,
    andar INTEGER,
    stats VARCHAR(10),
    numero INTEGER,
    ID_tipo_quarto INTEGER
);

CREATE TABLE tipo_quarto (
    ID INTEGER PRIMARY KEY UNIQUE,
    descricao VARCHAR(50),
    valor NUMERIC,
    capacidade INTEGER
);

CREATE TABLE servico (
    ID INTEGER PRIMARY KEY UNIQUE,
    descricao VARCHAR(50),
    valor NUMERIC
);

CREATE TABLE consome (
    ID_servico INTEGER,
    ID_quarto INTEGER,
    data_servico DATE
);
 
ALTER TABLE Cliente_pf ADD CONSTRAINT FK_Clientes_pf_2
    FOREIGN KEY (ID_cliente)
    REFERENCES Cliente (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cliente_pj ADD CONSTRAINT FK_Clientes_pj_1
    FOREIGN KEY (ID_cliente)
    REFERENCES Cliente (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Hospedagem ADD CONSTRAINT FK_Hospedagem_2
    FOREIGN KEY (ID_reserva)
    REFERENCES reserva (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Hospedagem ADD CONSTRAINT FK_Hospedagem_3
    FOREIGN KEY (ID_quarto)
    REFERENCES quarto (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Hospedagem ADD CONSTRAINT FK_Hospedagem_4
    FOREIGN KEY (ID_cliente)
    REFERENCES Cliente (ID)
    ON DELETE CASCADE;
 
ALTER TABLE reserva ADD CONSTRAINT FK_reserva_2
    FOREIGN KEY (ID_cliente)
    REFERENCES Cliente (ID)
    ON DELETE CASCADE;
 
ALTER TABLE reserva ADD CONSTRAINT FK_reserva_3
    FOREIGN KEY (ID_quarto)
    REFERENCES quarto (ID)
    ON DELETE CASCADE;
 
ALTER TABLE quarto ADD CONSTRAINT FK_quarto_2
    FOREIGN KEY (ID_tipo_quarto)
    REFERENCES tipo_quarto (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE consome ADD CONSTRAINT FK_consome_1
    FOREIGN KEY (ID_servico)
    REFERENCES servicos (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE consome ADD CONSTRAINT FK_consome_2
    FOREIGN KEY (ID_quarto)
    REFERENCES quarto (ID)
    ON DELETE SET NULL;

/*inserções de dados*/
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('180 Old Gate Road', '22694153', 1, false, 'F', 'Persian');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('43 Forest Dale Way', '27589817', 2, false, 'F', 'Kazakh');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('4 Loomis Center', '96521211', 3, true, 'F', 'English');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('09063 Kennedy Alley', '72981130', 4, true, 'M', 'Gaelic');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('9046 Melody Circle', '40796650', 5, false, 'F', 'Portuguese');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('6 Moulton Center', '94683805', 6, false, 'M', 'Fijian');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('02 Dennis Plaza', '19112487', 7, false, 'M', 'Guaraní');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('24240 Karstens Center', '42465926', 8, false, 'M', 'Tetum');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('86 4th Place', '95263821', 9, false, 'F', 'Mongolian');
insert into cliente (endereco, telefone, ID, PCD, genero, lingua) values ('7 Mandrake Trail', '52743334', 10, true, 'F', 'Greek');

insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Liza Skentelbery', '54044736', 1, 'Staff Accountant IV');
insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Joseph Ronci', '14070531', 2, 'Senior Quality Engineer');
insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Ruggiero Grunson', '75100651', 5, 'Computer Systems Analyst III');
insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Perkin Peris', '6194180215', 7, 'Teacher');
insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Wynn McGiveen', '88267958', 8, 'Office Assistant I');
insert into cliente_pf (nome, cpf, ID_cliente, trabalho) values ('Opalina Downey', '16382395', 9, 'Director of Sales');

insert into cliente_pj (cnpj, razao_social, ID_cliente, departamento) values ('30885479', 'Wordpedia', 3, 'Legal');
insert into cliente_pj (cnpj, razao_social, ID_cliente, departamento) values ('52626518', 'Rhyloo', 4, 'Support');
insert into cliente_pj (cnpj, razao_social, ID_cliente, departamento) values ('78676131', 'Eadel', 6, 'Research and Development');
insert into cliente_pj (cnpj, razao_social, ID_cliente, departamento) values ('11723354', 'Livepath', 10, 'Product Management');

insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-08-03', '2021-12-19', 1, 1, 14, 3);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-12-18', '2022-03-11', 2, 4, 9, 6);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2022-01-12', '2022-02-28', 3, null, 6, 1);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-07-23', '2021-10-26', 4, 5, 4, 7);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-11-28', '2021-12-23', 5, null, 20, 1);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-08-21', '2021-09-05', 6, 8, 6, 3);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2021-09-06', '2022-01-28', 7, 10, 13, 5);
insert into hospedagem (checkin, checkout, ID, ID_reserva, ID_quarto, ID_cliente) values ('2022-02-09', '2022-05-31', 8, 13, 7, 8);

insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (1, 1, 'Green', '101', 4);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (2, 1, 'Red', '102', 1);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (3, 1, 'Green', '103', 1);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (4, 1, 'Green', '104', 5);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (5, 1, 'Green', '105', 4);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (6, 2, 'Green', '201', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (7, 2, 'Green', '202', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (8, 2, 'Green', '203', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (9, 2, 'Red', '204', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (10, 2, 'Green', '205', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (11, 3, 'Green', '301', 3);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (12, 3, 'Red', '302', 4);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (13, 3, 'Red', '303', 4);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (14, 3, 'Red', '304', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (15, 3, 'Green', '305', 1);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (16, 4, 'Green', '401', 2);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (17, 4, 'Green', '402', 4);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (18, 4, 'Green', '403', 5);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (19, 4, 'Red', '404', 1);
insert into quarto (ID, andar, stats, numero, ID_tipo_quarto) values (20, 4, 'Green', '405', 1);

insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (1, '2021-11-12', '2021-08-03', '2021-12-19', 'Confirmada', 3, 2);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (2, '2021-02-25', '2022-04-15', '2022-06-10', 'Cancelada', 3, 2);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (3, '2021-02-15', '2022-10-10', '2023-05-17', 'Em espera', 5, 20);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (4, '2021-08-11', '2021-12-18', '2022-03-11', 'Confirmada', 6, 18);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (5, '2021-08-10', '2021-07-23', '2021-10-26', 'Confirmada', 7, 5);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (6, '2021-12-17', '2022-09-13', '2022-12-15', 'Em espera', 5, 9);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (7, '2022-03-26', '2022-01-11', '2022-02-08', 'Cancelada', 4, 7);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (8, '2021-03-23', '2021-08-21', '2021-09-04', 'Confirmada', 3, 6);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (9, '2021-01-28', '2022-11-02', '2022-12-28', 'Em espera', 9, 14);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (10, '2022-05-21', '2021-09-06', '2022-01-28', 'Confirmada', 5, 10);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (11, '2022-03-10', '2021-08-25', '2021-10-22', 'Cancelada', 5, 7);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (12, '2022-06-12', '2022-01-09', '2021-11-19', 'Cancelada', 1, 7);
insert into reserva (ID, data_reserva, data_entrada, data_saida, stats, ID_cliente, ID_quarto) values (13, '2022-03-06', '2022-02-09', '2022-05-31', 'Confirmada', 8, 8);

insert into servico (ID, descricao, valor) values (1, 'serviço de quarto', 22);
insert into servico (ID, descricao, valor) values (2, 'spa', 32);
insert into servico (ID, descricao, valor) values (3, 'banho de lama', 73);
insert into servico (ID, descricao, valor) values (4, 'shiatsu', 75);
insert into servico (ID, descricao, valor) values (5, 'café da manhã', 27);
insert into servico (ID, descricao, valor) values (6, 'lavanderia', 30);
insert into servico (ID, descricao, valor) values (7, 'jantar', 39);
insert into servico (ID, descricao, valor) values (8, 'jantar delux', 81);
insert into servico (ID, descricao, valor) values (9, 'café da manhã delux', 73);
insert into servico (ID, descricao, valor) values (10, 'tapioca de presunto', 7);

insert into tipo_quarto (ID, descricao, valor, capacidade) values (1, 'standard', 80, 2);
insert into tipo_quarto (ID, descricao, valor, capacidade) values (2, 'suite', 120, 2);
insert into tipo_quarto (ID, descricao, valor, capacidade) values (3, 'standard G', 160, 6);
insert into tipo_quarto (ID, descricao, valor, capacidade) values (4, 'suite G', 260, 4);
insert into tipo_quarto (ID, descricao, valor, capacidade) values (5, 'suite presidencial Hinode', 500, 4);

insert into consome (ID_servico, ID_quarto, data_servico) values (1, 6, '2021-10-08');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 20, '2021-09-23');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 9, '2021-11-22');
insert into consome (ID_servico, ID_quarto, data_servico) values (1, 13, '2021-12-17');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 7, '2021-08-30');
insert into consome (ID_servico, ID_quarto, data_servico) values (1, 9, '2021-10-16');
insert into consome (ID_servico, ID_quarto, data_servico) values (5, 13, '2021-09-14');
insert into consome (ID_servico, ID_quarto, data_servico) values (6, 4, '2022-01-09');
insert into consome (ID_servico, ID_quarto, data_servico) values (6, 13, '2022-05-22');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 4, '2022-02-17');
insert into consome (ID_servico, ID_quarto, data_servico) values (6, 13, '2021-11-25');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 6, '2022-04-12');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 14, '2021-12-01');
insert into consome (ID_servico, ID_quarto, data_servico) values (7, 7, '2022-01-12');
insert into consome (ID_servico, ID_quarto, data_servico) values (2, 6, '2022-05-23');
insert into consome (ID_servico, ID_quarto, data_servico) values (8, 13, '2021-08-28');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 9, '2022-03-08');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 4, '2021-11-01');
insert into consome (ID_servico, ID_quarto, data_servico) values (7, 20, '2022-05-25');
insert into consome (ID_servico, ID_quarto, data_servico) values (5, 14, '2021-10-21');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 13, '2022-01-20');
insert into consome (ID_servico, ID_quarto, data_servico) values (7, 6, '2021-10-19');
insert into consome (ID_servico, ID_quarto, data_servico) values (2, 9, '2022-02-13');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 7, '2021-12-07');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 7, '2021-12-15');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 20, '2021-10-04');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 14, '2021-09-18');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 13, '2022-05-01');
insert into consome (ID_servico, ID_quarto, data_servico) values (2, 7, '2022-01-22');
insert into consome (ID_servico, ID_quarto, data_servico) values (2, 13, '2021-09-15');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 7, '2022-05-28');
insert into consome (ID_servico, ID_quarto, data_servico) values (10, 6, '2021-12-26');
insert into consome (ID_servico, ID_quarto, data_servico) values (5, 6, '2022-03-18');
insert into consome (ID_servico, ID_quarto, data_servico) values (5, 6, '2022-01-03');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 4, '2022-05-23');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 20, '2022-03-30');
insert into consome (ID_servico, ID_quarto, data_servico) values (8, 6, '2021-10-27');
insert into consome (ID_servico, ID_quarto, data_servico) values (3, 4, '2022-01-15');
insert into consome (ID_servico, ID_quarto, data_servico) values (8, 13, '2021-09-11');
insert into consome (ID_servico, ID_quarto, data_servico) values (4, 6, '2021-09-20');

    
/*Consultas*/

/* a) pelo menos uma seleção de dados para exibir todos os registros de uma tabela usando como ordenação um atributo textual em ordem decrescente; */

# valor total que cada pessoa físisca gastou em serviços da hospedagem 
SELECT b.nome, sum(a.valor) AS total 
FROM servico a, cliente_pf b, consome c, quarto d, hospedagem e, cliente f
WHERE a.ID = c.ID_servico
AND c.ID_quarto = d.ID
AND d.ID = e.ID_quarto
AND e.ID_cliente = f.ID
AND f.ID = b.ID_cliente group by b.nome DESC;

# valores individuais de todos os serviços que cada cliente consumiu e sua data de consumo
SELECT b.nome, a.valor, a.descricao, c.data_servico 
FROM servico a, cliente_pf b, consome c, quarto d, hospedagem e, cliente f
WHERE a.ID = c.ID_servico
AND c.ID_quarto = d.ID
AND d.ID = e.ID_quarto
AND e.ID_cliente = f.ID
AND f.ID = b.ID_cliente
AND b.nome = 'Wynn McGiveen';

/* b) pelo menos uma seleção que apresente uma função de agregação (count, sum, max, min, avg); */

# numero de suites que cada cliente pessoa juridica se hospedou
SELECT a.razao_social, count(b.descricao) AS 'numero de suites'
FROM cliente_pj a, tipo_quarto b, quarto c, hospedagem d, cliente e
WHERE b.ID = c.ID_tipo_quarto
AND c.ID = d.ID_quarto
AND d.ID_cliente = e.ID
AND e.ID = a.ID_cliente
AND b.descricao = 'suite' group by a.razao_social;

/* c) pelo menos uma seleção que apresenta dados de duas tabelas (pode escolher quais atributos de cada uma delas) com relacionamento 1 para N, ou seja, deve haver correspondência entre uma chave estrangeira
 de uma tabela e a chave primária de outra; */

# seleciona os status das reservas feitas por cada cliente
SELECT a.ID, b.stats, b.ID_cliente
FROM cliente a, reserva b
WHERE a.ID = b.ID_cliente;

# seleciona o numero de reservas "confirmadas" por cada cliente
SELECT a.ID AS 'cliente', count(a.ID) AS 'n° de confirmações', b.stats
FROM cliente a, reserva b
WHERE a.ID = b.ID_cliente AND b.stats = 'Confirmada' group by a.ID;

/* d) pelo menos uma seleção que apresente o uso de operadores de BETWEEN ou IN nos critérios; */

# seleciona a descrição e o valor dos serviços com valor entre 20 e 40
SELECT descricao, valor 
FROM servico
WHERE valor BETWEEN 20 AND 40;

# seleciona todos de servicos em ordem de valor crescente
SELECT * FROM servico ORDER BY valor ASC;

/* e) pelo menos uma seleção que use cláusulas de junção (INNER JOIN ou LEFT JOIN ou RIGHT JOIN); */

# seleciona as hospedagens que estão em reservas 
SELECT a.ID AS ID_hospedagem, b.ID AS ID_reserva, b.stats AS 'status reserva'
FROM hospedagem a INNER JOIN reserva b 
ON a.ID_reserva = b.ID;

# seleciona todas as hospedagens feitas
SELECT * FROM hospedagem;

# seleciona todas as reservas feitas
SELECT * FROM reserva;

/* f) pelo menos uma View que contenha uma estrutura de seleção envolvendo no mínimo duas tabelas. */
CREATE VIEW consultar_reserva AS
	SELECT a.nome, c.stats, d.numero
    FROM cliente_pf a, cliente b, reserva c, quarto d
    WHERE a.ID_cliente = b.ID
    AND b.ID = c.ID_cliente
    AND c.ID_quarto = d.ID;
    
select * from consultar_reserva;