/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia.bean;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;

/**
 *
 * @author netmo
 */
public class BeanMateria {
    private int id_materia;
    private String identificador;
    private String nombre;
    private String desc;
    private BeanCarrera carrera;
    private BeanNumeroCuatri numero_cuatri;
    private BeanEstado estado;

    public BeanMateria() {
    }

    public BeanMateria(int id_materia, String identificador, String nombre, String desc, BeanCarrera carrera, BeanNumeroCuatri numero_cuatri, BeanEstado estado) {
        this.id_materia = id_materia;
        this.identificador = identificador;
        this.nombre = nombre;
        this.desc = desc;
        this.carrera = carrera;
        this.numero_cuatri = numero_cuatri;
        this.estado = estado;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public BeanCarrera getCarrera() {
        return carrera;
    }

    public void setCarrera(BeanCarrera carrera) {
        this.carrera = carrera;
    }

    public BeanNumeroCuatri getNumero_cuatri() {
        return numero_cuatri;
    }

    public void setNumero_cuatri(BeanNumeroCuatri numero_cuatri) {
        this.numero_cuatri = numero_cuatri;
    }
    
}
