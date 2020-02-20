/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.notificacion.bean;

import com.sgaa.asesoria.bean.BeanAsesoria;

/**
 *
 * @author netmo
 */
public class BeanNotificacion {
    private int id_notificacion;
    private String mensaje;
    private String asunto;
    private String fecha_registro;
    private BeanAsesoria asesoria;
    private int visto;

    public BeanNotificacion() {
    }

    public BeanNotificacion(int id_notificacion, String mensaje, String asunto, String fecha_registro, BeanAsesoria asesoria, int visto) {
        this.id_notificacion = id_notificacion;
        this.mensaje = mensaje;
        this.asunto = asunto;
        this.fecha_registro = fecha_registro;
        this.asesoria = asesoria;
        this.visto = visto;
    }

    public int getVisto() {
        return visto;
    }

    public void setVisto(int visto) {
        this.visto = visto;
    }

    public int getId_notificacion() {
        return id_notificacion;
    }

    public void setId_notificacion(int id_notificacion) {
        this.id_notificacion = id_notificacion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public BeanAsesoria getAsesoria() {
        return asesoria;
    }

    public void setAsesoria(BeanAsesoria asesoria) {
        this.asesoria = asesoria;
    }
    
}
