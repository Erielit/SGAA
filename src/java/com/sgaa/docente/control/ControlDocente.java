/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.docente.control;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.asesoria.bean.BeanAsesoria;
import com.sgaa.asesoria.dao.DaoAsesoria;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.docente.dao.DaoDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.materia.dao.DaoMateria;
import com.sgaa.persona.bean.BeanPersona;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Gerardo
 */
public class ControlDocente extends ActionSupport {

    private Map respuesta = null;
    private int param_integer;
    private String datos;

    public String inicioDocente() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        DaoDocente daoDocente = new DaoDocente();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }
        System.out.println(persona.getId_persona());
        beanDocente = daoDocente.getInfoDocent(persona.getId_persona());
        session.put("docent", beanDocente);

        listCourses = daoAsesoria.getCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        if (listCourses.size() > 0) {
            respuesta.put("listCourses", listCourses);
        } else {
            respuesta.put("mensaje", "Sin solicitudes de asesorías.");
        }
        return SUCCESS;
    }

    public String historialAsesorias() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        beanDocente = (BeanDocente) session.get("docent");
        if (beanDocente == null) {
            return "NOLOGIN";
        }

        listCourses = daoAsesoria.getHistoryCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        if (listCourses.size() > 0) {
            respuesta.put("listCourses", listCourses);
        } else {
            respuesta.put("mensaje", "Sin asesorías canceladas o rechazadas.");
        }
        return SUCCESS;
    }

    public String asesoriasActivas() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        List<BeanAsesoria> listCourses;
        BeanDocente beanDocente;

        Map session = ActionContext.getContext().getSession();
        beanDocente = (BeanDocente) session.get("docent");
        if (beanDocente == null) {
            return "NOLOGIN";
        }

        listCourses = daoAsesoria.getPendingCourses(beanDocente.getId_docent());

        respuesta = new HashMap();
        if (listCourses.size() > 0) {
            respuesta.put("listCourses", listCourses);
        } else {
            respuesta.put("mensaje", "Sin asesorías activas");
        }
        return SUCCESS;
    }

    public String inicioTutor() {
        DaoDocente daoDocente = new DaoDocente();
        List<BeanEstudiante> listaEstudiantes = null;
        BeanDocente beanDocente = null;

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        beanDocente = daoDocente.getInfoDocent(persona.getId_persona());
        session.put("docent", beanDocente);

        listaEstudiantes = daoDocente.getListStudents(beanDocente.getId_docent());
        respuesta = new HashMap();
        if (!listaEstudiantes.isEmpty()) {
            respuesta.put("carrera", listaEstudiantes.get(0).getGrupo().getCarrera().getNombre());
            respuesta.put("numeroCuatri", listaEstudiantes.get(0).getGrupo().getNumero_cuatri().getNumero());
            respuesta.put("letra", listaEstudiantes.get(0).getGrupo().getLetra().getLetra());
            respuesta.put("cuatrimestre", listaEstudiantes.get(0).getGrupo().getCuatrimestre().getNombre());
            respuesta.put("listaEstudiantes", listaEstudiantes);
        } else {
            respuesta.put("mensaje", "No hay estudiantes registrados.");
        }
        return SUCCESS;
    }

    public String canalizarEstudiante() {
        DaoDocente daoDocente = new DaoDocente();
        respuesta = new HashMap();
        if (daoDocente.canalizeStudent(Integer.parseInt(datos))) {
            respuesta.put("bandera", true);
        } else {
            respuesta.put("bandera", false);
        }

        return SUCCESS;
    }

    public String aceptarAsesoria() {
        DaoDocente dao = new DaoDocente();
        respuesta = new HashMap();
        if (dao.aceptarAsesoria(param_integer)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String rechazarAsesoria() {
        DaoDocente dao = new DaoDocente();
        respuesta = new HashMap();
        if (dao.rechazarAsesoria(param_integer)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String estudiantesAsesoria() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        respuesta = new HashMap();
        List<BeanEstudiante> listEstudiantes = daoAsesoria.getStudentsCourse(param_integer);
        respuesta.put("listStudents", listEstudiantes);
        respuesta.put("idCourse", param_integer);

        System.out.println("listEstudiantes" + listEstudiantes.size());
        String courseDate = listEstudiantes.get(0).getBeanAsesoriaEstudiante().getDate();
        Calendar c = Calendar.getInstance();

        String month = Integer.toString(c.get(Calendar.MONTH) + 1);
        if (Integer.parseInt(month) < 10) {
            month = '0' + month;
        }
        
        String currentDate = Integer.toString(c.get(Calendar.YEAR)) + "-" + month + "-" + Integer.toString(c.get(Calendar.DATE));

        int active = 0;
        if (courseDate.equals(currentDate)) {
            active = 1;
        }
        respuesta.put("active", active);
        return SUCCESS;
    }

    public String pasarLista() {
        DaoAsesoria daoAsesoria = new DaoAsesoria();
        try {
            JSONObject myObj = new JSONObject(datos);
            int idStudent = myObj.getInt("idStudent");
            int idCourse = myObj.getInt("idCourse");
            int typeAttendance = myObj.getInt("checked");
            if (daoAsesoria.attendanceList(idStudent, idCourse, typeAttendance)) {
                return SUCCESS;
            } else {
                return ERROR;
            }
        } catch (JSONException ex) {
            Logger.getLogger(ControlDocente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return SUCCESS;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Map respuesta) {
        this.respuesta = respuesta;
    }

    public void setParam_integer(int param_integer) {
        this.param_integer = param_integer;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }
}
