-- 1
ALTER TABLE empregados ADD dataNascimento VARCHAR(0);

-- 2
CREATE USER analista_financeiro_jr@'localhost' IDENTIFIED BY 'analistfinjr316';

GRANT SELECT (nome, salario) ON empresa_2025.empregado TO analista_financeiro_jr@'localhost';
GRANT SELECT (nome_dept) ON empresa_2025.departamento TO analista_financeiro_jr@'localhost'; 

-- 3 
SELECT d.num_dept, SUM(e.salario) AS salario_total
FROM departamento d
LEFT JOIN empregado e ON d.num_dept = e.num_departamento
GROUP BY d.num_dept;
SELECT (num_dept) 

-- 4
DELIMITER $
CREATE PROCEDURE calcula_salario_mensal (id IN)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE salario INT;
	SET salario = (SELECT valor_hora FROM empregado WHERE matricula = id) * 170;
	RETURN salario;
END $
DELIMITER $

SELECT calculaSalarioMensal(1);

-- 5
SELECT t.matricula_emp, COUNT(p.num_proj) AS num_projeto FROM trabalha t
LEFT JOIN projeto p ON t.num_projeto = p.num_proj
GROUP BY t.matricula_emp
HAVING COUNT(p.num_proj) > 1;

-- 6
CREATE TABLE LogHorasTrabalhadas (
	id_log INT PRIMARY KEY,
	horas_anteriores INT,
    matricula


