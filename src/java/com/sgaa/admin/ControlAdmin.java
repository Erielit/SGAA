/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.cuatrimestre.dao.DaoCuatrimestre;
import com.sgaa.cuatrimestre.dao.DaoCuatrimestre;
import com.sgaa.estado.dao.DaoEstado;
import com.sgaa.estudiante.dao.DaoEstudiante;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.grupo.dao.DaoGrupo;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.horario.dao.DaoHorario;
import com.sgaa.letra.dao.DaoLetra;
import com.sgaa.numero_cuatrimestre.dao.DaoNumeroCuatrimestre;
import com.sgaa.persona.bean.BeanPersona;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

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

    public String inicioPeriodos() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        respuesta = new HashMap();
        respuesta.put("listQuarters", daoCuatrimestre.getQuarters());
        return SUCCESS;
    }

    public String registrarPeriodo() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        BeanCuatrimestre beanCuatrimestre = new BeanCuatrimestre();

        try {
            JSONObject myObj = new JSONObject(mensaje);
            beanCuatrimestre.setNombre(myObj.getString("nombre"));
            beanCuatrimestre.setFecha_inicio(myObj.getString("fechaInicio"));
            beanCuatrimestre.setFecha_fin(myObj.getString("fechaFin"));
        } catch (JSONException ex) {
            Logger.getLogger(ControlAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        respuesta = new HashMap();
        respuesta.put("bandera", daoCuatrimestre.newQuarter(beanCuatrimestre));
        return SUCCESS;
    }

    public String modificarEstado() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        respuesta = new HashMap();
        if (daoCuatrimestre.editStatusQuarter(param_integer)) {
            respuesta.put("bandera", true);
        } else {
            respuesta.put("bandera", false);
        }
        return SUCCESS;
    }

    public String infoPeriodo() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        respuesta = new HashMap();
        respuesta.put("cuatrimestre", daoCuatrimestre.getInfoQuarter(param_integer));
        return SUCCESS;
    }

    public String modificarPeriodo(){
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        BeanCuatrimestre beanCuatrimestre = null;
        try {
            JSONObject myObj = new JSONObject(mensaje);
            beanCuatrimestre = new BeanCuatrimestre();
            beanCuatrimestre.setId_cuatrimestre(myObj.getInt("idCuatrimestre"));
            beanCuatrimestre.setNombre(myObj.getString("nombre"));
            beanCuatrimestre.setFecha_inicio(myObj.getString("fechaInicio"));
            beanCuatrimestre.setFecha_fin(myObj.getString("fechaFin"));
        } catch (JSONException ex) {
            Logger.getLogger(ControlAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }

        respuesta = new HashMap();
        respuesta.put("bandera", daoCuatrimestre.editQuarter(beanCuatrimestre));
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
