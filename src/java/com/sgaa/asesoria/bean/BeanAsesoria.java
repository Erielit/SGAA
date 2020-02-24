/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.asesoria.bean;

import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.materia.bean.BeanMateria;

/**
 *
 * @author netmo
 */
public class BeanAsesoria {
    private int id_asesoria;
    private BeanHorario horario;
    private String date;
    private int id_student;
    private int subject_diocent;
    private BeanEstado estado;
    private BeanMateria materia;

    public BeanAsesoria() {
    }

    public BeanAsesoria(int id_asesoria, BeanHorario horario, String date, int id_student, int subject_diocent, BeanEstado estado, BeanMateria materia) {
        this.id_asesoria = id_asesoria;
        this.horario = horario;
        this.date = date;
        this.id_student = id_student;
        this.subject_diocent = subject_diocent;
        this.estado = estado;
        this.materia = materia;
    }

    public int getId_asesoria() {
        return id_asesoria;
    }

    public void setId_asesoria(int id_asesoria) {
        this.id_asesoria = id_asesoria;
    }

    public BeanHorario getHorario() {
        return horario;
    }

    public void setHorario(BeanHorario horario) {
        this.horario = horario;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getId_student() {
        return id_student;
    }

    public void setId_student(int id_student) {
        this.id_student = id_student;
    }

    public int getSubject_diocent() {
        return subject_diocent;
    }

    public void setSubject_diocent(int subject_diocent) {
        this.subject_diocent = subject_diocent;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }

    public BeanMateria getMateria() {
        return materia;
    }

    public void setMateria(BeanMateria materia) {
        this.materia = materia;
    }
}
