-- ==========================================================
-- IMPLEMENTAÇÃO FINAL SCHEMA HR - ORACLE 26ai
-- Objetivo: Criar estrutura de RH com validação de dados
-- ==========================================================

-- 1. Criação das Tabelas e Regras de Salário
CREATE TABLE HR.JOBS (
    JOB_ID     VARCHAR2(10) PRIMARY KEY,
    JOB_TITLE  VARCHAR2(35) NOT NULL,
    MIN_SALARY NUMBER,
    MAX_SALARY NUMBER,
    CONSTRAINT JOB_SALARY_CHK CHECK (MAX_SALARY > MIN_SALARY)
);

CREATE TABLE HR.EMPLOYEES (
    EMPLOYEE_ID    NUMBER PRIMARY KEY,
    LAST_NAME      VARCHAR2(25) NOT NULL,
    EMAIL          VARCHAR2(25) UNIQUE,
    HIRE_DATE      DATE DEFAULT SYSDATE,
    JOB_ID         VARCHAR2(10),
    SALARY         NUMBER(8,2),
    CONSTRAINT EMP_SALARY_MIN_CHK CHECK (SALARY > 0),
    CONSTRAINT FK_JOB FOREIGN KEY (JOB_ID) REFERENCES HR.JOBS(JOB_ID)
);

-- 2. Inserção de Dados (Validando a integridade)
INSERT INTO HR.JOBS VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, LAST_NAME, EMAIL, JOB_ID, SALARY)
VALUES (200, 'Souza', 'JSOUZA', 'IT_PROG', 5000);

COMMIT;

-- 3. Consulta de Verificação
SELECT * FROM HR.EMPLOYEES;
