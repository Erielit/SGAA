-- DROp DATABASE asesorias;
CREATE DATABASE asesorias;
GO

-- USE master;
USE asesorias;
GO

CREATE TABLE gender
(
    id_gender INT         NOT NULL IDENTITY (1,1),
    gender    varchar(25) NOT NULL,
    PRIMARY KEY (id_gender)
);
GO

INSERT INTO gender(gender)
VALUES ('Femenino'),
       ('Masculino');
GO

CREATE TABLE status
(
    id_status INT NOT NULL IDENTITY (1,1),
    status    varchar(50),
    CONSTRAINT pk_primary PRIMARY KEY (id_status)
);
GO

INSERT INTO status(status)
VALUES ('Activo'),
       ('Inactivo');
GO

CREATE TABLE person
(
    id_person        INT         NOT NULL IDENTITY (1,1),
    curp             varchar(18) NOT NULL UNIQUE,
    name             varchar(45) NOT NULL,
    last_name        varchar(25) NOT NULL,
    second_last_name varchar(25) NOT NULL,
    day_birth        date        NOT NULL,
    gender_id_gender INT         NOT NULL,
    id_status        INT         NOT NULL,
    PRIMARY KEY (id_person),
    CONSTRAINT fk_person_gender FOREIGN KEY (gender_id_gender) REFERENCES gender (id_gender),
    CONSTRAINT fk_status5 FOREIGN KEY (id_status) REFERENCES status (id_status)
);
GO

INSERT INTO person(curp, name, last_name, second_last_name, day_birth, gender_id_gender, id_status)
VALUES ('MOVM980119HMCRLG01', 'Miguel', 'Moreno', 'Velásquez', '1998-01-19', 2, 1),
       ('ZAHJ091112MCRLDP03', 'Zaira', 'Hernández', 'Jímenez', '1999-12-12', 1, 1),
       ('GERA991212HMSELD01', 'Gerardo', 'Gabriel', 'Morales', '1999-12-12', 2, 1),
       ('SEAM890211MCRLDP03', 'Sebastian', 'Asenjo', 'Mancera', '1989-02-11', 2, 1),
       ('JOBF910102MCRLDP03', 'José', 'Barrachina', 'Flores', '1991-01-02', 2, 1),
       ('AUBJ901022MCRLDP03', 'Aurora', 'Berrio', 'Jímenez', '1990-10-22', 1, 1),
       ('PIBS890809MCRLDP03', 'Pilar', 'Barrios', 'Santana', '1989-08-09', 1, 1),
       ('ISAA920929MCRLDP03', 'Isabel', 'Ayala', 'Abella', '1992-09-29', 1, 1),
       ('PALP961122MCRLDP03', 'Pablo', 'Lomas', 'Palomo', '1996-11-22', 2, 1),
       ('MAHO911223MCRLDP03', 'Mario', 'Hernández', 'Orihuela', '1991-12-23', 2, 1),
       ('SUSA990427MMCDOL04', 'Susana', 'Gonzalez', 'Villanueva', '1999-04-27', 1, 1);
GO

CREATE TABLE users
(
    id_user    INT         NOT NULL IDENTITY (1,1),
    email      varchar(45) NOT NULL UNIQUE,
    password   varchar(15) NOT NULL,
    reset_code varchar(20) DEFAULT NULL,
    id_person  INT         NOT NULL,
    PRIMARY KEY (id_user),
    CONSTRAINT fk_user_person1 FOREIGN KEY (id_person) REFERENCES person (id_person)
);
GO

INSERT INTO users(email, password, reset_code, id_person)
VALUES ('angelmoreno@utez.edu.mx', 'Angel123', NULL, 1),--docente, admin
       ('zairahernandez@utez.edu.mx', 'Zairaz123', NULL, 2),--tutor
       ('gerardogabriel@utez.edu.mx', 'Gera1234', NULL, 3),--estudiante
       ('sebastianasenjo@utez.edu.mx', 'sebastianasenjo', NULL, 4),--tutor
       ('josebarrachina@utez.edu.mx', 'josebarrachina', NULL, 5),--tutor
       ('auroraberrio@utez.edu.mx', 'auroraberrio', NULL, 6),--tutor
       ('pilarbarrios@utez.edu.mx', 'pilarbarrios', NULL, 7),--tutor
       ('isabelayala@utez.edu.mx', 'isabelayala', NULL, 8),--tutor
       ('pablolomas@utez.edu.mx', 'pablolomas', NULL, 9),--tutor
       ('mariohernandez@utez.edu.mx', 'mariohernandez', NULL, 10),--tutor
       ('susanagonzalez@utez.edu.mx', 'susanagonzalez', NULL, 11);--estudiante
GO

CREATE TABLE role
(
    id_role     INT         NOT NULL IDENTITY (1,1),
    name        varchar(45) NOT NULL,
    description varchar(45) NOT NULL,
    PRIMARY KEY (id_role)
);
GO

INSERT INTO role(name, description)
VALUES ('ADMIN', 'Administra todo'),
       ('ESTUDIANTE', 'Usuario que hará uso del sistema'),
       ('DOCENTE', 'Es quien impartirá las asesorias'),
       ('TUTOR', 'El el encargado del control de un grupo'),
       ('COODINADOR', 'Es quien requiere de estadisticas');
