------------------------ Criação do Banco de Dados - HOSPITAL ------------------------

CREATE TABLE Hospital ( 
    CNPJ VARCHAR2(20) PRIMARY KEY, 
    Endereço_CEP VARCHAR2(10), 
    Endereço_Complemento VARCHAR2(100), 
    Endereço_Numero VARCHAR2(10));

CREATE TABLE Medico ( 
    CRM VARCHAR2(20) PRIMARY KEY, 
    Nome VARCHAR2(100), 
    CRM_Supervisor VARCHAR2(20) NOT NULL, 
    CONSTRAINT fk_medico_supervisor FOREIGN KEY (CRM_Supervisor) REFERENCES Medico(CRM));

CREATE TABLE Telefone ( 
    CRM VARCHAR2(20), 
    telefone VARCHAR2(20), 
    PRIMARY KEY (CRM, telefone), 
    CONSTRAINT fk_telefone_medico FOREIGN KEY (CRM) REFERENCES Medico(CRM));

CREATE TABLE Produto_Servico ( 
    Cod_Produto VARCHAR2(20) PRIMARY KEY, 
    Nome VARCHAR2(100));

CREATE TABLE Medicamento ( 
    Cod VARCHAR2(20) PRIMARY KEY, 
    Laboratorio VARCHAR2(100), 
    Nome VARCHAR2(100));

CREATE TABLE Setor ( 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    PRIMARY KEY (CNPJ, Nome_setor), 
    CONSTRAINT fk_setor_hospital FOREIGN KEY (CNPJ) REFERENCES Hospital(CNPJ));

CREATE TABLE Enfermaria ( 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    PRIMARY KEY (CNPJ, Nome_setor), 
    CONSTRAINT fk_enfermaria_setor FOREIGN KEY (CNPJ, Nome_setor) REFERENCES Setor(CNPJ, Nome_setor));

CREATE TABLE Quarto ( 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    Numero_quarto VARCHAR2(10), 
    PRIMARY KEY (CNPJ, Nome_setor, Numero_quarto), 
    CONSTRAINT fk_quarto_setor FOREIGN KEY (CNPJ, Nome_setor) REFERENCES Setor(CNPJ, Nome_setor));

CREATE TABLE Paciente ( 
    CPF_Paciente VARCHAR2(20) PRIMARY KEY, 
    Nome VARCHAR2(100), 
    End_Cep VARCHAR2(10), 
    End_Numero VARCHAR2(10), 
    End_Complemento VARCHAR2(100));

CREATE TABLE Paciente_Quarto ( 
    CPF_Paciente VARCHAR2(20), 
    End_Cep VARCHAR2(10), 
    End_Numero VARCHAR2(10), 
    End_Complemento VARCHAR2(100), 
    PRIMARY KEY (CPF_Paciente), 
    CONSTRAINT fk_paciente_quarto FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente));

CREATE TABLE Paciente_Enfermaria ( 
    CPF_Paciente VARCHAR2(20), 
    End_Cep VARCHAR2(10), 
    End_Numero VARCHAR2(10), 
    End_Complemento VARCHAR2(100), 
    PRIMARY KEY (CPF_Paciente), 
    CONSTRAINT fk_paciente_enfermaria FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente));

CREATE TABLE Consulta ( 
    CRM VARCHAR2(20), 
    CPF_Paciente VARCHAR2(20), 
    PRIMARY KEY (CRM, CPF_Paciente), 
    CONSTRAINT fk_consulta_medico FOREIGN KEY (CRM) REFERENCES Medico(CRM), 
    CONSTRAINT fk_consulta_paciente FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente));

CREATE TABLE Trabalha ( 
    CRM VARCHAR2(20), 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    PRIMARY KEY (CRM, CNPJ, Nome_setor), 
    CONSTRAINT fk_trabalha_medico FOREIGN KEY (CRM) REFERENCES Medico(CRM), 
    CONSTRAINT fk_trabalha_setor FOREIGN KEY (CNPJ, Nome_setor) REFERENCES Setor(CNPJ, Nome_setor));

