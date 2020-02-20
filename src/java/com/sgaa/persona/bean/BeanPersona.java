/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.persona.bean;

import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.usuario.bean.BeanUsuario;

/**
 *
 * @author netmo
 */
public class BeanPersona {
    private int id_persona;
    private String curp;
    private String nombre;
    private String primer_apellido;
    private String segundo_apellido;
    private String fecha_nacimiento;
    private BeanGenero genero;
    private BeanUsuario usuario;

    public BeanPersona() {
    }

    public BeanPersona(int id_persona, String curp, String nombre, String primer_apellido, String segundo_apellido, String fecha_nacimiento, BeanGenero genero, BeanUsuario usuario) {
        this.id_persona = id_persona;
        this.curp = curp;
        this.nombre = nombre;
        this.primer_apellido = primer_apellido;
        this.segundo_apellido = segundo_apellido;
        this.fecha_nacimiento = fecha_nacimiento;
        this.genero = genero;
        this.usuario = usuario;
    }

    public BeanUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(BeanUsuario usuario) {
        this.usuario = usuario;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimer_apellido() {
        return primer_apellido;
    }

    public void setPrimer_apellido(String primer_apellido) {
        this.primer_apellido = primer_apellido;
    }

    public String getSegundo_apellido() {
        return segundo_apellido;
    }

    public void setSegundo_apellido(String segundo_apellido) {
        this.segundo_apellido = segundo_apellido;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public BeanGenero getGenero() {
        return genero;
    }

    public void setGenero(BeanGenero genero) {
        this.genero = genero;
    }
    
    
}
