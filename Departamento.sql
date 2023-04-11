	CREATE TABLE Departamento (
	id int PRIMARY KEY NOT NULL,
	nome VARCHAR(50) NOT NULL,
	ativo VARCHAR(3) NOT NULL
	);	

	CREATE TABLE controle_colab (
	ID int PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CPF VARCHAR(20) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Data_Admissao DATE NOT NULL,
	Departamento VARCHAR (50) NOT NULL
	);
	
	CREATE TABLE controle_EPI (
	ID int PRIMARY KEY NOT NULL,
	Descricao VARCHAR (50) NOT NULL,
	Data_Fabricacao DATE NOT NULL,
	Data_Vencimento DATE NOT NULL
	);
	
	CREATE TABLE entrega_EPI (
	ID int PRIMARY KEY NOT NULL,
	Data_Entrega DATE NOT NULL,
	ID_colaborador int NOT NULL,
	ID_EPI int NOT NULL	
	);
	
	INSERT INTO Departamento (ID,Nome,Ativo)	
	VALUES 
	(01, 'Financeiro', 'S'),
	(02, 'Gestao', 'S'),
	(03, 'Vendas', 'S'),
	(04, 'Estoque', 'S'),
	(05, 'Limpeza', 'S'),
	(06, 'Tecnico', 'S');
	
	SELECT * FROM Departamento 
	
	INSERT INTO controle_colab (id, nome, cpf, data_nascimento, data_admissao, departamento)
	VALUES 
	('10', 'Joao Silva', '111.111.111-11', '01/01/1990', '10/02/2012', 'Financeiro'),
	('25', 'Maria Santos', '222.222.222-22', '15/05/1992', '22/07/2020', 'Gestao'),
	('106', 'Pedro Almeida', '333.333.333-33', '20/07/1995', '30/01/2022', 'Financeiro'),
	('96', 'Lucas Lima', '444.444.444-44', '10/10/1988', '01/02/2023', 'Vendas'),
	('537', 'Carla Souza', '555.555.555-55', '28/02/1991', '09/12/2018', 'Gestao'),
	('101', 'Adrian Lucas', '777.777.777-77', '25/11/1985', '27/05/2013', 'Vendas'),
	('150', 'Matheus Rodriguez', '888.888.888-88', '11/10/1976', '15/10/2018', 'Estoque'),
	('93', 'Felipe Talini', '999.999.999-99', '31/01/1999', '10/03/2023', 'Limpeza'),
	('191', 'Alan Ribeiro', '121.121.121-12', '26/06/1985', '07/01/2020', 'Estoque'),
	('293', 'Willian Santos', '434.434.434-43', '14/02/2002', '14/08/2019', 'Tecnico'),
	('531', 'Felipe Alves', '656.656.656-65', '02/09/1983', '09/12/2019', 'Tecnico'),
	('731', 'Gustavo Teixeira', '878.878.878-87', '22/05/1997', '16/08/2026', 'Limpeza');
	
	SELECT * FROM controle_colab
	
	INSERT INTO controle_epi (ID,Descricao,Data_Fabricacao,Data_Vencimento)
	VALUES
	(3333, 'Bota', '10/12/2022', '12/04/2025'),
	(4444, 'Calca', '01/07/2010', '17/02/2016'),
	(5555, 'Luva', '12/10/2018', '19/12/2025'),
	(6666, 'Capacete', '12/01/2008', '10/10/2012'),
	(7777, 'Mochila', '27/09/2015', '26/01/2019'),
	(8888, 'Mascara', '01/05/2022', '09/12/2030'),
	(9999, 'Cinto', '21/05/2020', '24/06/2023'),
	(1111, 'Meia', '15/06/2015', '23/07/2022'),
	(0000, 'Casaco', '31/12/2022', '19/08/2031'),
	(2222, 'Touca', '29/06/2021', '02/10/2031');
	
	SELECT * FROM controle_epi
	
	INSERT INTO entrega_EPI (ID, Data_Entrega, ID_colaborador, ID_EPI)
	VALUES
	(1010, '10/01/2022', 25, 3333),
	(1212, '01/08/2010', 106, 4444),
	(1313, '12/11/2018', 96, 5555),
	(1414, '12/02/2008', 537, 6666),
	(1515, '27/10/2015', 101, 7777),
	(1616, '01/06/2022', 150, 8888),
	(1717, '15/07/2015', 93, 1111),
	(1818, '31/01/2023', 191, 0000);

	
	SELECT * FROM Departamento where id = 3
	
	SELECT * FROM controle_colab WHERE ID NOT IN( SELECT ID_colaborador FROM entrega_EPI)
	
	
	