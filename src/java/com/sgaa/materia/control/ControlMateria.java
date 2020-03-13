/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia.control;

import com.sgaa.docente.control.*;
import com.google.gson.Gson;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.materia.dao.DaoMateria;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Zaira
 */
public class ControlMateria extends ActionSupport {

    //AJAX------------------------
    private String parametro; // Para recibir los datos.
    private Map respuestas;
    int id;
    //STRUTS ----------------------
    BeanMateria bean;
    DaoMateria dao;
    List<BeanMateria> lista;
    List<BeanDocente> listaD;
    String mensaje;

    public String inicioMaterias() {
        dao = new DaoMateria();
        lista = dao.consultarMaterias();
        System.out.println("--> MAteria " + lista.get(1).getId_materia());
        return SUCCESS;
    }
    
    public String inicioDocentes() {
        dao = new DaoMateria();
        listaD = dao.consultarDocentes(bean.getId_materia());
        System.out.println("lista---" + listaD.get(1).getNombre());
        return SUCCESS;
    }

    public String registrarMateria() {
        dao = new DaoMateria();
        System.out.println("-> <<<" + bean.getNombre());
        try {
            
            if (dao.registrarMateria(bean) > 0) {
                mensaje = "2";
            } else {
                mensaje = "1";
            }
            lista = dao.consultarMaterias();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error");

        }
        return SUCCESS;
    }

    public String consultaIndividualMateria() {
        dao = new DaoMateria();
        int uid = bean.getId_materia();
        bean = dao.consultaIndividualMateria(uid);
        bean.setId_materia(uid);
        return SUCCESS;
    }

    public String modificarMateria() {
        dao = new DaoMateria();
        if (dao.modificarMateria(bean)) {
            mensaje = "1";
        } else {
            mensaje = "2";
        }
        return "exito";
    }

    public String estadoMateria() {
        dao = new DaoMateria();
        System.out.println(bean.getEstado().getId_estado() + " -> " + bean.getId_materia());
        if (dao.estadoMateria(bean)) {
            mensaje = "1";
        } else {
            mensaje = "2";
        }
        return SUCCESS;
    }

    public List<BeanDocente> getListaD() {
        return listaD;
    }

    public void setListaD(List<BeanDocente> listaD) {
        this.listaD = listaD;
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

    public BeanMateria getBean() {
        return bean;
    }

    public void setBean(BeanMateria bean) {
        this.bean = bean;
    }

    public DaoMateria getDao() {
        return dao;
    }

    public void setDao(DaoMateria dao) {
        this.dao = dao;
    }

    public List<BeanMateria> getLista() {
        return lista;
    }

    public void setLista(List<BeanMateria> lista) {
        this.lista = lista;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
