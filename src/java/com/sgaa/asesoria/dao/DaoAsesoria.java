/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.asesoria.dao;

import com.sgaa.asesoria.bean.BeanAsesoria;
import com.sgaa.asesoriaEstudiante.bean.BeanAsesoriaEstudiante;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.usuario.dao.DaoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utileria.SQLConnection;
import java.util.List;

/**
 *
 * @author netmo
 */
public class DaoAsesoria {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public boolean CambiarContrasena(String contrasena) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("call procedureName(?,?)");//Procedimiento y/o parámetros
            rs = cstm.executeQuery();//Resultados
            result = cstm.executeUpdate() == 1;//se cambió o no
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public List<BeanAsesoria> getCourses(int idDocent) {
        List<BeanAsesoria> listCourses = new ArrayList<>();
        BeanAsesoria beanAsesoria = null;
        BeanHorario beanHorario = null;
        BeanMateria beanMateria = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getCoursesRequests(?)}");
            cstm.setInt(1, idDocent);
            rs = cstm.executeQuery();
            while (rs.next()) {
                beanAsesoria = new BeanAsesoria();
                beanAsesoria.setId_asesoria(rs.getInt("id_course"));
                beanAsesoria.setDate(rs.getString("registry_date"));

                beanHorario = new BeanHorario();
                beanHorario.setHora_inicio(rs.getString("advisory_start"));
                beanHorario.setHora_fin(rs.getString("advisory_end"));

                beanAsesoria.setHorario(beanHorario);
                beanAsesoria.setId_student(rs.getInt("id_student"));
                beanAsesoria.setSubject_diocent(rs.getInt("id_subject_docent"));

                beanMateria = new BeanMateria();
                beanMateria.setNombre(rs.getString("name"));
                beanAsesoria.setMateria(beanMateria);

                listCourses.add(beanAsesoria);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listCourses;
    }

    public List<BeanAsesoria> getHistoryCourses(int idDocent) {
        List<BeanAsesoria> listCourses = new ArrayList<>();
        BeanAsesoria beanAsesoria = null;
        BeanHorario beanHorario = null;
        BeanMateria beanMateria = null;
        BeanEstado beanEstado = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getCoursesHistory(?)}");
            cstm.setInt(1, idDocent);
            rs = cstm.executeQuery();
            while (rs.next()) {
                beanAsesoria = new BeanAsesoria();
                beanAsesoria.setId_asesoria(rs.getInt("id_course"));
                beanAsesoria.setDate(rs.getString("registry_date"));

                beanEstado = new BeanEstado();
                beanEstado.setId_estado(rs.getInt("id_course_status"));
                beanEstado.setEstado(rs.getString("course_status"));
                beanAsesoria.setEstado(beanEstado);

                beanHorario = new BeanHorario();
                beanHorario.setHora_inicio(rs.getString("advisory_start"));
                beanHorario.setHora_fin(rs.getString("advisory_end"));

                beanAsesoria.setHorario(beanHorario);
                beanAsesoria.setId_student(rs.getInt("id_student"));
                beanAsesoria.setSubject_diocent(rs.getInt("id_subject_docent"));

                beanMateria = new BeanMateria();
                beanMateria.setNombre(rs.getString("name"));
                beanAsesoria.setMateria(beanMateria);

                listCourses.add(beanAsesoria);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listCourses;
    }

    public List<BeanAsesoria> getPendingCourses(int idDocent) {
        List<BeanAsesoria> listCourses = new ArrayList<>();
        BeanAsesoria beanAsesoria = null;
        BeanHorario beanHorario = null;
        BeanMateria beanMateria = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getPendingCourses(?)}");
            cstm.setInt(1, idDocent);
            rs = cstm.executeQuery();
            while (rs.next()) {
                beanAsesoria = new BeanAsesoria();
                beanAsesoria.setId_asesoria(rs.getInt("id_course"));
                beanAsesoria.setDate(rs.getString("registry_date"));

                beanHorario = new BeanHorario();
                beanHorario.setHora_inicio(rs.getString("advisory_start"));
                beanHorario.setHora_fin(rs.getString("advisory_end"));

                beanAsesoria.setHorario(beanHorario);
                beanAsesoria.setId_student(rs.getInt("id_student"));
                beanAsesoria.setSubject_diocent(rs.getInt("id_subject_docent"));

                beanMateria = new BeanMateria();
                beanMateria.setNombre(rs.getString("name"));
                beanAsesoria.setMateria(beanMateria);

                listCourses.add(beanAsesoria);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listCourses;
    }

    public List<BeanEstudiante> getStudentsCourse(int idCourse) {
        List<BeanEstudiante> listEstudiantes = new ArrayList<>();
        BeanEstudiante beanEstudiante = null;
        BeanAsesoriaEstudiante beanAsesoriaEstudiante = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getStudentsCourse(?)}");
            cstm.setInt(1, idCourse);
            rs = cstm.executeQuery();

            while (rs.next()) {
                beanEstudiante = new BeanEstudiante();
                beanEstudiante.setId_estudiante(rs.getInt("id_student"));
                beanEstudiante.setMatricula(rs.getString("matricula"));
                beanEstudiante.setNombre(rs.getString("name"));
                beanEstudiante.setPrimer_apellido(rs.getString("last_name"));
                beanEstudiante.setSegundo_apellido(rs.getString("second_last_name"));
                
                beanAsesoriaEstudiante = new BeanAsesoriaEstudiante();
                beanAsesoriaEstudiante.setAssists(rs.getInt("assists"));
                
                beanEstudiante.setBeanAsesoriaEstudiante(beanAsesoriaEstudiante);
                listEstudiantes.add(beanEstudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método getStudentsCourse " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listEstudiantes;
    }

    public boolean attendanceList(int idStudent, int idCourse, int typeAttendance) {
        boolean bandera = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_attendanceList(?, ?, ?)}");
            cstm.setInt(1, idStudent);
            cstm.setInt(2, idCourse);
            cstm.setInt(3, typeAttendance);

            bandera = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método attendanceList " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return bandera;
    }

    public void cerrarConexiones() {
        try {
            if (con != null) {
                con.close();
            }
            if (cstm != null) {
                cstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
