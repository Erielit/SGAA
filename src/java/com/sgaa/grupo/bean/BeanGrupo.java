/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.grupo.bean;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.letra.bean.BeanLetra;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;

/**
 * @author netmo
 */
public class BeanGrupo {

    private int id_grupo;
    private BeanNumeroCuatri numero_cuatri;
    private BeanLetra letra;
    private BeanDocente docente;
    private BeanCuatrimestre cuatrimestre;
    private String fecha_registro;
    private BeanCarrera carrera;
    private BeanEstado estado;

    public BeanGrupo() {
    }

    public BeanGrupo(int id_grupo, BeanNumeroCuatri numero_cuatri, BeanLetra letra, BeanDocente docente, BeanCuatrimestre cuatrimestre, String fecha_registro, BeanCarrera carrera) {
        this.id_grupo = id_grupo;
        this.numero_cuatri = numero_cuatri;
        this.letra = letra;
        this.docente = docente;
        this.cuatrimestre = cuatrimestre;
        this.fecha_registro = fecha_registro;
        this.carrera = carrera;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public BeanNumeroCuatri getNumero_cuatri() {
        return numero_cuatri;
    }

    public void setNumero_cuatri(BeanNumeroCuatri numero_cuatri) {
        this.numero_cuatri = numero_cuatri;
    }

    public BeanLetra getLetra() {
        return letra;
    }

    public void setLetra(BeanLetra letra) {
        this.letra = letra;
    }

    public BeanDocente getDocente() {
        return docente;
    }

    public void setDocente(BeanDocente docente) {
        this.docente = docente;
    }

    public BeanCuatrimestre getCuatrimestre() {
        return cuatrimestre;
    }

    public void setCuatrimestre(BeanCuatrimestre cuatrimestre) {
        this.cuatrimestre = cuatrimestre;
    }

    public BeanCarrera getCarrera() {
        return carrera;
    }

    public void setCarrera(BeanCarrera carrera) {
        this.carrera = carrera;
    }

    @Override
    public String toString() {
        return "BeanGrupo{" +
                "id_grupo=" + id_grupo +
                ", numero_cuatri=" + numero_cuatri +
                ", letra=" + letra +
                ", docente=" + docente +
                ", cuatrimestre=" + cuatrimestre +
                ", fecha_registro='" + fecha_registro + '\'' +
                ", carrera=" + carrera +
                ", estado=" + estado +
                '}';
    }

}
