/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.carrera.control;

import com.sgaa.carrera.control.*;
import com.sgaa.docente.control.*;
import com.google.gson.Gson;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.carrera.dao.DaoCarrera;
import com.sgaa.estado.bean.BeanEstado;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Zaira
 */
public class ControlCarrera extends ActionSupport {

    //AJAX------------------------
    private String parametro; // Para recibir los datos.
    private Map respuestas;
    int id;
    //STRUTS ----------------------
    BeanCarrera bean;
    DaoCarrera dao;
    List<BeanCarrera> lista;
    String mensaje;

    public String inicioCarreras() {
        dao = new DaoCarrera();
        lista = dao.consultarCarreras();
        return SUCCESS;
    }

    public String registrarCarrera() {
        dao = new DaoCarrera();
        System.out.println("-> <<<" + bean.getNombre());
        try {
            if (dao.registrarCarrera(bean)) {
                lista = dao.consultarCarreras();
                mensaje = "1";
            } else {
                mensaje = "2";
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error");

        }
        return SUCCESS;
    }

    public String consultaIndividualCarrera() {
        dao = new DaoCarrera();
        int uid = bean.getId_carrera();
        bean = dao.consultaIndividualCarrera(uid);
        System.out.println("-->" + bean.getId_carrera());
        System.out.println("-->" + uid);
        bean.setId_carrera(uid);
        //listaPokemons = daoPokemons.consultarPokemons();
        return SUCCESS;
    }

    public String modificarCarreraJson() {
        dao = new DaoCarrera();
        if (dao.modificarCarrera(bean)) {
            mensaje = "1";
        } else {
            mensaje = "2";
        }
        return SUCCESS;
    }

    public String estadoCarrera() {
        dao = new DaoCarrera();
        System.out.println(bean.getId_carrera());
        if (dao.estadoCarrera(bean)) {
            mensaje = "1";
        } else {
            mensaje = "2";
        }
        return SUCCESS;
    }

//     Getters & Setter
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

    public BeanCarrera getBean() {
        return bean;
    }

    public void setBean(BeanCarrera bean) {
        this.bean = bean;
    }

    public DaoCarrera getDao() {
        return dao;
    }

    public void setDao(DaoCarrera dao) {
        this.dao = dao;
    }

    public List<BeanCarrera> getLista() {
        return lista;
    }

    public void setLista(List<BeanCarrera> lista) {
        this.lista = lista;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

}
