-- ============================================
-- Projeto: Hospital Analytics
-- Autor: Pamela Brenda Queiroz
-- Descrição: Criação das tabelas
-- ============================================

USE HospitalAnalytics;
GO

-- ============================================
-- Tabela: Dim_Pacientes
-- ============================================
CREATE TABLE Dim_Pacientes (
    ID_Paciente INT PRIMARY KEY,
    Sexo CHAR(1) NOT NULL,
    Idade INT NOT NULL,
    Cidade VARCHAR(100) NOT NULL
);

-- ============================================
-- Tabela: Dim_Convenios
-- ============================================
CREATE TABLE Dim_Convenios (
    ID_Convenio INT PRIMARY KEY,
    Convenio VARCHAR(100) NOT NULL
);

-- ============================================
-- Tabela: Dim_Especialidades
-- ============================================
CREATE TABLE Dim_Especialidades (
    ID_Especialidade INT PRIMARY KEY,
    Especialidade VARCHAR(100) NOT NULL
);

-- ============================================
-- Tabela: Dim_Calendario
-- ============================================

CREATE TABLE Dim_Calendario (
    Data DATE PRIMARY KEY,
    Ano INT NOT NULL,
    Mes INT NOT NULL,
    Nome_Mes VARCHAR(20) NOT NULL
);

-- ============================================
-- Tabela: Fato_Internacoes
-- ============================================

CREATE TABLE Fato_Internacoes (

    ID_Internacao INT PRIMARY KEY,

    ID_Paciente INT NOT NULL,

    ID_Convenio INT NOT NULL,

    ID_Especialidade INT NOT NULL,

    Data_Internacao DATE NOT NULL,

    Dias_Internado INT NOT NULL,

    CONSTRAINT FK_Paciente
        FOREIGN KEY (ID_Paciente)
        REFERENCES Dim_Pacientes(ID_Paciente),

    CONSTRAINT FK_Convenio
        FOREIGN KEY (ID_Convenio)
        REFERENCES Dim_Convenios(ID_Convenio),

    CONSTRAINT FK_Especialidade
        FOREIGN KEY (ID_Especialidade)
        REFERENCES Dim_Especialidades(ID_Especialidade),

    CONSTRAINT FK_Calendario
        FOREIGN KEY (Data_Internacao)
        REFERENCES Dim_Calendario(Data)

);