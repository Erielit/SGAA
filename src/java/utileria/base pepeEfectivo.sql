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
from quarter_number qn
         INNER JOIN status s on qn.id_status = s.id_status
where s.status = 'Activo';
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_docent
as
select *
from docent d
         inner join person p on d.id_person = p.id_person
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_quarter
as
select *
from quarter q
         inner join status s on q.id_status = s.id_status
where s.status = 'Activo'
go

-----------------------------------------------------------------------------------------------------------------------

create procedure change_all_status_career
as
begin
    DECLARE @activo int;

    SELECT @activo = id_status from status where status = 'Activo';
    update career set id_status = @activo;
end;
go

exec change_all_status_career;
go
-----------------------------------------------------------------------------------------------------------------------

create procedure sp_list_career
as
select *
from career c
         inner join status s on c.id_status = s.id_status
where s.status = 'Activo';
go

-----------------------------------------------------------------------------------------------------------------------

create procedure sp_new_group(@numero_cuatri int,
                              @letra int,
                              @docente int,
                              @cuatrimestre int,
                              @carrera int,
                              @estado int)
as
begin

    DECLARE @rol_tutor_base int;
    DECLARE @rol_tutor_docente int;

    set @rol_tutor_docente = 0;

    SELECT @rol_tutor_base = id_role from role where name = 'TUTOR';
    SELECT @rol_tutor_docente = ur.id_rol
    from docent d
             inner join person p on d.id_person = p.id_person
             inner join users u on p.id_person = u.id_person
             inner join user_role ur on u.id_user = ur.id_user
             inner join role r2 on ur.id_rol = r2.id_role
    where d.id_docent = @docente
      and r2.name = 'TUTOR';


    if (@rol_tutor_base != @rol_tutor_docente)
        insert into user_role (id_rol, id_user) VALUES (@rol_tutor_base, @docente);

    insert into groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
    VALUES (@numero_cuatri, @letra, @docente, @cuatrimestre, @carrera, @estado);
end;

go

-----------------------------------------------------------------------------------------------------------------------
-- LOS DE GERA
-----------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_getInfoQuarter(@idQuarter INT)
AS
SELECT *
FROM quarter
WHERE id_quarter = @idQuarter;
GO

-----------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_getQuarters
AS
SELECT *
FROM quarter;
GO


-----------------------------------------------------------------------------------------------------------------------
-- LOS SEGUNDOS DESPUES DE QUE AVISE
-----------------------------------------------------------------------------------------------------------------------


create procedure sp_get_group(@idGrupo int)
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
where g.id_group = @idGrupo
    ;
go
-----------------------------------------------------------------------------------------------------------------------

create procedure sp_mod_group(@numero_cuatri int,
                              @letra int,
                              @docente int,
                              @cuatrimestre int,
                              @carrera int,
                              @estado int,
                              @grupo int)
as
begin

    DECLARE @rol_tutor_base int;
    DECLARE @rol_tutor_docente int;

    set @rol_tutor_docente = 0;

    SELECT @rol_tutor_base = id_role from role where name = 'TUTOR';
    SELECT @rol_tutor_docente = ur.id_rol
    from docent d
             inner join person p on d.id_person = p.id_person
             inner join users u on p.id_person = u.id_person
             inner join user_role ur on u.id_user = ur.id_user
             inner join role r2 on ur.id_rol = r2.id_role
    where d.id_docent = @docente
      and r2.name = 'TUTOR';


    if (@rol_tutor_base != @rol_tutor_docente)
        insert into user_role (id_rol, id_user) VALUES (@rol_tutor_base, @docente);

    update groups
    set id_quarter_number= @numero_cuatri,
        id_letter= @letra,
        id_docent= @docente,
        id_quarter= @cuatrimestre,
        id_career= @carrera,
        id_status= @estado
    where id_group = @grupo
end;

    select * from letter;

go
