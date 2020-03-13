/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.numero_cuatrimestre.bean;

/**
 *
 * @author netmo
 */
public class BeanNumeroCuatri {
    private int id_numero_cuatri;
    private int numero;

    public BeanNumeroCuatri() {
    }

    public BeanNumeroCuatri(int id_numero_cuatri, int numero) {
        this.id_numero_cuatri = id_numero_cuatri;
        this.numero = numero;
    }

    public BeanNumeroCuatri(int id_numero_cuatri) {
        this.id_numero_cuatri = id_numero_cuatri;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getId_numero_cuatri() {
        return id_numero_cuatri;
    }

    public void setId_numero_cuatri(int id_numero_cuatri) {
        this.id_numero_cuatri = id_numero_cuatri;
    }
    
}
