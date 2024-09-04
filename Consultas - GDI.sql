-- Consulta 1: Group by/Having
SELECT Nome_Setor, COUNT(*) AS Total_Medicos
FROM Trabalha
GROUP BY Nome_Setor
HAVING COUNT(*) > 2;

-- Consulta 2: Junção Interna
SELECT M.Nome AS Medico, 
       (SELECT H.CNPJ 
        FROM Hospital H  
        JOIN SETOR S ON H.CNPJ = S.CNPJ) 
FROM Medico M

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


SELECT M.Nome AS Med,  
       S.Nome_setor AS Setor_Medico 
FROM Medico M 
JOIN Setor S ON EXISTS ( 
    SELECT * 
    FROM Trabalha T 
    WHERE T.CRM = M.CRM 
    AND T.CNPJ = S.CNPJ 
    AND T.Nome_setor = S.Nome_setor)

    
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

-- Projete o nome do medico, nome do paciente atendido e o medicamento receitado
SELECT M.Nome AS Nome_Medico,(SELECT P.Nome  
    						 FROM Paciente P 
      						 WHERE P.CPF_Paciente = R.CPF_Paciente) AS Nome_Paciente, (SELECT MD.Nome  
    																				  FROM Medicamento MD 
     																				   WHERE MD.Cod = R.Cod_Medicamento) AS Nome_Medicamento 
FROM Receita R JOIN Medico M ON R.CRM = M.CRM

------------------------------------------------------------------------------------------
    
SELECT M.Nome, C.Data
FROM Medico M
JOIN (
    SELECT CPF_Medico, Data 
    FROM Consulta 
    WHERE Data >= '2023-01-01'
) AS C ON M.CPF = C.CPF_Medico;

-- Consulta 9: Operação de Conjunto (Union)
SELECT CRM, Nome 
FROM Medico
UNION
SELECT CPF_paciente, Nome 
FROM Paciente;

