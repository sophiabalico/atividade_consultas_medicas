CREATE DATABASE consultas_medicas;

CREATE TABLE pacientes (
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    plano_saude VARCHAR(100)
);

CREATE TABLE medicos (
    id_medico SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    crm INTEGER
);

CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    data_consulta DATE,
    horario_consulta VARCHAR(5),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

INSERT INTO pacientes (nome, data_nascimento, plano_saude) VALUES
('Sophia Balico', '2007-05-18', 'Intermédica'),
('Vitor Hugo', '2009-07-04','Unimed'),
('Eliane Clara', '1978-03-28', 'Sulamérica'),
('Jefferson Balico', '1978-01-16', 'Intermédica');

INSERT INTO medicos (nome, especialidade, crm) VALUES
('Dr. João', 'Cardiologista', 123456),
('Dr. Maria', 'Oftalmologista', 654321),
('Dr. José', 'Ortopedista', 789123),
('Dr. Ana', 'Dermatologista', 456789);

INSERT INTO consultas (id_paciente, id_medico, data_consulta, horario_consulta) VALUES
(1, 4, '2021-10-01', '08:00'),
(2, 2, '2021-10-02', '09:00'),
(3, 1, '2021-10-03', '10:00'),
(4, 3, '2021-10-04', '11:00');

SELECT  p.nome AS nome_paciente, m.nome AS nome_medico, c.data_consulta, m.especialidade FROM consultas 
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN medicos m ON c.id_medico = m.id_medico;

SELECT p.nome FROM pacientes p LEFT JOIN consultas c ON p.id_paciente = c.id_paciente WHERE c.id_consulta IS NULL;

SELECT m.nome FROM medicos m LEFT JOIN consultas c ON m.id_medico = c.id_medico WHERE c.id_consulta IS NULL;


