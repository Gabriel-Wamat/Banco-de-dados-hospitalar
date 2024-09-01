-- Consulta 1: Group by/Having
SELECT Nome_Setor, COUNT(*) AS Total_Medicos
FROM Trabalha
GROUP BY Nome_Setor
HAVING COUNT(*) > 2;

-- Consulta 2: Junção Interna
SELECT M.Nome AS Medico, P.Nome AS Paciente, C.Data
FROM Medico M
INNER JOIN Consulta C ON M.CPF = C.CPF_Medico
INNER JOIN Paciente P ON P.CPF = C.CPF_Paciente;

-- Consulta 3: Junção Externa
SELECT M.Nome AS Medico, P.Nome AS Paciente, C.Data
FROM Medico M
LEFT JOIN Consulta C ON M.CPF = C.CPF_Medico
LEFT JOIN Paciente P ON P.CPF = C.CPF_Paciente;

-- Consulta 4: Semi Junção
SELECT DISTINCT M.Nome
FROM Medico M
WHERE EXISTS (
    SELECT 1
    FROM Consulta C
    WHERE C.CPF_Medico = M.CPF
);

-- Consulta 5: Anti-Junção
SELECT M.Nome
FROM Medico M
WHERE NOT EXISTS (
    SELECT 1
    FROM Consulta C
    WHERE C.CPF_Medico = M.CPF
);

-- Consulta 6: Subconsulta do Tipo Escalar
SELECT M.Nome, 
       (SELECT COUNT(*) 
        FROM Consulta C 
        WHERE C.CPF_Medico = M.CPF) AS Total_Consultas
FROM Medico M;

-- Consulta 7: Subconsulta do Tipo Linha
SELECT M.Nome AS Medico, 
       (SELECT P.Nome 
        FROM Paciente P 
        JOIN Consulta C ON P.CPF = C.CPF_Paciente 
        WHERE C.CPF_Medico = M.CPF 
        ORDER BY C.Data DESC 
        LIMIT 1) AS Paciente_Recente
FROM Medico M;

-- Consulta 8: Subconsulta do Tipo Tabela
SELECT M.Nome, C.Data
FROM Medico M
JOIN (
    SELECT CPF_Medico, Data 
    FROM Consulta 
    WHERE Data >= '2023-01-01'
) AS C ON M.CPF = C.CPF_Medico;

-- Consulta 9: Operação de Conjunto (Union)
SELECT CPF, Nome 
FROM Medico
UNION
SELECT CPF, Nome 
FROM Paciente;
