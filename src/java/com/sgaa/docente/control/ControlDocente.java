/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.docente.control;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.asesoria.bean.BeanAsesoria;
import com.sgaa.asesoria.dao.DaoAsesoria;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.docente.dao.DaoDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.persona.bean.BeanPersona;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Gerardo
 */
public class ControlDocente extends ActionSupport {

    private Map respuesta = null;
    private String datos;

    public String inicioDocente() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        DaoDocente daoDocente = new DaoDocente();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        beanDocente = daoDocente.getInfoDocent(persona.getId_persona());
        session.put("docent", beanDocente);

        listCourses = daoAsesoria.getCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        respuesta.put("listCourses", listCourses);
        return SUCCESS;
    }

    public String historialAsesorias() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        beanDocente = (BeanDocente) session.get("docent");
        if (beanDocente == null) {
            return "NOLOGIN";
        }

        listCourses = daoAsesoria.getHistoryCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        respuesta.put("listCourses", listCourses);
        return SUCCESS;
    }

    public String inicioTutor() {
        DaoDocente daoDocente = new DaoDocente();
        List<BeanEstudiante> listaEstudiantes = null;
        BeanDocente beanDocente = null;

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        beanDocente = daoDocente.getInfoDocent(persona.getId_persona());
        session.put("docent", beanDocente);

        listaEstudiantes = daoDocente.getListStudents(beanDocente.getId_docent());
        System.out.println(listaEstudiantes.size());
        respuesta = new HashMap();
        if (!listaEstudiantes.isEmpty()) {
            respuesta.put("carrera", listaEstudiantes.get(0).getGrupo().getCarrera().getNombre());
            respuesta.put("numeroCuatri", listaEstudiantes.get(0).getGrupo().getNumero_cuatri().getNumero());
            respuesta.put("letra", listaEstudiantes.get(0).getGrupo().getLetra().getLetra());
            respuesta.put("cuatrimestre", listaEstudiantes.get(0).getGrupo().getCuatrimestre().getNombre());
            respuesta.put("listaEstudiantes", listaEstudiantes);
        }
        return SUCCESS;
    }

    public String canalizarEstudiante() {
        DaoDocente daoDocente = new DaoDocente();
        respuesta = new HashMap();
        if (daoDocente.canalizeStudent(Integer.parseInt(datos))) {
            respuesta.put("bandera", true);
        }else{
            respuesta.put("bandera", false);
        }
        
        return SUCCESS;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Map respuesta) {
        this.respuesta = respuesta;
    }

    public String getDatos() {
        return datos;
}

    public void setDatos(String datos) {
        this.datos = datos;
    }

}
