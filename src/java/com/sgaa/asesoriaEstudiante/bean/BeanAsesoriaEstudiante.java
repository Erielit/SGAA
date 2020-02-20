/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.asesoriaEstudiante.bean;

/**
 *
 * @author netmo
 */
public class BeanAsesoriaEstudiante {
    private int id_course_student;
    private int id_course;
    private int id_student;
    private int assists;

    public BeanAsesoriaEstudiante() {
    }

    public BeanAsesoriaEstudiante(int id_course_student, int id_course, int id_student, int assists) {
        this.id_course_student = id_course_student;
        this.id_course = id_course;
        this.id_student = id_student;
        this.assists = assists;
    }

    public int getAssists() {
        return assists;
    }

    public void setAssists(int assists) {
        this.assists = assists;
    }

    public int getId_course_student() {
        return id_course_student;
    }

    public void setId_course_student(int id_course_student) {
        this.id_course_student = id_course_student;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public int getId_student() {
        return id_student;
    }

    public void setId_student(int id_student) {
        this.id_student = id_student;
    }
    
}   
