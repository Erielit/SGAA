/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.controlAcceso.control;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.controlAcceso.dao.DaoControlAcceso;
import com.sgaa.persona.bean.BeanPersona;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author netmo
 */
public class IniciarSesion extends ActionSupport {

    private String username;
    private String password;
    private int id_rol;
    private Map respuesta;

    public String iniciarSesion() {
        System.out.println(username + "->" + password);
        String result = "";
        BeanPersona persona = null;
        DaoControlAcceso dao = new DaoControlAcceso();
        persona = dao.iniciarSesion(username, password);
        if (persona != null) {
            Map session = ActionContext.getContext().getSession();
            session.put("persona", persona);
            if (persona.getUsuario().getRoles().get(0).getId_role() == 2) {
                result = "student";
                session.put("rolActivo", 2);
            } else {
                if (persona.getUsuario().getRoles().size() > 1) {
                    result = SUCCESS;
                } else {
                    switch (persona.getUsuario().getRoles().get(0).getId_role()) {
                        case 1://ADMIN
                            result = "admin";
                            session.put("rolActivo", 1);
                            break;
                        case 3://Docente
                            session.put("rolActivo", 3);
                            result = "docente";
                            break;
                        case 4:
                            session.put("rolActivo", 4);
                            result = "tutor";
                        case 5:
                            session.put("rolActivo", 5);
                            result = "coordinador";
                            break;
                        default:
                            throw new AssertionError();
                    }
                }
            }
        } else {
            respuesta = new HashMap();
            respuesta.put("mensaje", "Usuario y/o contraseña incorrectos");
            result = ERROR;
        }
        return result;
    }

    public String cambiarRol() {
        String result = "";
        Map session = ActionContext.getContext().getSession();
        System.out.println(id_rol);
        switch (id_rol) {
            case 1:
                result = "admin";
                session.put("rolActivo", 1);
                break;
            case 2:
                result = "estudiante";
                session.put("rolActivo", 2);
                break;
            case 3:
                result = "docente";
                session.put("rolActivo", 3);
                break;
            case 4:
                result = "tutor";
                session.put("rolActivo", 4);
                break;
            case 5:
                result = "coordinador";
                session.put("rolActivo", 5);
                break;
            default:

        }
        return result;
    }

    public String cerrarSesion() {
        Map session = ActionContext.getContext().getSession();
        session.clear();
        return SUCCESS;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
}
