/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.estudiante.control;

import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.estudiante.dao.DaoEstudiante;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.persona.bean.BeanPersona;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.ServletActionContext;
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
        respuesta.put("horarios", horarios);
        respuesta.put("materias", dao.listSubjects(estudiante.getCarrera().getId_carrera(), estudiante.getId_estudiante()));
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

    public String cuatrimestre() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        BeanCuatrimestre cuatrimestre = dao.getCuratrimestre();
        respuesta.put("cuatrimestre", cuatrimestre);
        return SUCCESS;
    }

    public String listDocents() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        List<BeanDocente> docentes = dao.listDocents(number_param);
        respuesta.put("docentes", docentes);
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
