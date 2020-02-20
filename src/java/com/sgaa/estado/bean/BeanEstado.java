/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.estado.bean;

/**
 *
 * @author netmo
 */
public class BeanEstado {
    private int id_estado;
    private String estado;

    public BeanEstado() {
    }

    public BeanEstado(int id_estado, String estado) {
        this.id_estado = id_estado;
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }
    
}
