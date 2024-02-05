
--Codigos SQL utilizados no trabalho pratico
--Luccas Vinicius Prudencio Aliani Santos Carneiro
--20.1.8015

	CREATE TABLE [Cidadao] (
	[CPF] nvarchar(450) NOT NULL,
	[Nome] nvarchar(max) NOT NULL,
	[Telefone] nvarchar(max) NULL,
	[Email] nvarchar(max) NULL,
	[Login] nvarchar(max) NOT NULL,
	[Senha] nvarchar(max) NOT NULL,
	[SecretKey] nvarchar(max) NOT NULL,
	[Endereco] nvarchar(max) NOT NULL,
	[DataNascimento] datetime2 NOT NULL,
	[Ativo] bit NOT NULL,
	CONSTRAINT [PK_Cidadao] PRIMARY KEY ([CPF])
	);
	  
	CREATE TABLE [Secretaria] (
	[Id] nvarchar(450) NOT NULL,
	[Nome] nvarchar(max) NOT NULL,
	CONSTRAINT [PK_Secretaria] PRIMARY KEY ([Id])
	);
	  
	CREATE TABLE [Admin] (
	[ID] nvarchar(450) NOT NULL,
	[Nome] nvarchar(max) NOT NULL,
	[Telefone] nvarchar(max) NOT NULL,
	[Email] nvarchar(max) NOT NULL,
	[Login] nvarchar(max) NOT NULL,
	[Senha] nvarchar(max) NOT NULL,
	[SecretKey] nvarchar(max) NOT NULL,
	[Endereco] nvarchar(max) NOT NULL,
	[DataNascimento] datetime2 NOT NULL,
	[SecretariaId] nvarchar(450) NULL,
	[Ativo] bit NOT NULL,
	CONSTRAINT [PK_Admin] PRIMARY KEY ([ID]),
	CONSTRAINT [FK_Admin_Secretaria_SecretariaId] FOREIGN KEY ([SecretariaId]) REFERENCES [Secretaria] ([Id])
	);
	  
	CREATE TABLE [Noticia] (
	[ID] nvarchar(450) NOT NULL,
	[ProprietarioID] nvarchar(450) NOT NULL,
	[Titulo] nvarchar(max) NOT NULL,
	[Texto] nvarchar(max) NOT NULL,
	[DataCriacao] datetime2 NOT NULL,
	[SecretariaId] nvarchar(450) NULL,
	CONSTRAINT [PK_Noticia] PRIMARY KEY ([ID]),
	CONSTRAINT [FK_Noticia_Admin_ProprietarioID] FOREIGN KEY ([ProprietarioID]) REFERENCES [Admin] ([ID]) ON DELETE CASCADE,
	CONSTRAINT [FK_Noticia_Secretaria_SecretariaId] FOREIGN KEY ([SecretariaId]) REFERENCES [Secretaria] ([Id])
	);
	  
	CREATE TABLE [Resposta] (
	[Protocolo] nvarchar(450) NOT NULL,
	[ID] nvarchar(450) NULL,
	[Texto] nvarchar(max) NOT NULL,
	[DataCriacao] datetime2 NOT NULL,
	CONSTRAINT [PK_Resposta] PRIMARY KEY ([Protocolo]),
	CONSTRAINT [FK_Resposta_Admin_ID] FOREIGN KEY ([ID]) REFERENCES [Admin] ([ID])
	);
	  
	CREATE TABLE [Manifestacao] (
	[Protocolo] nvarchar(450) NOT NULL,
	[ProprietarioCPF] nvarchar(450) NULL,
	[Titulo] nvarchar(max) NOT NULL,
	[Texto] nvarchar(max) NOT NULL,
	[DataCriacao] datetime2 NOT NULL,
	[SecretariaId] nvarchar(450) NULL,
	[DataResposta] datetime2 NULL,
	CONSTRAINT [PK_Manifestacao] PRIMARY KEY ([Protocolo]),
	CONSTRAINT [FK_Manifestacao_Cidadao_ProprietarioCPF] FOREIGN KEY ([ProprietarioCPF]) REFERENCES [Cidadao] ([CPF]),
	CONSTRAINT [FK_Manifestacao_Resposta_Protocolo] FOREIGN KEY ([Protocolo]) REFERENCES [Resposta] ([Protocolo]) ON DELETE CASCADE,
	CONSTRAINT [FK_Manifestacao_Secretaria_SecretariaId] FOREIGN KEY ([SecretariaId]) REFERENCES [Secretaria] ([Id])
	);

	INSERT INTO Cidadao ([CPF], [Nome], [Email], [Telefone], [Login], [Senha], [SecretKey], [Endereco], [DataNascimento], [Ativo]) VALUES 
	('324.667.240-73', 'Luccas Carneiro', 'luccas.carneiro@email.com', '555-0123', 'luccas', 'facil123', '','João Monlevade MG', '1990-10-10', 1),
	('659.013.460-09', 'Maria Silva', 'maria.silva@email.com', '555-1234', 'maria', 'facil123', '', 'Rua Flores, 123', '1985-08-25', 1),
	('576.819.220-40', 'José Santos', 'jose.santos@email.com', '555-5678', 'jose', 'facil123', '', 'Avenida Principal, 456', '1990-03-12', 1),
	('710.470.840-58', 'Ana Oliveira', 'ana.oliveira@email.com', '555-9876', 'ana', 'facil123', '', 'Praça Central, 789', '1982-11-30', 1),
	('157.967.650-27', 'Pedro Costa', 'pedro.costa@email.com', '555-4321', 'pedro', 'facil123', '','Alameda Secundária, 987', '1995-05-17', 1),
	('140.782.500-33', 'Carla Pereira', 'carla.pereira@email.com', '555-8765', 'carla', 'facil123', '', 'Travessa Escondida, 654', '1988-02-08', 1),
	('507.563.660-89', 'Rafael Lima', 'rafael.lima@email.com', '555-2345', 'rafael', 'facil123', '', 'Estrada Deserta, 321', '1993-09-02', 1),
	('028.809.930-32', 'Amanda Souza', 'amanda.souza@email.com', '555-7890', 'amanda', 'facil123', '', 'Camino Oculto, 876', '1980-07-14', 1),
	('743.678.750-08', 'Carlos Fernandes', 'lucas.fernandes@email.com', '555-3456', 'carlos', 'facil123', '', 'Viela Misteriosa, 543', '1998-06-23', 1),
	('359.461.860-94', 'Fernanda Rocha', 'fernanda.rocha@email.com', '555-0123', 'fernanda', 'facil123', '', 'Largo Desconhecido, 210', '1987-04-05', 1),
	('571.976.300-70', 'Susan Oliveira', 'susan.oliveira@email.com', '555-6789', 'susan', 'facil123', '', 'Passeio Deserto, 789', '1991-12-18', 1);


	INSERT INTO Admin ([ID], [Nome], [Email], [Telefone], [Login], [Senha], [SecretKey], [Endereco], [DataNascimento], [SecretariaId], [Ativo]) VALUES 
	('000', 'Luccas Carneiro', 'luccas.carneiro@email.com', '555-0123', 'luccas', 'facil123', '','João Monlevade MG', '1990-10-10', NULL,1),
	('111', 'Admin', 'Admin@email.com', '555-0123', 'Admin', 'Admin', '','João Monlevade MG', '1990-10-10', NULL, 1)

	INSERT INTO Secretaria ([Id], [Nome]) VALUES 
	('0', 'Prefeitura'),
	('1', 'Saúde'),
	('2', 'Segurança'),
	('3', 'Infraestrutura'),
	('4', 'Educação')

	INSERT INTO Noticia ([ID], [Titulo], [Texto], [ProprietarioID], [SecretariaId], [DataCriacao]) VALUES 
	('1', 'Noticia 2', 'Minha Segunda Noticia !', '000', '0', '2024-02-05')

	INSERT INTO Resposta([DataCriacao], [ID], [Protocolo], [Texto]) VALUES
	('2024-02-04', '000', '000', '')

	INSERT INTO Manifestacao([ProprietarioCPF], [Titulo], [Texto], [Protocolo], [SecretariaId], [DataCriacao]) VALUES 
	('324.667.240-73', 'Manifestação 1', 'Minha primeira Manifestação !', '000', '0', '2024-02-04')

	INSERT INTO Manifestacao([ProprietarioCPF], [Titulo], [Texto], [Protocolo], [SecretariaId], [DataCriacao]) VALUES 
	(null, 'Manifestação 2', 'Minha segunda Manifestação !', '001', null, '2024-02-04')

	INSERT INTO Manifestacao([ProprietarioCPF], [Titulo], [Texto], [Protocolo], [SecretariaId], [DataCriacao]) VALUES 
	(null, 'Manifestação 3', 'Minha terceira Manifestação !', '003', null, '2024-02-04')

	INSERT INTO Resposta([DataCriacao], [ID], [Protocolo], [Texto]) VALUES
	('2024-02-04', '000', '001', '')


	SELECT CPF, Nome, Email, Telefone FROM Cidadao
	WHERE Login = 'Luccas' AND Senha = 'facil123'


	select * from Admin

	select * from Cidadao

	select * from Secretaria 

	select * from Noticia ORDER BY DataCriacao DESC

	Select * from Manifestacao WHERE DataResposta IS NOT NULL

	SELECT * FROM Resposta

	select * from Admin
	where ID = '000'

	select * from Cidadao

	select * from Secretaria

	Select * from Noticia

	Select * from Manifestacao

	SELECT * FROM Resposta

	Delete from Manifestacao where Protocolo = '855424'

	Update Admin 
	Set SecretKey = '79c22475-66f9-4bd7-abac-2951082c15f4'
	where Id = '000'

	Update Admin 
	Set SecretKey = '8ae3c3d3-2c8e-45b3-abdf-cbb878e9fa64'
	where Id = '111'

	Update Resposta 
	Set Texto = 'Resolvido'
	where Protocolo = '000'

	UPDATE Admin
	SET 
		Nome = 'Novo Nome',
		Telefone = 'Novo Telefone',
		Email = 'Novo Email',
		Login = 'Novo Login',
		Senha = 'Nova Senha',
		SecretKey = '8ae3c3d3-2c8e-45b3-abdf-cbb878e9fa64',
		Endereco = 'Novo Endereco',
		DataNascimento = 'Nova DataNascimento',
		SecretariaId = 'Nova SecretariaId',
		Ativo = 'Novo Ativo'
	WHERE Id = '111';


	delete from Admin
	where id = '999'

	  SELECT * FROM Cidadao WHERE Cidadao.Senha = 'facil123' AND Cidadao.Login = 'luccas'

	INSERT INTO Admin ([ID], [Nome], [Email], [Telefone], [Login], [Senha], [SecretKey], [Endereco], [DataNascimento], [SecretariaId], [Ativo]) VALUES 
	('999', '999', '999', '999', '999', 'CwszEfYeg1MgomopIsU+HA==', '5b3038db-1b27-4aee-8e00-1eb8c6a74713', 'SYSTEM', 07/02/2024 18:32:00, NULL, 1)

	UPDATE Resposta SET Texto = '', DataCriacao = '' WHERE Protocolo = '001'

	select * from resposta