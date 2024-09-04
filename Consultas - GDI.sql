-- Consulta 1: Group by/Having
SELECT Nome_Setor, COUNT(*) AS Total_Medicos
FROM Trabalha
GROUP BY Nome_Setor
HAVING COUNT(*) > 2;

-- Função de agregação
SELECT C.CRM, (
    SELECT M1.NOME
    FROM MEDICO M1 WHERE
    M1.CRM = C.CRM
) AS NOME, COUNT(*)
FROM CONSULTA C
GROUP BY C.CRM
HAVING COUNT(*) > 1;

-- Consulta 2: Junção Interna
SELECT M.Nome AS Medico, 
       S.Nome_setor AS Setor_Medico, 
       H.CNPJ AS CNPJ_Hospital 
FROM Medico M 
JOIN Trabalha T ON M.CRM = T.CRM 
JOIN Setor S ON T.CNPJ = S.CNPJ AND T.Nome_setor = S.Nome_setor 
JOIN Hospital H ON S.CNPJ = H.CNPJ

-- Consulta 3: Junção Externa
SELECT M.Nome AS Medico, P.Nome AS Paciente
FROM Medico M
LEFT JOIN Consulta C ON M.CRM= C.CRM
LEFT JOIN Paciente P ON P.CPF_paciente = C.CPF_Paciente;


 -- Consulta 4: Semi Junção - Exists // IN

SELECT M.Nome
FROM Medico M
WHERE EXISTS (
    SELECT 1
    FROM Consulta C
    WHERE C.CRM= M.CRM);

SELECT M.Nome
FROM Medico M
WHERE M.CRM IN (
    SELECT C.CRM
    FROM Consulta C);

----------------------------------------------- 
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
        WHERE C.CRM= M.CRM) AS Total_Consultas
FROM Medico M;

-------
SELECT m.Nome, m.CRM
FROM Medico m
WHERE m.CRM = (
    SELECT t.crm
    FROM Trabalha t
    WHERE CRM = 'CRM12345');


-- Consulta 7: Subconsulta do Tipo Linha


SELECT Nome, CRM
FROM Medico
WHERE CRM IN (
    SELECT CRM
    FROM Trabalha
    WHERE (CNPJ, Nome_Setor) = (
        SELECT CNPJ, Nome_Setor
        FROM Trabalha
        WHERE CRM = 'CRM12345'));


-- Consulta 8: Subconsulta do Tipo Tabela

-- Projete o nome do medico, nome do paciente atendido e o medicamento receitado
SELECT M.Nome AS Nome_Medico,(SELECT P.Nome  
    				  FROM Paciente P 
      				  WHERE P.CPF_Paciente = R.CPF_Paciente) AS Nome_Paciente, (SELECT MD.Nome  
    												    FROM Medicamento MD 
     												    WHERE MD.Cod = R.Cod_Medicamento) AS Nome_Medicamento 
FROM Receita R JOIN Medico M ON R.CRM = M.CRM

------------------------------------------------------------------------------------------
    
-- Consulta 9: Operação de Conjunto (Union)
SELECT CRM, Nome 
FROM Medico
UNION
SELECT CPF_paciente, Nome 
FROM Paciente;

