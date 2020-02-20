/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.divisionAcademica.bean;

/**
 *
 * @author netmo
 */
public class BeanDivisionAcademica {
    private int id_division;
    private String nombre;

    public BeanDivisionAcademica() {
    }

    public BeanDivisionAcademica(int id_division, String nombre) {
        this.id_division = id_division;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_division() {
        return id_division;
    }

    public void setId_division(int id_division) {
        this.id_division = id_division;
    }
    
    
}
