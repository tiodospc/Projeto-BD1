create DATABASE cinemow;

\c cinemow;




CREATE TABLE  usuario  (
	 ID_usuario  varchar NOT NULL,
	 Nome  varchar(255) NOT NULL,
	 Email   varchar NOT NULL,
	 Telefone   varchar(255) NOT NULL,
	CONSTRAINT  usuario_pk  PRIMARY KEY ( ID_usuario )
);


CREATE TABLE  Colunistas  (
	 ID_colunista  varchar(255) NOT NULL,
	 Nome  TEXT NOT NULL,
	 Email  varchar(255) NOT NULL,
	CONSTRAINT  Colunistas_pk  PRIMARY KEY ( ID_colunista )
);

CREATE TABLE  Promocao  (
	 ID_promo  varchar(255) NOT NULL,
	 Valor  FLOAT NOT NULL,
	 Data_fim   varchar NOT NULL,
	 Nome  TEXT NOT NULL,
	 Data_inicio   varchar NOT NULL,
	CONSTRAINT  Promocao_pk  PRIMARY KEY ( ID_promo )
);

CREATE TABLE  Portal  (
	 URL  TEXT NOT NULL,
	 Nome  TEXT NOT NULL,
	 FK_usuario  varchar(255) NOT NULL,
	 FK_colunistas  varchar(255) NOT NULL,
	 FK_promo  varchar(255) NOT NULL,
	CONSTRAINT  Portal_pk  PRIMARY KEY ( URL ),
	constraint FK_ID_usuario foreign key (FK_usuario) references usuario (ID_usuario),
    constraint FK_ID_colunistas foreign key (FK_colunistas) references Colunistas (ID_colunista),
	constraint FK_ID_promocao foreign key (FK_promo) references Promocao (ID_promo)
);


CREATE TABLE  Categorias  (
	 ID_Categorias varchar(255) NOT NULL,
	 Nome  TEXT NOT NULL,
	 Data_lancamento   varchar NOT NULL,
	 elenco  TEXT NOT NULL,
	 Avalicoes  TEXT NOT NULL,
	CONSTRAINT  Categorias_pk  PRIMARY KEY (ID_Categorias)
);

CREATE TABLE  Posta  (
	 FK_URL   varchar NOT NULL,
	 FK_ID  varchar(255) NOT NULL,
	constraint FK_URL_Portal foreign key (FK_URL) references Portal (URL),
	constraint FK_ID_Categorias foreign key (FK_ID) references Categorias (ID_Categorias)
);

CREATE TABLE  TV  (
	 Apresentador  TEXT NOT NULL,
	 FK_ID  varchar(255) NOT NULL,
	CONSTRAINT  TV_pk  PRIMARY KEY ( FK_ID ), 
	constraint FK_ID_Categorias foreign key (FK_ID) references Categorias (ID_Categorias)
);



CREATE TABLE  lista_fav  (
	 FK_usuario  varchar(255) NOT NULL,
	 FK_ID  varchar(255) NOT NULL,
	 CONSTRAINT  lista_fav_pk  PRIMARY KEY (FK_ID),
	 constraint FK_ID_usuario foreign key (FK_usuario) references usuario (ID_usuario),
	 constraint FK_ID_Categorias foreign key (FK_ID) references Categorias (ID_Categorias)
);



CREATE TABLE  Noticias  (
	 ID_noticias   varchar(255) NOT NULL,
	 Data_postagem   varchar(255) NOT NULL,
	CONSTRAINT  Noticias_pk  PRIMARY KEY ( ID_noticias )
);

CREATE TABLE  Publica  (
	 FK_colunista  varchar(255) NOT NULL,
	 CONSTRAINT  Publica_pk  PRIMARY KEY ( FK_colunista ),
	 constraint FK_ID_colunistas foreign key (FK_colunista) references Colunistas (ID_colunista)

);

insert into usuario(ID_usuario, Nome, Email, Telefone)
	values('D20','Larissa Alves', 'larissa@gmail.com', '58213926'),
		  ('D21','Thiago Henrique', 'thiago@gmail.com', '0987423545'),
		  ('D22','Isabela da Campo', 'isabela@gmail.com', '949894154647'),
		  ('D23','Alessandra Pedrotti', 'alessandra@gmail.com', '476532152'),
		  ('D24','Maria Eduarda', 'maria@gmail.com', '475869341');

insert into Promocao(ID_promo, Valor, Data_fim, Nome, Data_inicio)
		values('P20','60', '30/05/2019', 'Camiseta Batman', '10/05/2019'),
			  ('P21','10', '01/08/2019', 'Xicara do portal', '30/07/2019'),
			  ('P22','70', '05/07/2019', 'Poster vingadores', '23/06/2019'),
			  ('P23','50', '15/10/2019', 'Boneco superman', '21/08/2019'),
			  ('P24','30', '10/01/2019', 'Pulseira Mulher-maravilha', '10/06/2019');

insert into Colunistas(ID_colunista, Nome, Email)
		values('C20', 'Romeo santos', 'romeo@gmail.com'),
			  ('C21', 'Samara coltinho', 'samara@gmail.com'),
              ('C22', 'Andreia ferreira', 'andreia@gmail.com'),
              ('C23', 'Aline del rey', 'aline@gmail.com'),
              ('C24', 'André pereira', 'andre@gmail.com');

insert into Categorias(ID_Categorias, Nome, Data_lancamento, elenco, Avalicoes)
		values('F20', 'Batman: O Cavaleiro das Trevas Ressurge', '27/07/2012 ', 'Tom Hardy, Christian Bale', '4.6 estrelas'),
			  ('F21', 'Dark', '11/12/2017 ', 'Louis Hoffmann, Lisa Vicari', '3.6 estrelas'),
			  ('F22', 'Black Mirror', '04/12/2011', 'Bryce Dallas Howard, Cristin Milioti', '4.8 estrelas'),
		      ('F23', 'Progama do GUGU', '04/04/2005', ' ', '2.6 estrelas'),
		      ('F24', 'JAWS', '25/12/1975', 'Roy Scheider, Richard Dreyfuss', '4.5 estrelas');


insert into Portal(URL, Nome, FK_usuario, FK_colunistas, FK_promo)
		values('cinemow.com.br', 'cinemow', 'D21','C20', 'P20');

insert into Posta(FK_URL, FK_ID)
		values('cinemow.com.br', 'F20');

insert into TV(Apresentador, FK_ID)
		values('Gugu liberato', 'F23');

insert into lista_fav(FK_usuario, FK_ID)
		values('D20','F21'),
			  ('D21','F22'),
			  ('D22','F23'),
			  ('D23','F20'),
			  ('D24','F24');

insert into Noticias(ID_noticias, Data_postagem)
		values('N20', '03/01/2019'),
			  ('N21', '13/04/2019'),
			  ('N22', '14/06/2019'),
			  ('N23', '12/01/2019'),
			  ('N24', '25/03/2019');

insert into Publica(FK_colunista)
			values('C20');
