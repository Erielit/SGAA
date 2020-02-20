/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.permiso.bean;

/**
 *
 * @author netmo
 */
public class BeanPermiso {
    private int id_permiso;
    private String nombre;
    private String desc;

    public BeanPermiso() {
    }

    public BeanPermiso(int id_permiso, String nombre, String desc) {
        this.id_permiso = id_permiso;
        this.nombre = nombre;
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getId_permiso() {
        return id_permiso;
    }

    public void setId_permiso(int id_permiso) {
        this.id_permiso = id_permiso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
