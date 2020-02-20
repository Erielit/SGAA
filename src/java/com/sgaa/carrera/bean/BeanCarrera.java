/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.carrera.bean;

import com.sgaa.divisionAcademica.bean.BeanDivisionAcademica;

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

    public BeanCarrera() {
    }

    public BeanCarrera(int id_carrera, String nombre, String siglas, String descripciont, BeanDivisionAcademica division) {
        this.id_carrera = id_carrera;
        this.nombre = nombre;
        this.siglas = siglas;
        this.descripciont = descripciont;
        this.division = division;
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
