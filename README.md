
# Projeto de Banco de Dados Hospitalar

## Descrição Geral

Este projeto visa a criação e gerenciamento de um banco de dados para um sistema hospitalar, incluindo a estruturação de entidades, relacionamentos e consultas SQL para operações comuns. O objetivo é organizar e armazenar informações relacionadas a hospitais, médicos, pacientes, setores, quartos, medicamentos, consultas e supervisões médicas.

## Entidades Principais

1. **Hospital**: Armazena informações sobre os hospitais, incluindo CNPJ, endereço (CEP, complemento e número).
   
2. **Medico**: Contém dados sobre os médicos, como CPF, nome e CRM.

3. **Telefone**: Lista os números de telefone dos médicos, vinculados por CPF.

4. **Produto_Serviço**: Armazena os diferentes tipos de produtos e serviços oferecidos pelo hospital.

5. **Medicamento**: Detalha os medicamentos disponíveis, com referências ao laboratório e ao nome do medicamento.

6. **Setor**: Representa os setores dentro dos hospitais, como emergência, pediatria, etc.

7. **Enfermaria**: Contém informações sobre as enfermarias dos hospitais, associadas aos setores.

8. **Quarto**: Detalha os quartos nos hospitais, vinculados aos setores.

9. **Paciente**: Armazena informações básicas dos pacientes, como CPF e nome.

10. **Paciente_Quarto**: Relaciona os pacientes aos quartos em que estão internados.

11. **Paciente_Enfermaria**: Relaciona os pacientes às enfermarias em que estão internados.

12. **Consulta**: Associa médicos a pacientes em uma consulta, armazenando também a data da consulta.

13. **Trabalha**: Relaciona médicos aos setores em que eles atuam.

14. **Interna_Enfermaria**: Registra a internação de pacientes nas enfermarias, incluindo a data de internação.

15. **Interna_Quarto**: Registra a internação de pacientes nos quartos, associando um produto ou serviço utilizado na internação.

16. **Receita**: Liga médicos e pacientes a medicamentos prescritos durante consultas.

17. **Supervisiona**: Relaciona médicos em um esquema de supervisão, onde um médico supervisiona outro.

## Consultas SQL

O projeto inclui diversas consultas SQL para extrair e manipular os dados, como:

1. **Consulta por setor com mais de 2 médicos**: Agrupa e conta os médicos por setor.
   
2. **Junções internas e externas**: Relaciona médicos, pacientes e consultas.
   
3. **Semi junções e anti-junções**: Identifica médicos com ou sem consultas.
   
4. **Subconsultas escalares e de linha**: Conta o total de consultas por médico e identifica o paciente mais recente para cada médico.
   
5. **Operação de conjunto (Union)**: Combina os CPFs de médicos e pacientes, removendo duplicatas.

## Dados de Exemplo

O projeto inclui comandos para inserir 10 linhas de dados em cada tabela, fornecendo um conjunto de dados inicial para testes e validação das consultas e operações.

## Objetivo

O principal objetivo deste projeto é fornecer uma solução completa e integrada para o gerenciamento de dados em um ambiente hospitalar, permitindo a realização de operações complexas de forma eficiente e organizada.

## GRUPO:

- Gabriel Wamat - gabriel.walisson@ufpe.br

- Maiara Lira - msl3@cin.ufpe.br

- Marco Antonio Vasconcelos - mavff@cin.ufpe.br

- Matheus Henrique Cabral - mhpc@cin.ufpe.br
