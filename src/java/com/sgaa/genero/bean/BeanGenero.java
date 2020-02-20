/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.genero.bean;

/**
 *
 * @author netmo
 */
public class BeanGenero {
    private int id_genero;
    private String genero;

    public BeanGenero() {
    }

    public BeanGenero(int id_genero, String genero) {
        this.id_genero = id_genero;
        this.genero = genero;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getId_genero() {
        return id_genero;
    }

    public void setId_genero(int id_genero) {
        this.id_genero = id_genero;
    }
    
}