GO

CREATE TABLE user_role
(
    id_user_role INT NOT NULL IDENTITY (1,1),
    id_rol       INT NOT NULL,
    id_user      INT NOT NULL,
    PRIMARY KEY (id_user_role),
    CONSTRAINT fk_user_role_rol1 FOREIGN KEY (id_rol) REFERENCES role (id_role),
    CONSTRAINT fk_user_role_user1 FOREIGN KEY (id_user) REFERENCES users (id_user)
);
GO

INSERT INTO user_role(id_rol, id_user)
VALUES (1, 1),
       (3, 1),
       (3, 2),
       (2, 3),
       (3, 4),
       (3, 5),
       (3, 6),
       (3, 7),
       (3, 8),
       (3, 9),
       (3, 10),
       (2, 11),
       (4, 2);
GO

CREATE TABLE permission
(
    id_permiso  INT NOT NULL,
    name        varchar(45) DEFAULT NULL,
    description varchar(45) DEFAULT NULL,
    PRIMARY KEY (id_permiso)
);
GO

CREATE TABLE permission_role
(
    id_permiss_role INT NOT NULL IDENTITY (1,1),
    id_permiso      INT NOT NULL,
    id_role         INT NOT NULL,
    PRIMARY KEY (id_permiss_role),
    CONSTRAINT fk_permiss1 FOREIGN KEY (id_permiso) REFERENCES permission (id_permiso),
    CONSTRAINT fk_role1 FOREIGN KEY (id_role) REFERENCES role (id_role)
);
GO

CREATE TABLE academic_division
(
    id_academic_division int         NOT NULL IDENTITY (1,1),
    academic_division    varchar(70) NOT NULL,
    PRIMARY KEY (id_academic_division)
);
GO

INSERT INTO academic_division(academic_division)
VALUES ('División Académica Tecnologías de la Información y Comunicación');
GO

CREATE TABLE career
(
    id_career            INT          NOT NULL IDENTITY (1,1),
    name                 varchar(45)  NOT NULL,
    acronym              varchar(45)  NOT NULL,
    description          varchar(200) NOT NULL,
    id_academic_division INT          NOT NULL,
    id_status            int,
    PRIMARY KEY (id_career),
    CONSTRAINT fk_academic_division1 FOREIGN KEY (id_academic_division)
        REFERENCES academic_division (id_academic_division),
    constraint fk_career_status foreign key (id_status) references status (id_status)
);
GO

INSERT INTO career(name, acronym, description, id_academic_division)
VALUES ('Tecnologías de la Información y Comunicación', 'ING_TEC_INFO',
        'Dirección y planeación de proyectos de TI, usando procesos, estándares y modelos de calidad en TI.', 1),
       ('Diseño Textil y Moda', 'ING_DIS_TEXT', 'Intervención del diseño y acabado textil en prendas terminadas.', 1),
       ('Diseño Digital y Producción Audiovisual', 'LIC_DIS_DIG',
        'Creación de elementos visuales u objetos gráficos utilizando herramientas digitales con la finalidad de ser usados por productores de películas y cortometrajes animados.',
        1),
       ('Desarrollo de Software Multiplataforma', 'TSU_SOFT_MULTI',
        'Implementación de soluciones multiplataforma en la nube y software embebido, entornos seguros mediante la adquisición y administración de datos e ingenieria de software.',
        1),
       ('Infraestructura de Redes Digitales', 'TSU_RED_DIG',
        'Diseño, implementación y detección de fallos en redes digitales.', 1),
       ('Animación', 'TSU_DIS_DIG',
        'Creación de elementos visuales u objetos gráficos utilizando herramientas digitales con la finalidad de ser usados por productores de películas y cortometrajes animados.',
        1),
       ('Producción', 'TSU_DIS_MOD',
        'Diseño de prendas de vestir conforme a las tendencias de la moda, así como dirigir la manufactura de los procesos textiles y de la confección con base a los estándares de calidad.',
        1);
GO

CREATE TABLE docent
(
    id_docent       INT          NOT NULL IDENTITY (1,1),
    professional_id varchar(45)  NOT NULL UNIQUE,
    description     varchar(100) NOT NULL,
    id_person       INT          NOT NULL,
    PRIMARY KEY (id_docent),
    CONSTRAINT fk_person1 FOREIGN KEY (id_person) REFERENCES person (id_person)
);
GO

INSERT INTO docent (professional_id, description, id_person)
VALUES ('ZAIHER99', 'Profesora apta para aplicar materias asociadas a la carrera', 2),
       ('SEBASE89', 'Profesor apto para aplicar materias asociadas a la carrera', 4),
       ('JOSBAR91', 'Profesor apto para aplicar materias asociadas a la carrera', 5),
       ('AURBER90', 'Profesora apta para aplicar materias asociadas a la carrera', 6),
       ('PILBAR89', 'Profesora apta para aplicar materias asociadas a la carrera', 7),
       ('ISAAYA92', 'Profesora apta para aplicar materias asociadas a la carrera', 8),
       ('PABLON96', 'Profesor apto para aplicar materias asociadas a la carrera', 9),
       ('MARHER91', 'Profesor apto para aplicar materias asociadas a la carrera', 10),
       ('MIKES98', 'Profesor apto para aplicar materias asociadas a la carrera', 1);
