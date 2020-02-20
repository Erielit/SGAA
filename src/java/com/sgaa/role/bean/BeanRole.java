/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.role.bean;

/**
 *
 * @author netmo
 */
public class BeanRole {
    private int id_role;
    private String role;
    private String descripcion;

    public BeanRole() {
    }

    public BeanRole(int id_role, String role, String descripcion) {
        this.id_role = id_role;
        this.role = role;
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_role() {
        return id_role;
    }

    public void setId_role(int id_role) {
        this.id_role = id_role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
