/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia_docente.bean;

import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.materia.bean.BeanMateria;

/**
 *
 * @author netmo
 */
public class BeanMateriaDocente {
    private int id_materia_docente;
    private BeanMateria materia;
    private BeanDocente docente;
    private BeanEstado estado;

    public BeanMateriaDocente() {
    }

    public BeanMateriaDocente(int id_materia_docente, BeanMateria materia, BeanDocente docente, BeanEstado estado) {
        this.id_materia_docente = id_materia_docente;
        this.materia = materia;
        this.docente = docente;
        this.estado = estado;
    }

    public BeanEstado getEstado() {
        return estado;
    }

    public void setEstado(BeanEstado estado) {
        this.estado = estado;
    }

    public int getId_materia_docente() {
        return id_materia_docente;
    }

    public void setId_materia_docente(int id_materia_docente) {
        this.id_materia_docente = id_materia_docente;
    }

    public BeanMateria getMateria() {
        return materia;
    }

    public void setMateria(BeanMateria materia) {
        this.materia = materia;
    }

    public BeanDocente getDocente() {
        return docente;
    }

    public void setDocente(BeanDocente docente) {
        this.docente = docente;
    }
    
}
