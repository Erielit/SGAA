use asesorias;

CREATE PROCEDURE sp_getStudentsCourse(@idCourse INT)
AS
SELECT CS.id_course_student,
       S.id_student,
       S.matricula,
       P.name,
       P.last_name,
       P.second_last_name,
       CS.assists,
       c.registry_date
FROM course_student CS
         INNER JOIN student S ON CS.id_student = S.id_student
         INNER JOIN person P ON S.id_person = P.id_person
         INNER JOIN course c on CS.id_course = c.id_course
WHERE CS.id_course = @idCourse;
GO

SELECT *
FROM course c
         inner join student s on c.id_student = s.id_student
         inner join group_student gs on s.id_student = gs.id_student;

select *
from group_student;

-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------Usar solo apartir de aqui------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

--Correcion procedimiento de gera
CREATE PROCEDURE sp_getStudentsCourse(@idCourse INT)
AS
SELECT CS.id_course_student,
       S.id_student,
       S.matricula,
       P.name,
       P.last_name,
       P.second_last_name,
       CS.assists,
       c.registry_date
FROM course_student CS
         INNER JOIN student S ON CS.id_student = S.id_student
         INNER JOIN person P ON S.id_person = P.id_person
         INNER JOIN course c on CS.id_course = c.id_course
WHERE CS.id_course = @idCourse;
GO


-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_groups
as
select *
from groups g
         inner join quarter_number qn on g.id_quarter_number = qn.id_quarter_number
         inner join letter l on g.id_letter = l.id_letter
         inner join docent d on g.id_docent = d.id_docent
         inner join person p on d.id_person = p.id_person
         inner join quarter q on g.id_quarter = q.id_quarter
         inner join career c on g.id_career = c.id_career
         INNER JOIN status s on g.id_status = s.id_status
    ;
go


-----------------------------------------------------------------------------------------------------------------------

create procedure change_status_group(@grupo int)
as
begin
    DECLARE @activo int;
    DECLARE @inactivo int;
    DECLARE @actual int;

    SELECT @activo = id_status from status where status = 'Activo';
    SELECT @inactivo = id_status from status where status = 'Inactivo';
    SELECT @actual = id_status from groups where id_group = @grupo;

    if (@actual = @activo)
        update groups set id_status = @inactivo where id_group = @grupo;
    ELSE
        update groups set id_status = @activo where id_group = @grupo;
end;


-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_letter
    as
    select *
    from letter;
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_estatus
    as
    select *
    from status;
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_quarter_number
    as
    select *
    from quarter_number qn INNER JOIN  status s on qn.id_status = s.id_status where s.status = 'Activo';
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_docent
    as
    select *
    from docent d inner join person p on d.id_person = p.id_person
go

-----------------------------------------------------------------------------------------------------------------------

INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 1, 1, 1, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 1, 1, 1, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 2, 1, 1, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 3, 1, 2, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 4, 1, 2, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 5, 1, 3, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 6, 1, 3, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 7, 1, 4, 1);
INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 8, 1, 4, 1);
GO


