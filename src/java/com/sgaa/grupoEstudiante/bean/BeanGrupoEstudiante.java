/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.grupoEstudiante.bean;

import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.grupo.bean.BeanGrupo;

/**
 *
 * @author netmo
 */
public class BeanGrupoEstudiante {

    private int id_grupo_estudiante;
    private BeanEstudiante estudiante;
    private BeanGrupo grupo;

    public BeanGrupoEstudiante() {
    }

    public BeanGrupoEstudiante(int id_grupo_estudiante, BeanEstudiante estudiante, BeanGrupo grupo) {
        this.id_grupo_estudiante = id_grupo_estudiante;
        this.estudiante = estudiante;
        this.grupo = grupo;
    }

    public BeanGrupo getGrupo() {
        return grupo;
    }

    public void setGrupo(BeanGrupo grupo) {
        this.grupo = grupo;
    }

    public BeanEstudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(BeanEstudiante estudiante) {
        this.estudiante = estudiante;
    }

    public int getId_grupo_estudiante() {
        return id_grupo_estudiante;
    }

    public void setId_grupo_estudiante(int id_grupo_estudiante) {
        this.id_grupo_estudiante = id_grupo_estudiante;
    }
    

}