CREATE TABLE Interna_Enfermaria ( 
    CPF_Paciente VARCHAR2(20), 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    data DATE, 
    PRIMARY KEY (CPF_Paciente, CNPJ, Nome_setor), 
    CONSTRAINT fk_interna_enfermaria_paciente FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente), 
    CONSTRAINT fk_interna_enfermaria_setor FOREIGN KEY (CNPJ, Nome_setor) REFERENCES Setor(CNPJ, Nome_setor));

CREATE TABLE Interna_Quarto ( 
    CPF_Paciente VARCHAR2(20), 
    CNPJ VARCHAR2(20), 
    Nome_setor VARCHAR2(100), 
    Numero_quarto VARCHAR2(10), 
    Cod_Produto VARCHAR2(20), 
    data DATE, 
    PRIMARY KEY (CPF_Paciente, CNPJ, Nome_setor, Numero_quarto), 
    CONSTRAINT fk_interna_quarto_paciente FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente), 
    CONSTRAINT fk_interna_quarto_produto FOREIGN KEY (Cod_Produto) REFERENCES Produto_Servico(Cod_Produto), 
    CONSTRAINT fk_interna_quarto_setor FOREIGN KEY (CNPJ, Nome_setor, Numero_quarto) REFERENCES Quarto(CNPJ, Nome_setor, Numero_quarto));

CREATE TABLE Receita ( 
    CRM VARCHAR2(20), 
    CPF_Paciente VARCHAR2(20), 
    Cod_Medicamento VARCHAR2(20), 
    PRIMARY KEY (CRM, CPF_Paciente, Cod_Medicamento), 
    CONSTRAINT fk_receita_medico FOREIGN KEY (CRM) REFERENCES Medico(CRM), 
    CONSTRAINT fk_receita_paciente FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente), 
    CONSTRAINT fk_receita_medicamento FOREIGN KEY (Cod_Medicamento) REFERENCES Medicamento(Cod));


------------------ TRIGGERS -------------

--- Essa trigger verificar se o paciente já está internado em uma enfermaria

CREATE OR REPLACE TRIGGER verifica_internacao
BEFORE INSERT ON Interna_Quarto
FOR EACH ROW
DECLARE
    v_enfermaria_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_enfermaria_count
    FROM Interna_Enfermaria
    WHERE CPF_Paciente = :NEW.CPF_Paciente;

    IF v_enfermaria_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O paciente já está internado em uma enfermaria e não pode ser internado em um quarto.');
    END IF;
END;
/


-- Trigger sobre exclusão de médicos que são supervisores

CREATE OR REPLACE TRIGGER verifica_supervisor
BEFORE DELETE ON Medico
FOR EACH ROW
DECLARE
    v_supervisados_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_supervisados_count
    FROM Medico
    WHERE CRM_Supervisor = :OLD.CRM;

    IF v_supervisados_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Este médico é supervisor de outros médicos e não pode ser excluído.');
    END IF;
END;
/



------------------- PROCEDURE ------------------------------

--- Procedure que permite inserir um médico sem precisar informar o CRM do supervisor
CREATE OR REPLACE PROCEDURE inserir_medico(
    p_CRM VARCHAR2,
    p_Nome VARCHAR2
)
AS
    v_CRM_Supervisor VARCHAR2(20);
BEGIN
    
    SELECT CRM
    INTO v_CRM_Supervisor
    FROM Medico
    WHERE CRM_Supervisor IS NULL 
    ORDER BY CRM DESC
    FETCH FIRST 1 ROWS ONLY;

    INSERT INTO Medico (CRM, Nome, CRM_Supervisor)
    VALUES (p_CRM, p_Nome, v_CRM_Supervisor);

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Nenhum supervisor disponível para ser associado.');
END;
/



