CREATE TABLE alunos(
    id_aluno int primary key not null,
    name varchar(40) not null
);

CREATE TABLE alunos_grades(
    id_grade int primary key not null,
    id_aluno int not null,
    grade float not null,
    CONSTRAINT fk_id_aluno0 FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno)
);

CREATE TABLE alunos_grades_audit(
    id_change int not null,
    id_aluno int not null,
    last_change float not null,
    hora timestamp(6) not null,
    CONSTRAINT fk_id_aluno1 FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno)
);

CREATE OR REPLACE FUNCTION log_last_grade_changes()
 RETURNS TRIGGER
 LANGUAGE PLPGSQL
 AS
$$
BEGIN
	IF NEW.grade <> OLD.grade THEN
	
		INSERT INTO alunos_grades_audit(id_change,id_aluno,last_change,hora)
		
		VALUES(OLD.id_grade,OLD.id_aluno,OLD.grade,now());
		
	END IF;
	RETURN NEW;
END;
$$

CREATE TRIGGER grade_changes

 BEFORE UPDATE
 
 ON alunos_grades
 
 FOR EACH ROW
 
 EXECUTE PROCEDURE log_last_grade_changes();

INSERT INTO alunos(id_aluno, name) VALUES
    (1, 'alan'),
    (2, 'adrian');

INSERT INTO alunos_grades (id_grade, id_aluno, grade) VALUES
    (1, 1, 10.0),
    (2, 2, 5.5);

UPDATE alunos_grades SET grade = 7.0 WHERE id_grade = 1;

SELECT * FROM alunos_grades_audit;