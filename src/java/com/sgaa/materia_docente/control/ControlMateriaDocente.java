/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia_docente.control;

import com.sgaa.materia.control.*;
import com.sgaa.docente.control.*;
import com.google.gson.Gson;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.materia_docente.bean.BeanMateriaDocente;
import com.sgaa.materia_docente.dao.DaoMateriaDocente;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Zaira
 */
public class ControlMateriaDocente extends ActionSupport {

    //AJAX------------------------
    private String parametro; // Para recibir los datos.
    private Map respuestas;
    int id;
    //STRUTS ----------------------
    BeanMateriaDocente bean;
    DaoMateriaDocente dao;
    List<BeanMateriaDocente> lista;

    String mensaje;

    public String registrarMateriaDocente() {
        dao = new DaoMateriaDocente();
        System.out.println("----");
        try {
            if (dao.registrarMateria(bean) > 0) {
                mensaje = "2";
            } else {
                mensaje = "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error");

        }
        return SUCCESS;
    }

    public String getParametro() {
        return parametro;
    }

    public void setParametro(String parametro) {
        this.parametro = parametro;
    }

    public Map getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(Map respuestas) {
        this.respuestas = respuestas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BeanMateriaDocente getBean() {
        return bean;
    }

    public void setBean(BeanMateriaDocente bean) {
        this.bean = bean;
    }

    public DaoMateriaDocente getDao() {
        return dao;
    }

    public void setDao(DaoMateriaDocente dao) {
        this.dao = dao;
    }

    public List<BeanMateriaDocente> getLista() {
        return lista;
    }

    public void setLista(List<BeanMateriaDocente> lista) {
        this.lista = lista;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
