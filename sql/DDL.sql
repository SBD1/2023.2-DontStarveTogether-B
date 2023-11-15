-- Criacao: 25/10/2023
-- Autores: Luis Bruno
-- Descrição: Criação de tabelas (DDL)
-- Atualizações: 
-- 		- Criação de todas as tabelas atualizadas de acordo com o MRel.

BEGIN TRANSACTION;

DROP TYPE IF EXISTS "Estacao";
DROP TYPE IF EXISTS "TipoNpc";

CREATE TABLE Usuario (
    nomeUsuario VARCHAR NOT NULL,
    nome VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    senha VARCHAR NOT NULL,
	PRIMARY KEY (nomeUsuario)
);

CREATE TABLE TipoMundo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR NOT NULL,
    quantidadeBiomas INTEGER NOT NULL
);

CREATE TYPE "Estacao" AS ENUM ('Autumn', 'Winter', 'Spring', 'Summer');

CREATE TABLE Mundo (
    id SERIAL PRIMARY KEY,
    idUsuario VARCHAR NOT NULL,
    tipo INTEGER NOT NULL,
    nome VARCHAR NOT NULL,
    estacao "Estacao" DEFAULT 'Autumn' NOT NULL,
    temEstrada BOOLEAN NOT NULL,
    diaAtual INTEGER NOT NULL DEFAULT(0),
    FOREIGN KEY (idUsuario) REFERENCES Usuario (nomeUsuario),
    FOREIGN KEY (tipo) REFERENCES TipoMundo (id)
);

CREATE TABLE Bioma (
    id SERIAL PRIMARY KEY,
    nome VARCHAR NOT NULL,
    descricao VARCHAR NOT NULL
);

CREATE TABLE BiomaMundo (
    idMundo INTEGER NOT NULL,
    idBioma INTEGER NOT NULL,
    PRIMARY KEY (idMundo, idBioma),
    FOREIGN KEY (idMundo) REFERENCES Mundo (id),
    FOREIGN KEY (idBioma) REFERENCES Bioma (id)
);

CREATE TABLE Personagem (
    id SERIAL PRIMARY KEY,
    nome VARCHAR NOT NULL,
    descricao VARCHAR NOT NULL,
    vida SMALLINT NOT NULL
);

CREATE TABLE PersonagemJogavel (
    id SERIAL PRIMARY KEY,
    idComidaFavorita INTEGER NOT NULL,
    idPersonagem INTEGER NOT NULL,
    sanidade SMALLINT NOT NULL,
    fome SMALLINT NOT NULL,
	-- FOREIGN KEY (idComidaFavorita) REFERENCES Consumivel (id),
	FOREIGN KEY (idPersonagem) REFERENCES Personagem (id)
);

CREATE TABLE PersonagemUsuario (
	id SERIAL PRIMARY KEY,
	nomeUsuario VARCHAR NOT NULL,
	idPersonagemJogavel INTEGER NOT NULL,
	FOREIGN KEY (nomeUsuario) REFERENCES Usuario (nomeUsuario),
	FOREIGN KEY (idPersonagemJogavel) REFERENCES PersonagemJogavel (id)
);

CREATE TYPE "TipoNpc" AS ENUM ('N', 'P', 'H'); -- Neutro, Passivo, Hostil

CREATE TABLE Npc (
	id SERIAL PRIMARY KEY,
	idPersonagem INTEGER NOT NULL,
	tipoNpc "TipoNpc" NOT NULL,
	eBoss BOOLEAN NOT NULL,
	FOREIGN KEY (idPersonagem) REFERENCES Personagem (id)
);

CREATE TABLE Dialogo (
	id SERIAL PRIMARY KEY,
	textoFala VARCHAR NOT NULL,
	dialogoVinculo INTEGER
);

ALTER TABLE Dialogo
ADD CONSTRAINT fk_dialogo_vinculo
FOREIGN KEY (dialogoVinculo) REFERENCES Dialogo (id);

CREATE TABLE DialogoPersonagem (
    id SERIAL PRIMARY KEY,
    idPersonagem INTEGER NOT NULL,
    idDialogo INTEGER NOT NULL,
    FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
    FOREIGN KEY (idDialogo) REFERENCES Dialogo (id)
);

CREATE TABLE InstanciaNpc (
    id SERIAL PRIMARY KEY,
    idNpc INTEGER NOT NULL,
	idMundo INTEGER NOT NULL,
    idBioma INTEGER NOT NULL,
    vidaAtual SMALLINT NOT NULL,
    FOREIGN KEY (idNpc) REFERENCES Npc (id),
	FOREIGN KEY (idMundo, idBioma) REFERENCES BiomaMundo (idMundo, idBioma)
);

