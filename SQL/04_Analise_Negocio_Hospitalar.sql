USE HospitalAnalytics;
GO

-- --------------------------------------------------------------------
-- PERGUNTA 1: Qual é o tempo médio de internação (em dias) por especialidade?
-- OBJETIVO: Identificar quais especialidades retêm pacientes por mais tempo.
-- --------------------------------------------------------------------

SELECT 
    e.Especialidade,
    COUNT(f.ID_Internacao) AS Total_Atendimentos,
    ROUND(AVG(CAST(f.Dias_Internado AS FLOAT)), 1) AS Media_Dias_Internado
FROM dbo.Fato_Internacoes f
INNER JOIN dbo.Dim_Especialidades e 
    ON f.ID_Especialidade = e.ID_Especialidade
GROUP BY e.Especialidade
ORDER BY Media_Dias_Internado DESC;

-- --------------------------------------------------------------------
-- PERGUNTA 2: Quais foram os meses com maior número de internações?
-- OBJETIVO: Identificar picos de demanda para planejamento operacional.
-- --------------------------------------------------------------------

SELECT 
    c.Ano,
    c.Mes,
    c.Nome_Mes,
    COUNT(f.ID_Internacao) AS Total_Internacoes
FROM dbo.Fato_Internacoes f
INNER JOIN dbo.Dim_Calendario c 
    ON f.Data_Internacao = c.Data
GROUP BY 
    c.Ano, 
    c.Mes, 
    c.Nome_Mes
ORDER BY 
    Total_Internacoes DESC;

	-- --------------------------------------------------------------------
-- PERGUNTA 3: Qual a distribuição de internações por convênio?
-- OBJETIVO: Mapear os convênios de maior representatividade.
-- --------------------------------------------------------------------

SELECT 
    conv.Convenio,
    COUNT(f.ID_Internacao) AS Total_Internacoes,
    ROUND(
        COUNT(f.ID_Internacao) * 100.0 / SUM(COUNT(f.ID_Internacao)) OVER(), 
        2
    ) AS Percentual_Total
FROM dbo.Fato_Internacoes f
INNER JOIN dbo.Dim_Convenios conv 
    ON f.ID_Convenio = conv.ID_Convenio
GROUP BY conv.Convenio
ORDER BY Total_Internacoes DESC;