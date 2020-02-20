/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.cuatrimestre.bean;

import com.sgaa.estado.bean.BeanEstado;

/**
 *
 * @author netmo
 */
public class BeanCuatrimestre {
    private int id_cuatrimestre;
    private String nombre;
    private String fecha_inicio;
    private String fecha_fin;
    private BeanEstado estado;

    public BeanCuatrimestre() {
    }

    public BeanCuatrimestre(int id_cuatrimestre, String nombre, String fecha_inicio, String fecha_fin, BeanEstado estado) {
        this.id_cuatrimestre = id_cuatrimestre;
        this.nombre = nombre;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
        this.estado = estado;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }

    public int getId_cuatrimestre() {
        return id_cuatrimestre;
    }

    public void setId_cuatrimestre(int id_cuatrimestre) {
        this.id_cuatrimestre = id_cuatrimestre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }
    
}
