/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.estudiante.dao;

import com.sgaa.asesoria.bean.BeanAsesoria;
import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.notificacion.bean.BeanNotificacion;
import com.sgaa.usuario.dao.DaoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import utileria.SQLConnection;

/**
 *
 * @author netmo
 */
public class DaoEstudiante {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public BeanEstudiante datosEstudiante(int id) {
        BeanEstudiante estudiante = null;
        BeanCarrera carrera = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_get_student(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, id);
            rs = cstm.executeQuery();//Resultados
            if (rs.next()) {
                carrera = new BeanCarrera();
                carrera.setId_carrera(rs.getInt("id_career"));
                carrera.setNombre(rs.getString("name"));
                estudiante = new BeanEstudiante();
                estudiante.setId_estudiante(rs.getInt("id_student"));
                estudiante.setMatricula(rs.getString("matricula"));
                estudiante.setCarrera(carrera);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return estudiante;
    }

    public boolean agendarAsesoria(int docente, int materia, int horario, int estudiante, String fecha) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_add_course(?,?,?,?,?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, docente);
            cstm.setInt(2, materia);
            cstm.setInt(3, horario);
            cstm.setInt(4, estudiante);
            cstm.setString(5, fecha);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public boolean cancelarAsesoria(int asesoria) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_cancel_course(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, asesoria);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public List<BeanHorario> listSchedules() {
        BeanHorario horario = null;
        List<BeanHorario> horarios = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_schedule()}");//Procedimiento y/o parámetros
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                horario = new BeanHorario();
                horario.setId_horario(rs.getInt("id_schedule_details"));
                horario.setHora_inicio(rs.getString("advisory_start"));
                horario.setHora_fin(rs.getString("advisory_end"));
                horarios.add(horario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return horarios;
    }

