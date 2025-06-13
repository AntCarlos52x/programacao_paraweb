-- drop database empresa_2025;
create database empresa_2025;

use empresa_2025;

CREATE TABLE Departamento (
    num_dept INTEGER PRIMARY KEY,
    nome_dept VARCHAR(255) NOT NULL
);

CREATE TABLE Empregado (
    matricula INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor_hora DOUBLE,
    salario DOUBLE,
    num_departamento INTEGER,
    FOREIGN KEY (num_departamento) REFERENCES Departamento(num_dept)
);

CREATE TABLE Projeto (
    num_proj INTEGER PRIMARY KEY,
    nome_pro VARCHAR(255) NOT NULL,
    num_departamento INTEGER,
    FOREIGN KEY (num_departamento) REFERENCES Departamento(num_dept)
);

CREATE TABLE Dependente (
    id_dependente INTEGER PRIMARY KEY,
    matricula_emp INTEGER,
    nome_dependente VARCHAR(255) NOT NULL,
    FOREIGN KEY (matricula_emp) REFERENCES Empregado(matricula)
);

CREATE TABLE Trabalha (
    id_trabalha INTEGER PRIMARY KEY,
    matricula_emp INTEGER,
    num_projeto INTEGER,
    horas INTEGER,
    FOREIGN KEY (matricula_emp) REFERENCES Empregado(matricula),
    FOREIGN KEY (num_projeto) REFERENCES Projeto(num_proj)
);

-- Povoamento

INSERT INTO Departamento (num_dept, nome_dept) VALUES
(1, 'Recursos Humanos'),
(2, 'Desenvolvimento'),
(3, 'Vendas');

INSERT INTO Empregado (matricula, nome, valor_hora, num_departamento) VALUES
(101, 'João Silva', 30, 1),
(102, 'Maria Souza', 35, 2),
(103, 'Carlos Andrade', 40, 3);

INSERT INTO Projeto (num_proj, nome_pro, num_departamento) VALUES
(1001, 'Sistema de Gestão', 2),
(1002, 'Aplicativo Móvel', 2),
(1003, 'Campanha de Marketing', 3);

INSERT INTO Dependente (id_dependente, matricula_emp, nome_dependente) VALUES
(1, 101, 'Ana Silva'),
(2, 102, 'Pedro Souza'),
(3, 103, 'Julia Andrade');

INSERT INTO Trabalha (id_trabalha, matricula_emp, num_projeto, horas) VALUES
(1, 101, 1001, 40),
(2, 102, 1002, 35),
(3, 103, 1003, 30);

select * from empregado;

set sql_safe_updates=0;

create trigger update_horas_trabalho
before update on empregado
for each row
set new.salario = (new.valor_hora * 170);

update empregado 
set salario = valor_hora * 170;

update empregado 
set valor_hora = 35;
where matricula = 101;

create trigger insert_salario
before insert on empregado
for each row
set new.salario = (new.valor_hora * 170);

insert into empregado (matricula, nome, valor_hora, num_departamento)
values (104,'Adallya',36, 1);