GO

/*CREATE TABLE  docent_division  (
   id_docent_division  INT NOT NULL IDENTITY(1,1),
   id_academic_division  INT NOT NULL,
   id_docent  INT NOT NULL,
  PRIMARY KEY ( id_docent_division ),

  CONSTRAINT  fk_academic_division2  FOREIGN KEY ( id_academic_division ) REFERENCES  academic_division  ( id_academic_division ),
  CONSTRAINT  fk_docent1  FOREIGN KEY ( id_docent ) REFERENCES  docent  ( id_docent )
);
GO*/

CREATE TABLE letter
(
    id_letter INT         NOT NULL IDENTITY (1,1),
    letter    varchar(45) NOT NULL,
    PRIMARY KEY (id_letter)
);
GO

INSERT INTO letter(letter)
VALUES ('A'),
       ('B'),
       ('C'),
       ('D'),
       ('E'),
       ('F'),
       ('G');
GO

CREATE TABLE quarter
(
    id_quarter    INT         NOT NULL IDENTITY (1,1),
    quarter_name  varchar(45) NOT NULL,
    quarter_start date        NOT NULL,
    quarter_end   date        NOT NULL,
    id_status     INT         NOT NULL,
    PRIMARY KEY (id_quarter),
    CONSTRAINT fk_status4 FOREIGN KEY (id_status) REFERENCES status (id_status)
);
GO

INSERT INTO quarter(quarter_name, quarter_start, quarter_end, id_status)
VALUES ('ENE-ABR 2020', '2020-01-01', '2020-04-30', 1);
GO

CREATE TABLE quarter_number
(
    id_quarter_number INT NOT NULL IDENTITY (1,1),
    id_status         INT NOT NULL,
    quarter_number    INT NOT NULL,
    PRIMARY KEY (id_quarter_number),
    CONSTRAINT fk_status3 FOREIGN KEY (id_status) REFERENCES status (id_status)
);
GO

