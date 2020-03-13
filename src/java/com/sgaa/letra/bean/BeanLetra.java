/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.letra.bean;

/**
 *
 * @author netmo
 */
public class BeanLetra {
    private int id_letra;
    private String letra;

    public BeanLetra() {
    }

    public BeanLetra(int id_letra, String letra) {
        this.id_letra = id_letra;
        this.letra = letra;
    }

    public BeanLetra(int id_letra) {
        this.id_letra = id_letra;
    }

    public String getLetra() {
        return letra;
    }

    public void setLetra(String letra) {
        this.letra = letra;
    }

    public int getId_letra() {
        return id_letra;
    }

    public void setId_letra(int id_letra) {
        this.id_letra = id_letra;
    }
    
    
}
