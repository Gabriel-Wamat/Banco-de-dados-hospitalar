------------------------ POPULANDO O BD - HOSPITAL ------------------------

-- Populando a tabela Hospital
INSERT INTO Hospital (CNPJ, Endereço_CEP, Endereço_Complemento, Endereço_Numero)
VALUES ('11.111.111/0001-91', '87654-321', 'Rua dos bobos, BobocaCity', '200');


-- Populando a tabela Médico

INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM12345', 'Dr. João Silva', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM67890', 'Dra. Maria Oliveira', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM54321', 'Dr. Carlos Pereira', 'CRM67890');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM67500', 'Dra. Clara Costa ', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM001', 'Dr. João Ricardo Gomes', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM002', 'Dra. Maiara Lira', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM003', 'Dr. José Souza', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM004', 'Dr. Ana Costa', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM005', 'Dr. Pedro Lima', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM006', 'Dr. Paula Dias', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM007', 'Dr. Marcos Santos', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM008', 'Dr. Carla Pereira', 'CRM67890');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM009', 'Dr. Felipe Rocha', 'CRM12345');
INSERT INTO Medico (CRM, Nome, CRM_Supervisor) VALUES ('CRM010', 'Dr. Lucas Almeida', 'CRM67890');


-- Populando a tabela Telefone
INSERT INTO Telefone (CRM, telefone) VALUES ('CRM12345', '11999999999');
INSERT INTO Telefone (CRM, telefone) VALUES ('CRM12345', '11888888888');
INSERT INTO Telefone (CRM, telefone) VALUES ('CRM67890', '11777777777');
INSERT INTO Telefone (CRM, telefone) VALUES ('CRM54321', '11666666666');
INSERT INTO Telefone (CRM, telefone) VALUES ('CRM67500', '11985510684');

-- Populando a tabela Produto_Serviço
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P001', 'Consulta Médica');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P002', 'Consulta Médica');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P003', 'Exame de Sangue');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P004', 'Raio-X');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P005', 'Exame de Urina');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P006', 'Tomografia');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P007', 'Eletrocardiograma');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P008', 'Vacinação');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P009', 'Ultrassom');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P0010', 'eletroencefalograma');
INSERT INTO Produto_Servico (Cod_Produto, Nome) VALUES ('P0011', 'Resonância Magnética');


-- Populando a tabela Medicamento
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M001', 'Laboratório A', 'Paracetamol');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES('M002', 'Laboratório B', 'Amoxicilina');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M003', 'Laboratório C', 'Ibuprofeno');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M004', 'Laboratório A', 'Metformina');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M005', 'Laboratório D', 'Dipirona');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M006', 'Laboratório E', 'Cetirizina');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M007', 'Laboratório F', 'Omeprazol');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M008', 'Laboratório D', 'Aspirina');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M009', 'Laboratório G', 'Clorfeniramina');
INSERT INTO Medicamento (Cod, Laboratorio, Nome) VALUES ('M010', 'Laboratório H', 'Simvastatina');


