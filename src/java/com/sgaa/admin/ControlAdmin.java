/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.cuatrimestre.dao.DaoCuatrimestre;
import com.sgaa.estado.dao.DaoEstado;
import com.sgaa.estudiante.dao.DaoEstudiante;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.grupo.dao.DaoGrupo;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.horario.dao.DaoHorario;
import com.sgaa.letra.dao.DaoLetra;
import com.sgaa.numero_cuatrimestre.dao.DaoNumeroCuatrimestre;

import java.util.HashMap;
import java.util.Map;

/**
 * @author netmo
 */
public class ControlAdmin extends ActionSupport {

    Map respuesta;
    String params;
    String mensaje;
    int param_integer;
    private BeanHorario horario;
    private BeanGrupo grupo;

    public String inicioHorario() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("horarios", dao.listSchedules());
        return SUCCESS;
    }

    public String inicioGrupo() {
        DaoGrupo dao = new DaoGrupo();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("grupos", dao.listGrupos());
        return SUCCESS;
    }

    public String prepararRegistrarGrupo() {
        DaoGrupo dao = new DaoGrupo();
        DaoEstado daoEstado = new DaoEstado();
        DaoLetra daoLetra = new DaoLetra();
        DaoNumeroCuatrimestre daoNumeroCuatrimestre = new DaoNumeroCuatrimestre();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("letras", daoLetra.listLetras());
        respuesta.put("estados", daoEstado.listEstados());
        respuesta.put("numeroCuatris", daoNumeroCuatrimestre.listNumeroCuatris());
        respuesta.put("grupos", dao.listGrupos());
        return SUCCESS;
    }

    public String registrarHorario() {
        respuesta = new HashMap();
        DaoHorario dao = new DaoHorario();
        horario.setHora_fin(params);
        if (dao.addHorario(horario)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String cambiarEstado() {
        DaoHorario dao = new DaoHorario();
        respuesta = new HashMap();
        System.out.println(params);
        horario.setEstado(params);
        if (dao.cambiarEstadoHorario(horario)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }
    public String cambiarEstadoGrupo() {
        DaoGrupo dao = new DaoGrupo();
        respuesta = new HashMap();
        System.out.println("paramsparamsparamsparamsparams+."+params);
        if (dao.cambiarEstadoGrupo(params)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public void setParam_integer(int param_integer) {
        this.param_integer = param_integer;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public void setHorario(BeanHorario horario) {
        this.horario = horario;
    }

}
