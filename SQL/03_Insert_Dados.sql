-- ============================================
-- Projeto: Hospital Analytics
-- Autor: Pamela Brenda Queiroz
-- Descrição: Inserção dos dados dimensionais
-- ============================================

USE HospitalAnalytics;
GO


-- ============================================
-- Inserindo dados: Dim_Convenios
-- ============================================

INSERT INTO Dim_Convenios (ID_Convenio, Convenio)
VALUES
(1, 'SUS'),
(2, 'Bradesco Saúde'),
(3, 'Amil'),
(4, 'SulAmérica'),
(5, 'NotreDame Intermédica'),
(6, 'Porto Seguro Saúde');


-- ============================================
-- Inserindo dados: Dim_Especialidades
-- ============================================

INSERT INTO Dim_Especialidades (ID_Especialidade, Especialidade)
VALUES
(1, 'Cardiologia'),
(2, 'Neurologia'),
(3, 'Pneumologia'),
(4, 'Ortopedia'),
(5, 'Clínica Médica'),
(6, 'Cirurgia Geral'),
(7, 'Oncologia'),
(8, 'UTI Adulto');


-- ============================================
-- Inserindo dados: Dim_Pacientes
-- Geração de 5.000 pacientes fictícios
-- ============================================

DECLARE @Paciente INT = 1;

WHILE @Paciente <= 5000
BEGIN

    INSERT INTO Dim_Pacientes
    (
        ID_Paciente,
        Sexo,
        Idade,
        Cidade
    )
    VALUES
    (
        @Paciente,
        CASE 
            WHEN @Paciente % 2 = 0 THEN 'F'
            ELSE 'M'
        END,
        ABS(CHECKSUM(NEWID())) % 90 + 1,
        CASE ABS(CHECKSUM(NEWID())) % 8
            WHEN 0 THEN 'São Paulo'
            WHEN 1 THEN 'Diadema'
            WHEN 2 THEN 'Santo André'
            WHEN 3 THEN 'São Bernardo do Campo'
            WHEN 4 THEN 'Mauá'
            WHEN 5 THEN 'Osasco'
            WHEN 6 THEN 'Guarulhos'
            ELSE 'Santos'
        END
    );

    SET @Paciente = @Paciente + 1;

END;


-- ============================================
-- Inserindo dados: Dim_Calendario
-- Período: 2020 a 2026
-- ============================================

DECLARE @Data DATE = '2020-01-01';

WHILE @Data <= '2026-12-31'
BEGIN

    INSERT INTO Dim_Calendario
    (
        Data,
        Ano,
        Mes,
        Nome_Mes
    )
    VALUES
    (
        @Data,
        YEAR(@Data),
        MONTH(@Data),
        DATENAME(MONTH, @Data)
    );

    SET @Data = DATEADD(DAY, 1, @Data);

END;


-- ============================================
-- Inserindo dados: Fato_Internacoes
-- Geração de 10.000 internações fictícias
-- ============================================

DECLARE @Internacao INT = 1;

WHILE @Internacao <= 10000
BEGIN

    INSERT INTO Fato_Internacoes
    (
        ID_Internacao,
        ID_Paciente,
        ID_Convenio,
        ID_Especialidade,
        Data_Internacao,
        Dias_Internado
    )
    VALUES
    (
        @Internacao,

        ABS(CHECKSUM(NEWID())) % 5000 + 1,

        ABS(CHECKSUM(NEWID())) % 6 + 1,

        ABS(CHECKSUM(NEWID())) % 8 + 1,

        DATEADD(
            DAY,
            ABS(CHECKSUM(NEWID())) % 2557,
            '2020-01-01'
        ),

        ABS(CHECKSUM(NEWID())) % 30 + 1
    );

    SET @Internacao = @Internacao + 1;

END;
