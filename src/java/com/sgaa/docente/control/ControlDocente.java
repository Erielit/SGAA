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
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.materia.dao.DaoMateria;
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
        DaoDocente daoDocente = new DaoDocente();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        System.out.println(persona.getNombre() + " " + persona.getId_persona());
        beanDocente = daoDocente.getInfoDocent(persona.getId_persona());
        session.put("docent", beanDocente);
        System.out.println(beanDocente.getCedula());

        listCourses = daoAsesoria.getHistoryCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        respuesta.put("listCourses", listCourses);
        return SUCCESS;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Map respuesta) {
        this.respuesta = respuesta;
    }
}