    public BeanCuatrimestre getCuratrimestre() {
        BeanCuatrimestre cuatrimestre = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_get_quarter()}");//Procedimiento y/o parámetros
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                cuatrimestre = new BeanCuatrimestre();
                cuatrimestre.setId_cuatrimestre(rs.getInt("id_quarter"));
                cuatrimestre.setNombre(rs.getString("quarter_name"));
                cuatrimestre.setFecha_inicio(rs.getString("quarter_start"));
                cuatrimestre.setFecha_fin(rs.getString("quarter_end"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return cuatrimestre;
    }

    public List<BeanMateria> listSubjects(int id_career, int estudiante) {
        BeanMateria materia = null;
        List<BeanMateria> materias = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_subject(?,?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, id_career);
            cstm.setInt(2, estudiante);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                materia = new BeanMateria();
                materia.setId_materia(rs.getInt("id_subject"));
                materia.setNombre(rs.getString("name"));
                materia.setIdentificador(rs.getString("ident_subject"));
                materias.add(materia);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return materias;
    }

    public List<BeanDocente> listDocents(int materia) {
        BeanDocente docente = null;
        List<BeanDocente> docentes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_docent_subject(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, materia);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                docente = new BeanDocente();
                docente.setId_docent(rs.getInt("id_docent"));
                docente.setId_persona(rs.getInt("id_person"));
                docente.setNombre(rs.getString("name"));
                docente.setPrimer_apellido(rs.getString("last_name"));
                docente.setSegundo_apellido(rs.getString("second_last_name"));
                docentes.add(docente);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return docentes;
    }

    public List<BeanNotificacion> listNotificaciones(int persona) {
        BeanNotificacion notificacion = null;
        List<BeanNotificacion> notificacions = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_notifications(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, persona);
            rs = cstm.executeQuery();
            while (rs.next()) {
                notificacion = new BeanNotificacion();
                System.out.println(rs.getString("subject"));
                notificacion.setAsunto(rs.getString("subject"));
                notificacion.setMensaje(rs.getString("message"));
                notificacion.setFecha_registro(rs.getString("registry_date"));
                notificacion.setVisto(rs.getInt("seen"));
                notificacions.add(notificacion);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return notificacions;
    }

    public JSONObject detallesAsesoria(int asesoria) {
        JSONObject ob = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_details_course(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, asesoria);
            rs = cstm.executeQuery();//Resultados
            if (rs.next()) {
                ob = new JSONObject();
                ob.put("id", rs.getInt("id_course"));
                ob.put("docente", rs.getString("persona"));
                ob.put("fecha", rs.getString("registry_date"));
                ob.put("materia", rs.getString("materia"));
                ob.put("horario", rs.getString("advisory_start") + " " + rs.getString("advisory_end"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(DaoEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return ob;
    }

    public JSONArray historialAsesorias(int estudiante) {
        JSONArray array = new JSONArray();
        JSONObject ob = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_asesorias_all(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, estudiante);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                ob = new JSONObject();
                ob.put("id", rs.getInt("id_course"));
                ob.put("estado", rs.getString("course_status"));
                ob.put("docente", rs.getString("persona"));
                ob.put("fecha", rs.getString("registry_date"));
                ob.put("materia", rs.getString("materia"));
                ob.put("horario", rs.getString("advisory_start") + " " + rs.getString("advisory_end"));
                array.put(ob);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(DaoEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return array;
    }

    public List<BeanAsesoria> listAsesorias(int estudiante) {
        BeanAsesoria asesoria = null;
        BeanHorario horario = null;
        List<BeanAsesoria> asesorias = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_asesorias(?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, estudiante);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                asesoria = new BeanAsesoria();
                horario = new BeanHorario();
                horario.setId_horario(rs.getInt("id_schedule_details"));
                horario.setHora_inicio(rs.getString("advisory_start"));
                horario.setHora_fin(rs.getString("advisory_end"));
                asesoria.setDate(rs.getString("registry_date"));
                asesoria.setId_asesoria(rs.getInt("id_course"));
                asesoria.setHorario(horario);
                asesorias.add(asesoria);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return asesorias;
    }

    public int getGrupoEstudiante(int student) {
        int resultado = 0;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_group_student(?)}");//grupo,estudiante
            cstm.setInt(1, student);
            rs = cstm.executeQuery();//Resultados
            if (rs.next()) {
                resultado = rs.getInt("id_group");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return resultado;
    }

    public List<BeanEstudiante> listEstudiantes(int student, int id_grupo, String fecha) {
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_students_gp(?,?,?)}");//grupo,estudiante
            cstm.setInt(1, id_grupo);
            cstm.setInt(2, student);
            cstm.setString(3, fecha);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setNombre(rs.getString("name"));
                estudiante.setPrimer_apellido(rs.getString("last_name"));
                estudiante.setSegundo_apellido(rs.getString("second_last_name"));
                estudiante.setId_estudiante(rs.getInt("id_student"));
                estudiantes.add(estudiante);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
    }

    public List<BeanEstudiante> listEstudiantesAsesoria(int id_grupo) {
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call  list_students_course(?)}");//grupo,estudiante
            cstm.setInt(1, id_grupo);
            rs = cstm.executeQuery();//Resultados
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setMatricula(rs.getString("matricula"));
                estudiante.setNombre(rs.getString("name"));
                estudiante.setPrimer_apellido(rs.getString("last_name"));
                estudiante.setSegundo_apellido(rs.getString("second_last_name"));
                estudiante.setId_estudiante(rs.getInt("id_student"));
                estudiantes.add(estudiante);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
    }

    public boolean agregarEstudiante(int estudiante, int asesoria) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_add_students_course (?,?)}");
            cstm.setInt(1, estudiante);
            cstm.setInt(2, asesoria);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public List<BeanNotificacion> getNewNotifications(int idStudent) {
        BeanNotificacion beanNotificacion = null;
        List<BeanNotificacion> listNotificacions = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getNotifications(?)}");
            cstm.setInt(1, idStudent);
            rs = cstm.executeQuery();
            while (rs.next()) {
                beanNotificacion = new BeanNotificacion();
                beanNotificacion.setId_notificacion(rs.getInt("id_notification_directed"));
                beanNotificacion.setMensaje(rs.getString("massage"));
                beanNotificacion.setAsunto(rs.getString("subject"));
                beanNotificacion.setFecha_registro(rs.getString("registry_date"));
                listNotificacions.add(beanNotificacion);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método getNewNotifications " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listNotificacions;
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