CREATE TABLE InstanciaPC (
    id SERIAL PRIMARY KEY,
    idPersonagemJogavel INTEGER NOT NULL,
	  idMundo INTEGER NOT NULL,
    vidaAtual SMALLINT NOT NULL,
    fomeAtual SMALLINT NOT NULL,
    sanidadeAtual SMALLINT NOT NULL,
    modoFantasma BOOLEAN NOT NULL,
		tamanhoInventario SMALLINT NOT NULL DEFAULT(10),
    x INTEGER NOT NULL,
    y INTEGER NOT NULL,
    z INTEGER NOT NULL,
    FOREIGN KEY (idPersonagemJogavel) REFERENCES PersonagemJogavel (id),
	FOREIGN KEY (idMundo) REFERENCES Mundo (id)
);

CREATE TABLE Alianca (
    id SERIAL PRIMARY KEY,
    idInstanciaPc INTEGER NOT NULL UNIQUE,
    idInstanciaNpc INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (idInstanciaPc) REFERENCES InstanciaPC (id),
    FOREIGN KEY (idInstanciaNpc) REFERENCES InstanciaNpc (id)
);

CREATE TABLE Item (
    id SERIAL PRIMARY KEY,
    referenciaItem INTEGER,
    itemReceita INTEGER,
    nome VARCHAR NOT NULL,
    descricao VARCHAR NOT NULL,
    FOREIGN KEY (referenciaItem) REFERENCES Item (id),
    FOREIGN KEY (itemReceita) REFERENCES Item (id)
);

CREATE TABLE Habilidade (
    id SERIAL PRIMARY KEY,
    idHabPreReq INTEGER,
    idItemGerado INTEGER,
    nome VARCHAR NOT NULL,
    descricao VARCHAR NOT NULL,
    eOfensiva BOOLEAN NOT NULL,
    dano INTEGER,
    casting NUMERIC NOT NULL,
    FOREIGN KEY (idHabPreReq) REFERENCES Habilidade (id),
    FOREIGN KEY (idItemGerado) REFERENCES Item (id)
);

CREATE TABLE Receita (
    itemReceita INTEGER PRIMARY KEY,
    item1 INTEGER,
    item2 INTEGER,
    item3 INTEGER,
    quantidade1 SMALLINT,
    quantidade2 SMALLINT,
    quantidade3 SMALLINT,
    FOREIGN KEY (itemReceita) REFERENCES Item (id),
    FOREIGN KEY (item1) REFERENCES Item (id),
    FOREIGN KEY (item2) REFERENCES Item (id),
    FOREIGN KEY (item3) REFERENCES Item (id)
);

CREATE TABLE Equipamento (
    id SERIAL PRIMARY KEY,
    idItem INTEGER NOT NULL,
    parteCorpo SMALLINT NOT NULL,
    durabilidade SMALLINT NOT NULL,
    protecao INTEGER NOT NULL,
    FOREIGN KEY (idItem) REFERENCES Item (id)
);

CREATE TABLE EquipamentoPersonagem (
    id SERIAL PRIMARY KEY,
    idInstanciaPc INTEGER NOT NULL,
    idEquipamento INTEGER NOT NULL,
	  durabilidadeAtual SMALLINT NOT NULL,
    FOREIGN KEY (idInstanciaPc) REFERENCES InstanciaPC (id),
    FOREIGN KEY (idEquipamento) REFERENCES Equipamento (id)
);

CREATE TABLE Consumivel (
    id SERIAL PRIMARY KEY,
    idItem INTEGER NOT NULL,
    vida SMALLINT,
    sanidade SMALLINT,
    fome SMALLINT,
    tempoApodrecimento SMALLINT,
    FOREIGN KEY (idItem) REFERENCES Item (id)
);

CREATE TABLE Colocavel (
    id SERIAL PRIMARY KEY,
    idItem INTEGER NOT NULL,
    tamanho SMALLINT NOT NULL,
    temColisao BOOLEAN NOT NULL DEFAULT(true),
    durabilidade SMALLINT,
    eEstacaoCraft BOOLEAN NOT NULL DEFAULT(false),
    FOREIGN KEY (idItem) REFERENCES Item (id)
);

CREATE TABLE InstanciaColocavel (
	id SERIAL PRIMARY KEY,
	idColocavel INTEGER NOT NULL,
	idMundo INTEGER NOT NULL,
	x INTEGER NOT NULL,
	y INTEGER NOT NULL,
	z INTEGER NOT NULL,
	durabilidadeAtual SMALLINT NOT NULL,
	FOREIGN KEY (idColocavel) REFERENCES Colocavel (id),
	FOREIGN KEY (idMundo) REFERENCES Mundo (id)
);

CREATE TABLE Inventario (
    idItem INTEGER NOT NULL,
    idInstanciaPc INTEGER NOT NULL,
    quantidade SMALLINT NOT NULL,
    PRIMARY KEY (idItem, idInstanciaPc),
    FOREIGN KEY (idItem) REFERENCES Item (id),
    FOREIGN KEY (idInstanciaPc) REFERENCES InstanciaPC (id)
);


COMMIT;
