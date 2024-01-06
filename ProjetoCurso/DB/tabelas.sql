-- Assuming a user-defined type for handling the email data type
-- CREATE TYPE email AS (localpart varchar(64), domain varchar(255));

-- Table for Utente
CREATE TABLE projeto.Utente (
    UtenteID integer PRIMARY KEY,
    NomeUtente varchar(60) not null,
	DataNascimento date,
    emailUtente varchar(60),
	distritoUtente varchar(20),
	concelhoUtente varchar(20),
	cp_Utente varchar(8),
	rua varchar(60),
	NISS integer not null,
    NIF integer
);

-- Table for PedidoMedico
CREATE TABLE projeto.PedidoMedico (
    PedidoID integer PRIMARY KEY,
    UtenteIdentificacaoUtenteID integer REFERENCES projeto.Utente(UtenteID),
    Avaliacao integer,
    RelatorioClinico varchar(255),
    DataPedido date,
    DataResposta date,
    MedicoMedicoID integer -- This should reference Medico's primary key, not created in this snippet
);

-- Table for Medico
CREATE TABLE projeto.Medico (
    MedicoID integer PRIMARY KEY,
    NomeMedico varchar(100),
    Especialidade varchar(100)
);

-- Table for Medico_login
CREATE TABLE projeto.Medico_login (
    EMail varchar(64),
    Password varchar(16),
    MedicoMedicoID integer REFERENCES projeto.Medico(MedicoID) UNIQUE
);

-- Table for Estado
CREATE TABLE projeto.Estado (
    IDEstado integer PRIMARY KEY,
    Descritivo varchar(255)
);

-- Table for PedidoJunta
CREATE TABLE projeto.PedidoJunta (
    IDOrdemEntPedido integer PRIMARY KEY,
    DataPedido date,
    LocalidadePedido varchar(60),
    DataAgendamento date,
    termosECondicoesAssinado boolean,
    UtenteIdentificacaoUtenteID integer REFERENCES projeto.Utente(UtenteID)
    --PedidoMedicoID integer REFERENCES projeto.PedidoMedico(PedidoID)
);