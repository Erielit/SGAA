/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.estudiante.control;

import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.asesoria.bean.BeanAsesoria;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.estudiante.dao.DaoEstudiante;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.notificacion.bean.BeanNotificacion;
import com.sgaa.persona.bean.BeanPersona;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author netmo
 */
public class ControlEstudiante extends ActionSupport {

    private Map respuesta = null;
    private String params;
    private int number_param;
    String mensaje;

    public String inicioEstudiante() {
        DaoEstudiante dao = new DaoEstudiante();
        Map session = ServletActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }
        BeanEstudiante estudiante = dao.datosEstudiante(persona.getId_persona());
        session.put("estudiante", estudiante);
        
        respuesta = new HashMap();
        List<BeanHorario> horarios = dao.listSchedules();
        List<BeanNotificacion> listBeanNotificacions = dao.getNewNotifications(persona.getId_persona());
        respuesta.put("horarios", horarios);
        respuesta.put("materias", dao.listSubjects(estudiante.getCarrera().getId_carrera(), estudiante.getId_estudiante()));
        respuesta.put("notifications", listBeanNotificacions);
        respuesta.put("noNotifications", listBeanNotificacions.size());
        return SUCCESS;
    }

    public String notificaciones() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        int persona = ((BeanPersona) ServletActionContext.getContext().getSession().get("persona")).getId_persona();
        List<BeanNotificacion> notificaciones = dao.listNotificaciones(persona);
        respuesta.put("notificaciones", notificaciones);
        return SUCCESS;
    }

    public String agendarAsesoria() {
        DaoEstudiante dao = new DaoEstudiante();
        String fecha;
        int estudiante = 0, docente = 0, horario = 0, materia = 0;
        try {
            JSONObject json = new JSONObject(params);
            fecha = json.getString("fecha");
            estudiante = json.getInt("estudiante");
            docente = json.getInt("docente");
            horario = json.getInt("horario");
            materia = json.getInt("materia");
            if (dao.agendarAsesoria(docente, materia, horario, estudiante, fecha)) {
                mensaje = "1";
            } else {
                mensaje = "2";
            }
        } catch (JSONException ex) {
            Logger.getLogger(ControlEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        return SUCCESS;
    }

    public String cancelarAseoria() {
        DaoEstudiante dao = new DaoEstudiante();
        if (dao.cancelarAsesoria(number_param)) {
            mensaje = "1";
        } else {
            mensaje = "2";
        }
        return SUCCESS;
    }

    public String cuatrimestre() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        BeanCuatrimestre cuatrimestre = dao.getCuratrimestre();
        Map session = ServletActionContext.getContext().getSession();
        if (session.get("estudiante") == null) {
            return "NOLOGIN";
        } else {
            BeanEstudiante estudiante = (BeanEstudiante) session.get("estudiante");
            System.out.println(estudiante.getId_estudiante() + "ESTUDIANTE");
            List<BeanAsesoria> asesorias = dao.listAsesorias(estudiante.getId_estudiante());
            respuesta.put("cuatrimestre", cuatrimestre);
            respuesta.put("asesorias", asesorias);
            return SUCCESS;
        }
    }

    public String detallesAsesoria() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        JSONObject asesoria = dao.detallesAsesoria(number_param);
        if (asesoria != null) {
            respuesta.put("asesoria", asesoria.toString());
        }
        return SUCCESS;
    }

    public String invitarEstudiantes() {
        JSONObject obj = null;
        JSONArray array = null;
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        int asesoria = 0;
        boolean resultado = true;
        try {
            obj = new JSONObject(params);
            asesoria = obj.getInt("id");
            array = obj.getJSONArray("list");
            for (int i = 0; i < array.length() && resultado; i++) {
                resultado = dao.agregarEstudiante(array.getInt(i), asesoria);
            }
        } catch (JSONException ex) {
            Logger.getLogger(ControlEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (resultado) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }

        return SUCCESS;
    }

    public String agregarEstudiantesAsesoria() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        Map session = ServletActionContext.getContext().getSession();
        if (session.get("estudiante") == null) {
            return "NOLOGIN";
        }
        BeanEstudiante estudiante = (BeanEstudiante) session.get("estudiante");
        int estudiante_id = estudiante.getId_estudiante();
        int id_grupo = dao.getGrupoEstudiante(estudiante_id);
        List<BeanEstudiante> estudiantes = dao.listEstudiantes(estudiante_id, id_grupo, params);
        respuesta.put("compas", estudiantes);
        return SUCCESS;
    }

    public String historialAsesorias() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        Map session = ServletActionContext.getContext().getSession();
        if (session.get("estudiante") == null) {
            return "NOLOGIN";
        } else {
            BeanEstudiante estudiante = (BeanEstudiante) session.get("estudiante");
            JSONArray asesorias = dao.historialAsesorias(estudiante.getId_estudiante());
            if (asesorias != null) {
                respuesta.put("asesoria", asesorias.toString());
            }
        }
        return SUCCESS;
    }

    public String listDocents() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        List<BeanDocente> docentes = dao.listDocents(number_param);
        respuesta.put("docentes", docentes);
        return SUCCESS;
    }

    public String listaEstudiantesAsesoria() {
        DaoEstudiante dao = new DaoEstudiante();
        System.out.println(number_param + "CURSO");
        List<BeanEstudiante> listaEs = dao.listEstudiantesAsesoria(number_param);
        respuesta = new HashMap();
        respuesta.put("integrantes", listaEs);
        return SUCCESS;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public void setNumber_param(int number_param) {
        this.number_param = number_param;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