-- Populando a tabela Setor
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Cardiologia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Pediatria');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Neurologia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Urologia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Ortopedia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Oncologia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Geriatria');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Dermatologia');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Psiquiatria');
INSERT INTO Setor (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Ginecologia');


-- Populando a tabela Enfermaria
INSERT INTO Enfermaria (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Pediatria');
INSERT INTO Enfermaria (CNPJ, Nome_setor) VALUES('11.111.111/0001-91', 'Cardiologia');
INSERT INTO Enfermaria (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Urologia');
INSERT INTO Enfermaria (CNPJ, Nome_setor) VALUES ('11.111.111/0001-91', 'Neurologia');

-- Populando a tabela Quarto
INSERT INTO Quarto (CNPJ, Nome_setor, Numero_quarto) VALUES ('11.111.111/0001-91', 'Neurologia', '104');
INSERT INTO Quarto (CNPJ, Nome_setor, Numero_quarto) VALUES ('11.111.111/0001-91', 'Cardiologia', '101');
INSERT INTO Quarto (CNPJ, Nome_setor, Numero_quarto) VALUES ('11.111.111/0001-91', 'Pediatria', '105');
INSERT INTO Quarto (CNPJ, Nome_setor, Numero_quarto) VALUES ('11.111.111/0001-91', 'Urologia', '100');


-- Populando a tabela Paciente

INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('11111111111', 'João Silva', '12345678', '10', 'Apto 1');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('22222222222', 'Maiara Lira', '23456789', '20', 'Apto 2');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('33333333333', 'José Souza', '34567890', '30', 'Apto 3');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('44444444444', 'Ana Costa', '45678901', '40', 'Casa B');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('55555555555', 'Pedro Lima', '56789012', '50', 'Apto 5');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('66666666666', 'Paula Dias', '67890123', '60', 'Apto 145');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('77777777777', 'Marcos Santos', '78901234', '70', 'Casa');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('88888888888', 'Carla Pereira', '89012345', '80', 'Casa Azul A');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('99999999999', 'Felipe Rocha', '90123456', '90', 'Apto 2');
INSERT INTO Paciente (CPF_Paciente, Nome, End_Cep, End_Numero, End_Complemento) VALUES ('00000000000', 'Lucas Almeida', '01234567', '100', 'Apto 102 - Bloco A');

-- Populando a tabela Paciente_Quarto
INSERT INTO Paciente_Quarto (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES ('22222222222', '12345-678', '101', 'Apto 101');
INSERT INTO Paciente_Quarto (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES ('00000000000', '12345-678', '101', 'Apto 102');
INSERT INTO Paciente_Quarto (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES ('77777777777', '12345-678', '101', 'Apto 102');
INSERT INTO Paciente_Quarto (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES ('44444444444', '12345-678', '101', 'Apto 103');

-- Populando a tabela Paciente_Enfermaria
INSERT INTO Paciente_Enfermaria (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES('88888888888', '87654-321', '202', 'Casa 202');
INSERT INTO Paciente_Enfermaria (CPF_Paciente, End_Cep, End_Numero, End_Complemento) VALUES('66666666666', '65432-109', '404', 'Casa 404');


-- Populando a tabela Consulta
INSERT INTO Consulta (CRM, CPF_Paciente) VALUES ('CRM12345', '44444444444');
INSERT INTO Consulta (CRM, CPF_Paciente) VALUES ('CRM67890', '66666666666');
INSERT INTO Consulta (CRM, CPF_Paciente) VALUES ('CRM12345', '22222222222');
INSERT INTO Consulta (CRM, CPF_Paciente) VALUES ('CRM67500', '00000000000');
INSERT INTO Consulta (CRM, CPF_Paciente) VALUES ('CRM54321', '22222222222');

-- Populando a tabela Trabalha
INSERT INTO Trabalha (CRM, CNPJ, Nome_setor) VALUES ('CRM12345', '11.111.111/0001-91', 'Cardiologia');
INSERT INTO Trabalha (CRM, CNPJ, Nome_setor) VALUES ('CRM67890', '11.111.111/0001-91', 'Pediatria');
INSERT INTO Trabalha (CRM, CNPJ, Nome_setor) VALUES ('CRM54321', '11.111.111/0001-91', 'Cardiologia');

-- Populando a tabela Interna_Enfermaria
INSERT INTO Interna_Enfermaria (CPF_Paciente, CNPJ, Nome_setor, data) VALUES ('22222222222', '11.111.111/0001-91', 'Pediatria', TO_DATE('2024-08-30', 'YYYY-MM-DD'));
INSERT INTO Interna_Enfermaria (CPF_Paciente, CNPJ, Nome_setor, data) VALUES ('77777777777', '11.111.111/0001-91', 'Neurologia', TO_DATE('2024-08-30', 'YYYY-MM-DD'));

-- Populando a tabela Interna_Quarto
INSERT INTO Interna_Quarto (CPF_Paciente, CNPJ, Nome_setor, Numero_quarto, Cod_Produto, data) VALUES
    ('77777777777', '11.111.111/0001-91', 'Neurologia', '104', 'P001', TO_DATE('2024-08-30', 'YYYY-MM-DD'));
INSERT INTO Interna_Quarto (CPF_Paciente, CNPJ, Nome_setor, Numero_quarto, Cod_Produto, data) VALUES
    ('00000000000', '11.111.111/0001-91', 'Cardiologia', '101', 'P001', TO_DATE('2024-08-30', 'YYYY-MM-DD'));

-- Populando a tabela Receita
INSERT INTO Receita (CRM, CPF_Paciente, Cod_Medicamento) VALUES ('CRM12345', '00000000000', 'M001');
INSERT INTO Receita (CRM, CPF_Paciente, Cod_Medicamento) VALUES ('CRM67890', '77777777777', 'M002');