INSERT INTO quarter_number(id_status, quarter_number)
VALUES (2, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (1, 5),
       (2, 6),
       (2, 7),
       (1, 8),
       (2, 9),
       (2, 10),
       (2, 11);
GO

CREATE TABLE groups
(
    id_group          INT  NOT NULL IDENTITY (1,1),
    id_quarter_number INT  NOT NULL,
    id_letter         INT  NOT NULL,
    id_docent         INT  NOT NULL,
    id_quarter        INT  NOT NULL,
    id_career         int  not null,
    registry_date     date NOT NULL default getdate(),
    id_status         int,
    PRIMARY KEY (id_group),
    CONSTRAINT fk_docent4 FOREIGN KEY (id_docent) REFERENCES docent (id_docent),
    CONSTRAINT fk_letter1 FOREIGN KEY (id_letter) REFERENCES letter (id_letter),
    CONSTRAINT fk_quarter1 FOREIGN KEY (id_quarter) REFERENCES quarter (id_quarter),
    constraint fk_career_group foreign key (id_career) references career (id_career),
    CONSTRAINT fk_quarter_number2 FOREIGN KEY (id_quarter_number) REFERENCES quarter_number (id_quarter_number),
    constraint fk_status foreign key (id_status) references status (id_status)
);
GO

INSERT INTO groups (id_quarter_number, id_letter, id_docent, id_quarter, id_career, id_status)
VALUES (8, 1, 1, 1, 1, 1),
       (8, 1, 2, 1, 1, 1),
       (8, 1, 3, 1, 2, 1),
       (8, 1, 4, 1, 2, 1),
       (8, 1, 5, 1, 3, 1),
       (8, 1, 6, 1, 3, 1),
       (8, 1, 7, 1, 4, 1),
       (8, 1, 8, 1, 4, 1);
GO

CREATE TABLE student
(
    id_student INT         NOT NULL IDENTITY (1,1),
    matricula  varchar(14) NOT NULL,
    id_career  INT         NOT NULL,
    id_person  INT         NOT NULL,
    PRIMARY KEY (id_student),
    CONSTRAINT fk_career1 FOREIGN KEY (id_career) REFERENCES career (id_career),
    CONSTRAINT fk_person2 FOREIGN KEY (id_person) REFERENCES person (id_person)
);
GO

INSERT INTO student (matricula, id_career, id_person)
VALUES ('20173TI018', 2, 3),
       ('20173TI092', 2, 11);
GO

CREATE TABLE group_student
(
    id_group_student INT NOT NULL IDENTITY (1,1),
    id_student       INT NOT NULL,
    id_group         INT NOT NULL,
    PRIMARY KEY (id_group_student),
    CONSTRAINT fk_group1 FOREIGN KEY (id_group) REFERENCES groups (id_group),
    CONSTRAINT fk_student3 FOREIGN KEY (id_student) REFERENCES student (id_student)
);
GO

INSERT INTO group_student (id_student, id_group)
VALUES (1, 1),
       (2, 1);
GO

CREATE TABLE schedule
(
    id_schedule_details INT  NOT NULL IDENTITY (1,1),
    advisory_start      time NOT NULL,
    advisory_end        time NOT NULL,
    status_name         varchar(15) default 'Activo',
    PRIMARY KEY (id_schedule_details)
);
GO

INSERT INTO schedule(advisory_start, advisory_end)
values ('13:00:00', '14:00:00'),
       ('13:00:00', '15:00:00'),
       ('14:00:00', '15:00:00'),
       ('14:00:00', '16:00:00');
GO


CREATE TABLE subject
(
    id_subject        INT          NOT NULL IDENTITY (1,1),
    ident_subject     varchar(10)  NOT NULL,
    name              varchar(70)  NOT NULL,
    description       varchar(200) NOT NULL,
    id_quarter_number INT          NOT NULL,
    id_career         int          not null,
    id_status         INT          NOT NULL,
    PRIMARY KEY (id_subject),
    CONSTRAINT fk_quarter_number1 FOREIGN KEY (id_quarter_number) REFERENCES quarter_number (id_quarter_number),
    CONSTRAINT fk_status1 FOREIGN KEY (id_status) REFERENCES status (id_status),
    CONSTRAINT fk_career_subject FOREIGN KEY (id_career) REFERENCES career (id_career)
);
GO

INSERT INTO subject(ident_subject, name, description, id_quarter_number, id_career, id_status)
VALUES ('ADMON_PROY', 'Administración de proyectos de T.I. I', 'Seguimientos de CMMI', 8, 1, 1),
       ('BD_APP', 'Base de datos para aplicaciones',
        'Modelado de bases de datos relacionales y sentencias SQL avanzadas', 8, 1, 1),
       ('RED_CONV', 'Redes convergentes',
        'Modelado de redes y aplicar estándares para una red con la mayor calidad posible.', 8, 1, 1),
       ('SIS_CAD', 'Sistemas de calidad',
        'Conocer y aplicar las normas y estándares para desarrollar sistemas de informáticos con la más alta calidad.',
        8, 1, 1),
       ('PLAN_TRA', 'Planeación del trabajo', 'Desarrollar e implementar un plan estratégico.', 8, 1, 1),
       ('LEN_EXT', 'Inglés VII', 'Desarrollar un nivel B1 para en la lengua inglesa.', 8, 1, 1);
GO

INSERT INTO subject(ident_subject, name, description, id_quarter_number, id_career, id_status)
VALUES ('QUI_TEXT', 'Química para Acabados Textiles', 'Uso de sustancias para los acabados textiles.', 8, 2, 1),
       ('SIS_MAN', 'Sistemas de Manufactura', 'Herramientas para la manufactura de textiles.', 8, 2, 1),
       ('HIS_MOD', 'Historia y Sociologia de la Moda', 'Historia de la moda a través de los años.', 8, 2, 1),
       ('DIS_TEL', 'Diseño de Telas', 'Diseño de telas usando nuevas tecnologías.', 8, 2, 1),
       ('TEC_DIS', 'Nuevas Tecnologías Aplicadas al Diseño de Modas',
        'Implementación de tecnologías para el diseño de modas.', 8, 2, 1),
       ('PLA_TRA', 'Planeación y Organización del Trabajo', 'Desarrollar e implementar un plan estratégico.', 8, 2, 1),
       ('LEN_EXT', 'Inglés VII', 'Desarrollar un nivel B1 para en la lengua inglesa.', 8, 2, 1);
GO

CREATE TABLE subject_docent
(
    id_subject_docent INT NOT NULL IDENTITY (1,1),
    id_subject        INT NOT NULL,
    id_docent         INT NOT NULL,
    id_status         INT NOT NULL,
    PRIMARY KEY (id_subject_docent),
    CONSTRAINT fk_docent3 FOREIGN KEY (id_docent) REFERENCES docent (id_docent),
    CONSTRAINT fk_status2 FOREIGN KEY (id_status) REFERENCES status (id_status),
    CONSTRAINT fk_subject1 FOREIGN KEY (id_subject) REFERENCES subject (id_subject)
);
GO

INSERT INTO subject_docent (id_subject, id_docent, id_status)
VALUES ('2', '9', '1'),
       ('1', '1', '1'),
       ('2', '1', '1'),
       (7, 2, 1),
       (8, 2, 1),
       (9, 3, 1);
GO

create table course_status
(
    id_course_status int identity (1,1) primary key,
    course_status    varchar(20)
);
GO

insert into course_status(course_status)
values ('Pendiente'),
       ('Aceptada'),
       ('Cancelada'),
       ('Completada'),
       ('Rechazada');
GO

CREATE TABLE course
(
    id_course           INT  NOT NULL IDENTITY (1,1),
    id_schedule_details INT  NOT NULL,
    registry_date       date NOT NULL,
    id_student          INT  NOT NULL,
    id_subject_docent   INT  NOT NULL,
    id_course_status    INT  NOT NULL,
    PRIMARY KEY (id_course),
    CONSTRAINT fk_schedule1 FOREIGN KEY (id_schedule_details) REFERENCES schedule (id_schedule_details),
    CONSTRAINT fk_student2 FOREIGN KEY (id_student) REFERENCES student (id_student),
    CONSTRAINT fk_subject_docent1 FOREIGN KEY (id_subject_docent) REFERENCES subject_docent (id_subject_docent),
    constraint fk_status_course foreign key (id_course_status) references course_status (id_course_status)
);
GO

CREATE TABLE course_student
(
    id_course_student INT NOT NULL IDENTITY (1,1),
    id_course         INT NOT NULL,
    id_student        INT NOT NULL,
    assists           INT NOT NULL,
    PRIMARY KEY (id_course_student),
    CONSTRAINT fk_course1 FOREIGN KEY (id_course) REFERENCES course (id_course),
    CONSTRAINT fk_student1 FOREIGN KEY (id_student) REFERENCES student (id_student)
);
GO

CREATE TABLE notifications
(
    id_notification INT identity (1,1) NOT NULL,
    message         varchar(200)       NOT NULL,
    subject         varchar(45)        NOT NULL,
    registry_date   date               NOT NULL,
    id_course       INT                NOT NULL,
    seen            INT                NOT NULL,
    destinatario    int                not null,
    PRIMARY KEY (id_notification),
    CONSTRAINT fk_course2 FOREIGN KEY (id_course) REFERENCES course (id_course)
);
GO

-- Pendiente, Completada.
create table directed
(
    id_directed       int identity (1,1) primary key not null,
    registry_date     date                           not null default getdate(),
    directed_status   varchar(15)                    not null default 'Pendiente',
    id_group_student  int                            not null,
    id_course_student int                            null,
    constraint fk_directed_gs foreign key (id_group_student) references group_student (id_group_student),
    constraint fk_directed_cs foreign key (id_course_student) references course_student (id_course_student)
);
GO

create table notification_directed
(
    id_notification_directed int identity (1,1) primary key not null,
    massage                  VARCHAR(200)                   not null,
    subject                  VARCHAR(45)                    not null,
    registry_date            date                           not null default getdate(),
    seen                     int                            not null default 2,
    destination              int                            not null,
    id_directed              int                            not null,
    constraint fk_directed_nd foreign key (id_directed) references directed (id_directed)
);
GO

---------------------------------------------------------------------------------------
create procedure iniciarSesion(@username varchar(50),
                               @password varchar(50))
as
select users.id_user,
       users.email,
       users.reset_code,
       person.id_person,
       person.curp,
       person.name,
       person.last_name,
       person.second_last_name,
       person.day_birth,
       gender.id_gender,
       gender.gender,
       status.id_status,
       status.status,
       role.id_role,
       role.name as role,
       role.description
from users
         join person on person.id_person = users.id_person
         join gender on gender.id_gender = person.gender_id_gender
         join status on status.id_status = person.id_status
         join user_role on user_role.id_user = users.id_user
         join role on role.id_role = user_role.id_rol
where users.email = @username
  and users.password = @password;
GO

exec iniciarSesion 'angelmoreno@utez.edu.mx', 'Angel123';
GO
exec iniciarSesion 'gerardogabriel@utez.edu.mx', 'Gera1234';
go
create procedure sp_get_student(
    @id_person2 int
)
as
select *
from student
         join career on career.id_career = student.id_career
where id_person = @id_person2;
GO

exec sp_get_student 3;
-------------------------------------------------
go
create procedure sp_list_schedule
as
select schedule.id_schedule_details,
       convert(varchar, schedule.advisory_start, 108) as advisory_start,
       convert(varchar, schedule.advisory_end, 108)   as advisory_end,
       schedule.status_name
from schedule;
GO

exec sp_list_schedule;
--------------------------------------------
go
create procedure sp_list_subject(@career int, @estudiante int)
as
declare @id_quar_number int;
    set @id_quar_number = (select id_quarter_number
                           from groups
                                    join group_student on groups.id_group = group_student.id_group
                           where group_student.id_student = @estudiante);
select subject.*
from subject
         join career on career.id_career = subject.id_career
where subject.id_career = @career
  and subject.id_quarter_number = @id_quar_number
  and subject.id_status = 1;
go


exec sp_list_subject 1, 1;
-- ------------------------------------------------------------------------
go
create procedure sp_list_docent_subject(@subject_id int)
as
select *
from person
         join docent on docent.id_person = person.id_person
         join subject_docent on subject_docent.id_docent = docent.id_docent
         join subject on subject.id_subject = subject_docent.id_subject
where subject.id_subject = @subject_id;
GO


exec sp_list_docent_subject @subject_id = 11;
-------------------------------------------------------
GO
create procedure sp_add_course(@docent int,
                               @materia int,
                               @horario int,
                               @estudiante int,
                               @fecha varchar(14))
as
begin
    declare @id_docente_materia int;
    declare @id_persona_docente int;
    declare @id_course int;
    set @id_docente_materia =
            (select id_subject_docent from subject_docent where id_docent = @docent and id_subject = @materia);
    insert into course (id_schedule_details, id_student, id_subject_docent, registry_date, id_course_status)
    values (@horario, @estudiante, @id_docente_materia, @fecha, 1);
    set @id_course = (select top 1 id_course from course order by id_course desc);
    set @id_persona_docente = (select P.id_person
                               from person P
                                        join docent D on D.id_person = P.id_person
                               where D.id_docent = @docent);
    insert into notifications(message, subject, id_course, registry_date, destinatario, seen)
    values ('Se ha registrado una asesoria', 'Nueva asesoria', @id_course, getdate(), @id_persona_docente, 1);
    insert into course_student(id_course, id_student, assists) values (@id_course, @estudiante, 0);
end;
GO

select *
from course;
select *
from notifications;
select *
from course_student;
-----
GO
create procedure sp_get_quarter
as
begin
    select * from quarter where id_status = 1;
end;
GO
exec sp_get_quarter;
GO
select *
from quarter;
----------------------------------------------------------
GO
create procedure sp_list_asesorias(
    @estudiante int
)
as
begin
    select course.id_course,
           schedule.id_schedule_details,
           course.registry_date,
           schedule.advisory_start,
           schedule.advisory_end
    from course
             join schedule on course.id_schedule_details = schedule.id_schedule_details
    where id_student = @estudiante
      and (id_course_status = 1 or id_course_status = 2);
end;
GO
exec sp_list_asesorias 1;
GO

select *
from course;

GO
create procedure sp_list_asesorias_all(
    @estudiante int
)
as
begin
    select course_status.course_status,
           course.registry_date,
           schedule.advisory_start,
           schedule.advisory_end,
           course.id_course,
           subject.name                                                             as materia,
           CONCAT(person.name, ' ', person.last_name, ' ', person.second_last_name) as persona
    from course
             join schedule on course.id_schedule_details = schedule.id_schedule_details
             join subject_docent on course.id_subject_docent = subject_docent.id_subject_docent
             join subject on subject.id_subject = subject_docent.id_subject
             join docent on subject_docent.id_docent = docent.id_docent
             join person on docent.id_person = person.id_person
             join course_status on course.id_course_status = course_status.id_course_status
    where course.id_student = 1;
end;
GO

exec sp_list_asesorias_all 1;

-------------------------------------------------------
GO
create procedure sp_details_course(
    @id_course int
)
as
begin
    select course.registry_date,
           schedule.advisory_start,
           schedule.advisory_end,
           course.id_course,
           subject.name                                                             as materia,
           CONCAT(person.name, ' ', person.last_name, ' ', person.second_last_name) as persona
    from course
             join schedule on course.id_schedule_details = schedule.id_schedule_details
             join subject_docent on course.id_subject_docent = subject_docent.id_subject_docent
             join subject on subject.id_subject = subject_docent.id_subject
             join docent on subject_docent.id_docent = docent.id_docent
             join person on docent.id_person = person.id_person
    where course.id_course = @id_course;
end;
GO

exec sp_details_course 3;
---------------------------------------------
GO
create procedure sp_cancel_course(
    @id_course int
)
as
begin
    update course set id_course_status = 4 where id_course = @id_course;
end;
GO


select *
from course_status;
select *
from course;
select *
from notifications;
select *
from course_student;
select *
from student;
select *
from group_student;
select *
from groups
         join docent on docent.id_docent = groups.id_docent;
select *
from role
         join user_role on role.id_role = user_role.id_rol
         join users on users.id_user = user_role.id_user;
-----------------------------------------------
-------------------------| DOCENTE |------------------------------------
GO
create procedure sp_aceptar_course(
    @asesoria int
)
as
begin
    declare @estudiante int;
    set @estudiante = (select P.id_person
                       from person P
                                join student S on S.id_person = P.id_person
                                join course C on C.id_student = S.id_student
                       where C.id_course = @asesoria);
    update course set id_course_status = 2 where id_course = @asesoria;
    insert into notifications (id_course, destinatario, seen, registry_date, message, subject)
    values (@asesoria, @estudiante, 0, getdate(), 'Se ha aceptado la asesoria solicitada.', 'Aceptar asesoria');
end;

GO
create procedure sp_rechazar_course(
    @asesoria int
)
as
begin
    declare @estudiante int;
    set @estudiante = (select P.id_person
                       from person P
                                join student S on S.id_person = P.id_person
                                join course C on C.id_student = S.id_student
                       where C.id_course = @asesoria);
    update course set id_course_status = 5 where id_course = @asesoria;
    insert into notifications (id_course, destinatario, seen, registry_date, message, subject)
    values (@asesoria, @estudiante, 0, getdate(), 'Se ha rechazado la asesoria solicitada.', 'Rechazar asesoria');
end;
GO


--------------------------------------------------------------------------
GO
create procedure sp_group_student(
    @id_student int
)
as
begin
    select id_group from group_student where group_student.id_student = @id_student;
end;
GO

exec sp_group_student 1;

GO
create procedure sp_list_students_gp(@id_group int,
                                     @id_student int,
                                     @fecha varchar(15))
as
begin
    select person.name, person.last_name, person.second_last_name, student.id_student
    from person
             join student on person.id_person = student.id_person
             inner join group_student on student.id_student = group_student.id_student
    where id_group = @id_group
      and student.id_student != @id_student
      and student.id_student not in (
        select CS.id_student
        from course_student CS
                 join course C on C.id_course = CS.id_course
        where C.registry_date = @fecha
    );
end;
GO

select person.name, person.last_name, person.second_last_name, student.id_student
from person
         join student on person.id_person = student.id_person
         inner join group_student on student.id_student = group_student.id_student
where id_group = 1
  and student.id_student != 2
  and student.id_student not in (
    select CS.id_student
    from course_student CS
             join course C on C.id_course = CS.id_course
    where C.registry_date = '2020-03-04'
);

select *
from role;

-------------------------------| Listar estudiante asesoria |------------------------------------
GO
create procedure list_students_course(
    @curso int
)
as
begin
    SELECT *
    FROM person AS P
             INNER JOIN student AS S ON P.id_person = S.id_person
             JOIN course_student AS CS ON S.id_student = CS.id_student
             INNER JOIN course AS C ON CS.id_course = C.id_course
    where C.id_course = @curso;
end;

    exec list_students_course 1;

select *
from course_student;

GO
create procedure sp_add_students_course(@estudiante int,
                                        @course int)
as
begin
    declare @persona int;
    set @persona = (select P.id_person
                    from person P
                             join student S on P.id_person = S.id_person
                    where S.id_student = @estudiante);
    insert into course_student (id_course, id_student, assists) values (@course, @estudiante, 0);

    insert into notifications (id_course, destinatario, seen, registry_date, message, subject)
    values (@course, @persona, 0, getdate(), 'Te han invitado a asistir a una asesoria.', 'Invitación a asesoria');
end;
GO

create procedure sp_list_notifications(
    @persona int
)
as
begin
    select * from notifications where destinatario = @persona;
end;
GO

---------------------| Horario |----------------------------
GO
create procedure add_schedule(@hora_inicio varchar(20),
                              @hora_fin varchar(20))
as
begin
    insert into schedule (advisory_start, advisory_end, status_name) values (@hora_inicio, @hora_fin, 'Activo');
end;

select *
from schedule;

GO
create procedure change_status_schedule(@horario int,
                                        @estado varchar(15))
as
begin
    update schedule set status_name = @estado where id_schedule_details = @horario;
end;
GO

-- Asesorias pendientes
CREATE PROCEDURE sp_getCoursesRequests(@id_docent INT)
AS
SELECT C.id_course,
       C.id_student,
       C.id_subject_docent,
       CONVERT(varchar, C.registry_date, 13)     registry_date,
       CONVERT(varchar, S.advisory_start, 22) as advisory_start,
       CONVERT(varchar, S.advisory_end, 22)   as advisory_end,
       SU.name,
       C.id_course_status,
       CS.course_status
FROM course C
         INNER JOIN schedule S ON C.id_schedule_details = S.id_schedule_details
         INNER JOIN subject_docent SD ON C.id_subject_docent = SD.id_subject_docent
         INNER JOIN docent D ON D.id_docent = SD.id_docent
         INNER JOIN course_status CS ON C.id_course_status = CS.id_course_status
         INNER JOIN subject SU ON SD.id_subject = SU.id_subject
WHERE D.id_docent = @id_docent
  AND C.id_course_status = 1;
GO

exec sp_getCoursesRequests 2;
GO

CREATE PROCEDURE sp_getCoursesHistory(@id_docent INT)
AS
SELECT C.id_course,
       C.id_student,
       C.id_subject_docent,
       CONVERT(varchar, C.registry_date, 13)     registry_date,
       CONVERT(varchar, S.advisory_start, 22) as advisory_start,
       CONVERT(varchar, S.advisory_end, 22)   as advisory_end,
       SU.name,
       C.id_course_status,
       CS.course_status
FROM course C
         INNER JOIN schedule S ON C.id_schedule_details = S.id_schedule_details
         INNER JOIN subject_docent SD ON C.id_subject_docent = SD.id_subject_docent
         INNER JOIN docent D ON D.id_docent = SD.id_docent
         INNER JOIN course_status CS ON C.id_course_status = CS.id_course_status
         INNER JOIN subject SU ON SD.id_subject = SU.id_subject
WHERE D.id_docent = @id_docent
  AND C.id_course_status != 1
  AND C.id_course_status != 2;
GO

EXEC sp_getCoursesHistory 2;
GO

CREATE PROCEDURE sp_getPendingCourses(@id_docent INT)
AS
SELECT C.id_course,
       C.id_student,
       C.id_subject_docent,
       CONVERT(varchar, C.registry_date, 13)     registry_date,
       CONVERT(varchar, S.advisory_start, 22) as advisory_start,
       CONVERT(varchar, S.advisory_end, 22)   as advisory_end,
       SU.name,
       C.id_course_status,
       CS.course_status
FROM course C
         INNER JOIN schedule S ON C.id_schedule_details = S.id_schedule_details
         INNER JOIN subject_docent SD ON C.id_subject_docent = SD.id_subject_docent
         INNER JOIN docent D ON D.id_docent = SD.id_docent
         INNER JOIN course_status CS ON C.id_course_status = CS.id_course_status
         INNER JOIN subject SU ON SD.id_subject = SU.id_subject
WHERE D.id_docent = @id_docent
  AND C.id_course_status = 2;
GO

EXEC sp_getPendingCourses 2;
GO

CREATE PROCEDURE sp_getInfoDocent(@id_person INT)
AS
SELECT *
FROM docent
WHERE id_person = @id_person;
GO

EXEC sp_getInfoDocent 4;
GO

CREATE PROCEDURE sp_getListStudents(@id_docent INT)
AS
SELECT G.id_group,
       GS.id_student,
       GS.id_group_student,
       P.name,
       P.last_name,
       P.second_last_name,
       S.matricula,
       U.email,
       QN.quarter_number,
       L.letter,
       Q.quarter_name,
       C.name career
FROM groups G
         INNER JOIN letter L ON G.id_letter = L.id_letter
         INNER JOIN quarter Q ON Q.id_quarter = G.id_quarter
         INNER JOIN quarter_number QN ON QN.id_quarter_number = G.id_quarter_number
         INNER JOIN group_student GS ON G.id_group = GS.id_group
         INNER JOIN student S ON GS.id_student = S.id_student
         INNER JOIN career C ON S.id_career = C.id_career
         INNER JOIN person P ON S.id_person = P.id_person
         INNER JOIN users U ON P.id_person = U.id_person
         LEFT JOIN directed D ON GS.id_group_student = D.id_group_student
WHERE G.id_status = 1
  AND G.id_docent = @id_docent
  AND D.id_group_student IS NULL
GO

EXEC sp_getListStudents 1;
GO

CREATE PROCEDURE sp_newDirected(@idGroupStudent INT)
AS
DECLARE @idStudent AS INT;
DECLARE @idPerson AS INT;
    SET @idStudent = (SELECT id_student
                      FROM group_student GS
                      WHERE GS.id_group_student = @idGroupStudent);
    SET @idPerson = (SELECT P.id_person
                     FROM person P
                              INNER JOIN student S ON P.id_person = S.id_person
                     WHERE S.id_student = @idStudent);
INSERT INTO directed(id_group_student)
VALUES (@idGroupStudent);
INSERT INTO notification_directed(massage, subject, destination, id_directed)
VALUES ('Has sido canalizado', 'Canalización', @idPerson, @@IDENTITY);
GO

--CREATE PROCEDURE sp_countNotifications(@idStudent int)
--AS
--	SELECT COUNT(id_notification_directed) noNotifications FROM notification_directed WHERE destination = @idStudent AND seen = 2;
--GO

--EXEC sp_countNotifications 1;

CREATE PROCEDURE sp_getNotifications(@idPerson int)
AS
SELECT id_notification_directed, massage, subject, registry_date
FROM notification_directed
WHERE destination = @idPerson;
GO

EXEC sp_getNotifications 3;
GO

CREATE PROCEDURE sp_getStudentsCourse(@idCourse INT)
AS
SELECT CS.id_course_student, S.id_student, S.matricula, P.name, P.last_name, P.second_last_name
FROM course_student CS
         INNER JOIN student S ON CS.id_student = S.id_student
         INNER JOIN person P ON S.id_person = P.id_person
WHERE CS.id_course = @idCourse;
GO

EXEC sp_getStudentsCourse 3;
GO


CREATE PROCEDURE sp_attendanceList(@idStudent INT, @idCourse INT, @typeAttendance INT)
AS
DECLARE @groupStudent AS INT;
    SET @groupStudent = (SELECT GS.id_group_student
                         FROM group_student GS
                         WHERE GS.id_student = @idStudent);
UPDATE course_student
SET assists = @typeAttendance
WHERE id_course = @idCourse
  AND id_student = @idStudent;
    IF @typeAttendance = 1
        BEGIN
            IF @idStudent IN (SELECT GS.id_student
                              FROM directed D
                                       INNER JOIN group_student GS ON D.id_group_student = GS.id_group_student
                              WHERE D.directed_status = 'Pendiente')
                UPDATE directed
                SET id_course_student = @idCourse,
                    directed_status   = 'Realizado'
                WHERE id_group_student = @groupStudent;
        END
    ELSE
        IF @idCourse IN (SELECT D.id_course_student FROM directed D WHERE D.directed_status = 'Realizado')
            UPDATE directed SET id_course_student = null, directed_status = 'Pendiente'
GO

select *
from course_student

select *
from course;
select *
from schedule;

insert into course (id_schedule_details, registry_date, id_student, id_subject_docent, id_course_status)
values (1, '2020-03-04', 1, 1, 1);


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

GO

exec sp_list_groups;

--------------------------


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
GO

EXEC change_status_group 1

SELECT *
FROM groups;

select *
from schedule;
select *
from quarter_number;
select *
from letter;
select *
from docent;
select *
from person;
select *
from quarter;
select *
from career;
select *
from status;

select *
from groups g
select *
from status s;

