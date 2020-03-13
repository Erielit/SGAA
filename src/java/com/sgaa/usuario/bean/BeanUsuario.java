/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.usuario.bean;

import com.sgaa.role.bean.BeanRole;

import java.util.List;

/**
 * @author netmo
 */
public class BeanUsuario {
    private int id_usuario;
    private String username;
    private String password;
    private String reset_code;
    private List<BeanRole> roles;

    public BeanUsuario() {
    }

    public BeanUsuario(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public BeanUsuario(int id_usuario, String username, String password, String reset_code, List<BeanRole> roles) {
        this.id_usuario = id_usuario;
        this.username = username;
        this.password = password;
        this.reset_code = reset_code;
        this.roles = roles;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReset_code() {
        return reset_code;
    }

    public void setReset_code(String reset_code) {
        this.reset_code = reset_code;
    }

    public List<BeanRole> getRoles() {
        return roles;
    }

    public void setRoles(List<BeanRole> roles) {
        this.roles = roles;
    }


}
