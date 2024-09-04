/* 
-- 1)Entidades regulares e seus atributos

Hospital(CNPJ,Endereço_CEP,Endereço_Complemento,Endereço_numero)

Médico(CRM,Nome, CRM-Supervisor)
 CRM -> Medico(CRM)
 CRM-Supervisor -> Medico(CRM)

Telefone(CRM, telefone)
CRM -> Médico(CRM)

Produto_Serviço(Cod_Produto,Nome)

Medicamento(Cod,Laboratório,nome)

-- 2)Entidades Fracas e seus atributos

Setor(CNPJ,Nome_setor)
		CNPJ->Hospital(CNPJ)
Enfermaria(CNPJ,Nome_setor)
		CNPJ -> hospital(CNPJ)
                        Nome_setor -> Setor(Nome_setor)
Quarto(CNPJ, Nome_setor,Numero_quarto)
CNPJ -> hospital(CNPJ)
	Nome_setor -> Setor(Nome_setor)

-- 3) Herança e atributos

Paciente(CPF_Paciente, End_Cep, End_Número, End_Complemento)                  

Paciente_quarto(CPF_Paciente,End_Cep, End_Número, End_Complemento)
                      CPF_Paciente -> Paciente(CPF)
Paciente_enfermaria(CPF_Pciente,End_Cep, End_Número, End_Complemento)
                      CPF_Paciente -> Paciente(CPF)

-- 4)Entidades associativas
Consulta(CRM,CPF_Paciente)	
CRM -> Medico(CRM)
	CPF_Paciente -> Paciente(CPF_Paciente)

-- 5)Relacionamentos e atributos
	Trabalha(CRM,CNPJ,Nome_setor)
		CRM -> Médico(CRM)
		CNPJ, Nome_setor -> Setor(CNPJ, Nome_setor)
	
	Interna_Enfermaria(CPF_Paciente,CNPJ,Nome_setor, data)
		Cpf_Paciente -> Paciente(Cpf_paciente)
		CNPJ, Nome_setor -> Setor(CNPJ, Nome_setor)
		

Interna_Quarto(CPF_Paciente,CNPJ,Nome_setor, Numero_quarto,Cod_produto, data)
		Cpf_Paciente -> Paciente(Cpf_paciente)
		Cod_produto -> Produto/serviço(Cod_prod_serv)
CNPJ,Nome_setor, Numero_quarto  -> Quarto (CNPJ,Nome_setor, Numero_quarto)
 
	Receita(CRM,CPF_Paciente,Cod_Medicamento)
		CRM -> Medico (CRM)
CPF_Paciente -> Paciente (CPF_Paciente)
		Cod_medicamento -> Medicamento(Cod_medicamento)

	


*/