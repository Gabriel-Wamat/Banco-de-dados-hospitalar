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


