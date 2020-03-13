/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.coordinador.control;

import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.coordinador.dao.DaoCoordinadorUtils;
import com.sgaa.estudiante.bean.BeanEstudiante;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author netmo
 */
public class ControlCoordinador extends ActionSupport {

    Map respuesta;
    String params;
    int param_integer;

    public String inicioCoordinador() {
        DaoCoordinadorUtils dao = new DaoCoordinadorUtils();
        List<BeanEstudiante> estudiantesM = dao.estudiantesEstadisticasM();
        List<BeanEstudiante> estudiantesH = dao.estudiantesEstadisticasH();
        List<BeanEstudiante> estudiantesDirectedM = dao.estudiantesEstadisticasDirectedM();
        List<BeanEstudiante> estudiantesDirectedH = dao.estudiantesEstadisticasDirectedH();
        respuesta = new HashMap();
        respuesta.put("mujeres", estudiantesM);
        respuesta.put("hombres", estudiantesH);
        respuesta.put("mujeresD", estudiantesDirectedM);
        respuesta.put("hombresD", estudiantesDirectedH);
        return SUCCESS;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public void setParam_integer(int param_integer) {
        this.param_integer = param_integer;
    }

}
