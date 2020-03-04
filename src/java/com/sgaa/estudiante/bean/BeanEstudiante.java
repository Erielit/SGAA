/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.estudiante.bean;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.grupoEstudiante.bean.BeanGrupoEstudiante;
import com.sgaa.persona.bean.BeanPersona;
import com.sgaa.usuario.bean.BeanUsuario;

/**
 *
 * @author netmo
 */
public class BeanEstudiante extends BeanPersona{
    private int id_estudiante;
    private String matricula;
    private BeanCarrera carrera;
    private BeanGrupo grupo;
    private BeanGrupoEstudiante grupoEstudiante;
    
    public BeanEstudiante() {
    }

    public BeanEstudiante(int id_estudiante, String matricula, BeanCarrera carrera, BeanGrupo grupo, int id_persona, String curp, String nombre, String primer_apellido, String segundo_apellido, String fecha_nacimiento, BeanGenero genero, BeanUsuario usuario) {
        super(id_persona, curp, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, genero, usuario);
        this.id_estudiante = id_estudiante;
        this.matricula = matricula;
        this.carrera = carrera;
    }
    
    public BeanCarrera getCarrera() {
        return carrera;
    }

    public void setCarrera(BeanCarrera carrera) {
        this.carrera = carrera;
    }

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public BeanGrupo getGrupo() {
        return grupo;
    }

    public void setGrupo(BeanGrupo grupo) {
        this.grupo = grupo;
    }

    public BeanGrupoEstudiante getGrupoEstudiante() {
        return grupoEstudiante;
    }

    public void setGrupoEstudiante(BeanGrupoEstudiante grupoEstudiante) {
        this.grupoEstudiante = grupoEstudiante;
    }
    
    
}
