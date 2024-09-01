-- Criação das tabelas das Entidades Regulares
CREATE TABLE Hospital (
    CNPJ VARCHAR(14) PRIMARY KEY,
    Endereço_CEP VARCHAR(10),
    Endereço_Complemento VARCHAR(50),
    Endereço_numero INT
);

CREATE TABLE Medico (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    CRM VARCHAR(20) NOT NULL
);

CREATE TABLE Telefone (
    CPF VARCHAR(11),
    telefone VARCHAR(15),
    PRIMARY KEY (CPF, telefone),
    FOREIGN KEY (CPF) REFERENCES Medico(CPF)
);

CREATE TABLE Produto_Servico (
    Cod INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Medicamento (
    Cod INT PRIMARY KEY,
    Laboratório VARCHAR(100),
    Nome VARCHAR(100),
    FOREIGN KEY (Cod) REFERENCES Produto_Servico(Cod)
);

-- Criação das tabelas das Entidades Fracas
CREATE TABLE Setor (
    CNPJ VARCHAR(14),
    Nome_setor VARCHAR(100),
    PRIMARY KEY (CNPJ, Nome_setor),
    FOREIGN KEY (CNPJ) REFERENCES Hospital(CNPJ)
);

CREATE TABLE Enfermaria (
    CNPJ VARCHAR(14),
    Numero_enfermaria INT,
    Nome_setor VARCHAR(100),
    PRIMARY KEY (CNPJ, Numero_enfermaria),
    FOREIGN KEY (CNPJ) REFERENCES Hospital(CNPJ),
    FOREIGN KEY (Nome_setor) REFERENCES Setor(Nome_setor)
);

CREATE TABLE Quarto (
    CNPJ VARCHAR(14),
    Numero_quarto INT,
    Nome_setor VARCHAR(100),
    PRIMARY KEY (CNPJ, Numero_quarto),
    FOREIGN KEY (CNPJ) REFERENCES Hospital(CNPJ),
    FOREIGN KEY (Nome_setor) REFERENCES Setor(Nome_setor)
);

-- Criação das tabelas de Herança
CREATE TABLE Paciente (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Paciente_Quarto (
    CPF VARCHAR(11),
    Cep VARCHAR(10),
    Numero INT,
    Complemento VARCHAR(50),
    PRIMARY KEY (CPF),
    FOREIGN KEY (CPF) REFERENCES Paciente(CPF)
);

CREATE TABLE Paciente_Enfermaria (
    CPF VARCHAR(11),
    Cep VARCHAR(10),
    Numero INT,
    Complemento VARCHAR(50),
    PRIMARY KEY (CPF),
    FOREIGN KEY (CPF) REFERENCES Paciente(CPF)
);

-- Criação das tabelas das Entidades Associativas
CREATE TABLE Consulta (
    CPF_Medico VARCHAR(11),
    CPF_Paciente VARCHAR(11),
    PRIMARY KEY (CPF_Medico, CPF_Paciente),
    FOREIGN KEY (CPF_Medico) REFERENCES Medico(CPF),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF)
);

-- Criação das tabelas de Relacionamentos
CREATE TABLE Trabalha (
    CPF_medico VARCHAR(11),
    Nome_setor VARCHAR(100),
    PRIMARY KEY (CPF_medico, Nome_setor),
    FOREIGN KEY (CPF_medico) REFERENCES Medico(CPF),
    FOREIGN KEY (Nome_setor) REFERENCES Setor(Nome_setor)
);

CREATE TABLE Interna_Enfermaria (
    CNPJ VARCHAR(14),
    Numero_enfermaria INT,
    CPF_Paciente_enf VARCHAR(11),
    Data DATE,
    PRIMARY KEY (CNPJ, Numero_enfermaria, CPF_Paciente_enf),
    FOREIGN KEY (CNPJ, Numero_enfermaria) REFERENCES Enfermaria(CNPJ, Numero_enfermaria),
    FOREIGN KEY (CPF_Paciente_enf) REFERENCES Paciente(CPF)
);

CREATE TABLE Interna_Quarto (
    CNPJ VARCHAR(14),
    Numero_quarto INT,
    CPF_Paciente VARCHAR(11),
    Cod_prod_serv INT,
    Data DATE,
    PRIMARY KEY (CNPJ, Numero_quarto, CPF_Paciente),
    FOREIGN KEY (CNPJ, Numero_quarto) REFERENCES Quarto(CNPJ, Numero_quarto),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF),
    FOREIGN KEY (Cod_prod_serv) REFERENCES Produto_Servico(Cod)
);

CREATE TABLE Receita (
    CPF_Medico VARCHAR(11),
    CPF_Paciente VARCHAR(11),
    Cod_medicamento INT,
    PRIMARY KEY (CPF_Medico, CPF_Paciente, Cod_medicamento),
    FOREIGN KEY (CPF_Medico, CPF_Paciente) REFERENCES Consulta(CPF_Medico, CPF_Paciente),
    FOREIGN KEY (Cod_medicamento) REFERENCES Medicamento(Cod)
);

CREATE TABLE Supervisiona (
    Supervisor VARCHAR(11),
    Supervisionado VARCHAR(11),
    PRIMARY KEY (Supervisor, Supervisionado),
    FOREIGN KEY (Supervisor) REFERENCES Medico(CPF),
    FOREIGN KEY (Supervisionado) REFERENCES Medico(CPF)
);


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
