/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.docente.bean;

import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.persona.bean.BeanPersona;
import com.sgaa.usuario.bean.BeanUsuario;

/**
 *
 * @author netmo
 */
public class BeanDocente extends BeanPersona{
    private int id_docent;
    private String cedula;
    private String desc;

    public BeanDocente() {
        super();
    }

    public BeanDocente(int id_docent, String cedula, String desc, int id_persona, String curp, String nombre, String primer_apellido, String segundo_apellido, String fecha_nacimiento, BeanGenero genero, BeanUsuario usuario) {
        super(id_persona, curp, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, genero, usuario);
        this.id_docent = id_docent;
        this.cedula = cedula;
        this.desc = desc;
    }

    public BeanDocente(int id_docent) {
        this.id_docent = id_docent;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getId_docent() {
        return id_docent;
    }

    public void setId_docent(int id_docent) {
        this.id_docent = id_docent;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    
}
