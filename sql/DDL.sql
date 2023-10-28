-- Criacao: 25/10/2023
-- Autores: Luis Bruno
-- Descrição: Criação de tabelas (DDL)

BEGIN TRANSACTION;

CREATE TABLE Usuario (
    nomeUsuario VARCHAR NOT NULL,
    nome VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    senha VARCHAR NOT NULL,
	PRIMARY KEY (nomeUsuario)
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
	--FOREIGN KEY (idComidaFavorita) REFERENCES Consumivel (id),
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
    x INTEGER NOT NULL,
    y INTEGER NOT NULL,
    z INTEGER NOT NULL,
    vidaAtual SMALLINT NOT NULL,
    FOREIGN KEY (idNpc) REFERENCES Npc (id)
);

CREATE TABLE InstanciaPC (
    id SERIAL PRIMARY KEY,
    idPersonagemJogavel INTEGER NOT NULL,
    vidaAtual SMALLINT NOT NULL,
    fomeAtual SMALLINT NOT NULL,
    sanidadeAtual SMALLINT NOT NULL,
    modoFantasma BOOLEAN NOT NULL,
    x INTEGER NOT NULL,
    y INTEGER NOT NULL,
    z INTEGER NOT NULL,
    FOREIGN KEY (idPersonagemJogavel) REFERENCES PersonagemJogavel (id)
);

CREATE TABLE Alianca (
    id SERIAL PRIMARY KEY,
    idInstanciaPc INTEGER NOT NULL,
    idInstanciaNpc INTEGER NOT NULL,
    FOREIGN KEY (idInstanciaPc) REFERENCES InstanciaPC (id),
    FOREIGN KEY (idInstanciaNpc) REFERENCES InstanciaNpc (id)
);

COMMIT;
