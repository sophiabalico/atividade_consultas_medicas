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

