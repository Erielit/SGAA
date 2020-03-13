/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.carrera.bean;

import com.sgaa.divisionAcademica.bean.BeanDivisionAcademica;
import com.sgaa.estado.bean.BeanEstado;

/**
 *
 * @author netmo
 */
public class BeanCarrera {
    private int id_carrera;
    private String nombre;
    private String siglas;
    private String descripciont;
    private BeanDivisionAcademica division;
    private BeanEstado estado;

    public BeanCarrera() {
    }
    public BeanCarrera(String nombre) {
         this.nombre = nombre;
    }

    public BeanCarrera(int id_carrera, String nombre, String siglas, String descripciont, BeanDivisionAcademica division) {
        this.id_carrera = id_carrera;
        this.nombre = nombre;
        this.siglas = siglas;
        this.descripciont = descripciont;
        this.division = division;
    }

    public BeanCarrera(int id_carrera, String nombre, String siglas, String descripciont, BeanDivisionAcademica division, BeanEstado estado) {
        this.id_carrera = id_carrera;
        this.nombre = nombre;
        this.siglas = siglas;
        this.descripciont = descripciont;
        this.division = division;
        this.estado = estado;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }
    
    

    public BeanDivisionAcademica getDivision() {
        return division;
    }

    public void setDivision(BeanDivisionAcademica division) {
        this.division = division;
    }

    public int getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(int id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSiglas() {
        return siglas;
    }

    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    public String getDescripciont() {
        return descripciont;
    }

    public void setDescripciont(String descripciont) {
        this.descripciont = descripciont;
    }
    
}
