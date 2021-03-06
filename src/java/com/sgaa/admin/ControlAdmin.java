/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.carrera.dao.DaoCarrera;
import com.sgaa.controlAcceso.control.IniciarSesion;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.cuatrimestre.dao.DaoCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.docente.dao.DaoDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.estado.dao.DaoEstado;
import com.sgaa.estudiante.dao.DaoEstudiante;
import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.genero.dao.DaoGenero;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.grupo.dao.DaoGrupo;
import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.horario.dao.DaoHorario;
import com.sgaa.letra.bean.BeanLetra;
import com.sgaa.letra.dao.DaoLetra;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
import com.sgaa.numero_cuatrimestre.dao.DaoNumeroCuatrimestre;
import com.sgaa.persona.bean.BeanPersona;
import com.sgaa.usuario.bean.BeanUsuario;
import com.sgaa.persona.dao.DaoPersona;
import com.sgaa.usuario.bean.BeanUsuario;
import freemarker.ext.beans.HashAdapter;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author netmo
 */
public class ControlAdmin extends ActionSupport {

    Map respuesta;
    String params;
    int idNumero_cuatri;
    int idLetra;
    int idDocente;
    int idCuatrimestre;
    int idFecha_registro;
    int idCarrera;
    int idEstado;
    int idGenero;
    String mensaje;
    String cedula;
    String desc;
    String curp;
    String nombre;
    String primer_apellido;
    String segundo_apellido;
    String fecha_nacimiento;
    String username;
    String password;
    int param_integer;
    private BeanHorario horario;
    private BeanGrupo grupo;

    public String inicioHorario() {
        DaoEstudiante dao = new DaoEstudiante();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("horarios", dao.listSchedules());
        return SUCCESS;
    }

    public String inicioGrupo() {
        DaoGrupo dao = new DaoGrupo();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("grupos", dao.listGrupos());
        return SUCCESS;
    }

    public String inicioDocente() {
        DaoDocente daoDocente = new DaoDocente();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("docentes", daoDocente.listAllDocentes());
        return SUCCESS;
    }

    public String prepararRegistrarGrupo() {
        DaoGrupo dao = new DaoGrupo();
        DaoEstado daoEstado = new DaoEstado();
        DaoLetra daoLetra = new DaoLetra();
        DaoDocente daoDocente = new DaoDocente();
        DaoNumeroCuatrimestre daoNumeroCuatrimestre = new DaoNumeroCuatrimestre();
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        DaoCarrera daoCarrera = new DaoCarrera();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("numeroCuatris", daoNumeroCuatrimestre.listNumeroCuatris());
        respuesta.put("letras", daoLetra.listLetras());
        respuesta.put("docentes", daoDocente.listDocentes());
        respuesta.put("cuatrimestres", daoCuatrimestre.listCuatrimestres());
        respuesta.put("carreras", daoCarrera.listCarreras());
        respuesta.put("estados", daoEstado.listEstados());
        respuesta.put("grupos", dao.listGrupos());
        return SUCCESS;
    }

    public String prepararRegistrarDocente() {
        DaoGenero daoGenero = new DaoGenero();
        respuesta = new HashMap();
        respuesta.put("mensaje", mensaje);
        respuesta.put("generos", daoGenero.listGeneros());
        return SUCCESS;
    }

    public String registrarHorario() {
        respuesta = new HashMap();
        DaoHorario dao = new DaoHorario();
        horario.setHora_fin(params);
        if (dao.addHorario(horario)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String registrarGrupo() {
        respuesta = new HashMap();
        DaoGrupo daoGrupo = new DaoGrupo();
        grupo.setCuatrimestre(new BeanCuatrimestre(idCuatrimestre));
        grupo.setCarrera(new BeanCarrera(idCarrera));
        grupo.setDocente(new BeanDocente(idDocente));
        grupo.setLetra(new BeanLetra(idLetra));
        grupo.setEstado(new BeanEstado(idEstado));
        if (daoGrupo.nuevoGrupo(grupo)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String registrarDocente() {
        respuesta = new HashMap();
        DaoDocente daoDocente = new DaoDocente();
        BeanDocente beanDocente = new BeanDocente();
        beanDocente.setUsuario(new BeanUsuario(username, password));
        beanDocente.setGenero(new BeanGenero(idGenero));
        beanDocente.setFecha_nacimiento(fecha_nacimiento);
        beanDocente.setCurp(curp);
        beanDocente.setNombre(nombre);
        beanDocente.setPrimer_apellido(primer_apellido);
        beanDocente.setSegundo_apellido(segundo_apellido);
        beanDocente.setCedula(cedula);
        beanDocente.setDesc(desc);
        if (daoDocente.nuevoDocente(beanDocente)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String modificarGrupo() {
        respuesta = new HashMap();
        DaoGrupo daoGrupo = new DaoGrupo();
        grupo.setCuatrimestre(new BeanCuatrimestre(idCuatrimestre));
        grupo.setCarrera(new BeanCarrera(idCarrera));
        grupo.setDocente(new BeanDocente(idDocente));
        grupo.setLetra(new BeanLetra(idLetra));
        grupo.setEstado(new BeanEstado(idEstado));
        grupo.setId_grupo(param_integer);
        if (daoGrupo.modificarGrupo(grupo)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String cambiarEstado() {
        DaoHorario dao = new DaoHorario();
        respuesta = new HashMap();
        System.out.println(params);
        horario.setEstado(params);
        if (dao.cambiarEstadoHorario(horario)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String cambiarEstadoGrupo() {
        DaoGrupo dao = new DaoGrupo();
        respuesta = new HashMap();
        System.out.println("paramsparamsparamsparamsparams+." + params);
        if (dao.cambiarEstadoGrupo(params)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String cambiarEstadoDocente() {
        DaoDocente daoDocente = new DaoDocente();
        respuesta = new HashMap();
        System.out.println("paramsparamsparamsparamsparams+." + params);
        if (daoDocente.cambiarEstadoDocente(params)) {
            respuesta.put("mensaje", "1");
        } else {
            respuesta.put("mensaje", "2");
        }
        return SUCCESS;
    }

    public String inicioPeriodos() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        respuesta = new HashMap();
        respuesta.put("listQuarters", daoCuatrimestre.getQuarters());
        return SUCCESS;
    }

    public String registrarPeriodo() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        BeanCuatrimestre beanCuatrimestre = new BeanCuatrimestre();

        try {
            JSONObject myObj = new JSONObject(mensaje);
            beanCuatrimestre.setNombre(myObj.getString("nombre"));
            beanCuatrimestre.setFecha_inicio(myObj.getString("fechaInicio"));
            beanCuatrimestre.setFecha_fin(myObj.getString("fechaFin"));
        } catch (JSONException ex) {
            Logger.getLogger(ControlAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        respuesta = new HashMap();
        respuesta.put("bandera", daoCuatrimestre.newQuarter(beanCuatrimestre));
        return SUCCESS;
    }

    public String modificarEstado() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        respuesta = new HashMap();
        if (daoCuatrimestre.editStatusQuarter(param_integer)) {
            respuesta.put("bandera", true);
        } else {
            respuesta.put("bandera", false);
        }
        return SUCCESS;
    }

    public String infoPeriodo() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();

        respuesta = new HashMap();
        respuesta.put("cuatrimestre", daoCuatrimestre.getInfoQuarter(param_integer));
        return SUCCESS;
    }

    public String infoGrupo() {
        System.out.println("Entra al metodo");
        DaoGrupo dao = new DaoGrupo();
        DaoEstado daoEstado = new DaoEstado();
        DaoLetra daoLetra = new DaoLetra();
        DaoDocente daoDocente = new DaoDocente();
        DaoNumeroCuatrimestre daoNumeroCuatrimestre = new DaoNumeroCuatrimestre();
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        DaoCarrera daoCarrera = new DaoCarrera();

        grupo = dao.getGrupo(param_integer);

        respuesta = new HashMap();
        respuesta.put("idCuatrimestre", grupo.getCuatrimestre().getId_cuatrimestre());
        respuesta.put("idNumeroCuatri", grupo.getNumero_cuatri().getId_numero_cuatri());
        respuesta.put("idCuatrimestre", grupo.getCuatrimestre().getId_cuatrimestre());
        respuesta.put("idCarrera", grupo.getCarrera().getId_carrera());
        respuesta.put("idDocente", grupo.getDocente().getId_docent());
        respuesta.put("idLetra", grupo.getLetra().getId_letra());
        respuesta.put("idEstado", grupo.getEstado().getId_estado());
        respuesta.put("idGrupo", grupo.getId_grupo());
        respuesta.put("mensaje", mensaje);
        respuesta.put("grupo", grupo);
        respuesta.put("numeroCuatris", daoNumeroCuatrimestre.listNumeroCuatris());
        respuesta.put("letras", daoLetra.listLetras());
        respuesta.put("docentes", daoDocente.listDocentes());
        respuesta.put("cuatrimestres", daoCuatrimestre.listCuatrimestres());
        respuesta.put("carreras", daoCarrera.listCarreras());
        respuesta.put("estados", daoEstado.listEstados());
        respuesta.put("grupos", dao.listGrupos());

        return SUCCESS;
    }

    public String modificarPeriodo() {
        DaoCuatrimestre daoCuatrimestre = new DaoCuatrimestre();
        BeanCuatrimestre beanCuatrimestre = null;
        try {
            JSONObject myObj = new JSONObject(mensaje);
            beanCuatrimestre = new BeanCuatrimestre();
            beanCuatrimestre.setId_cuatrimestre(myObj.getInt("idCuatrimestre"));
            beanCuatrimestre.setNombre(myObj.getString("nombre"));
            beanCuatrimestre.setFecha_inicio(myObj.getString("fechaInicio"));
            beanCuatrimestre.setFecha_fin(myObj.getString("fechaFin"));
        } catch (JSONException ex) {
            Logger.getLogger(ControlAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }

        respuesta = new HashMap();
        respuesta.put("bandera", daoCuatrimestre.editQuarter(beanCuatrimestre));
        return SUCCESS;
    }

    public String verPerfil() {
        DaoPersona daoPersona = new DaoPersona();
        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }

        respuesta = new HashMap();
        respuesta.put("persona", daoPersona.getProfile(persona.getId_persona()));
        return SUCCESS;
    }

    public String modificarPerfil() {
        DaoPersona daoPersona = new DaoPersona();

        Map session = ActionContext.getContext().getSession();
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        }
        respuesta = new HashMap();
        try {
            JSONObject myObj = new JSONObject(mensaje);
            persona.setNombre(myObj.getString("nombre"));
            persona.setPrimer_apellido(myObj.getString("apellidoM"));
            persona.setSegundo_apellido(myObj.getString("apellidoP"));
            persona.setFecha_nacimiento(myObj.getString("fechaNac"));
            persona.setCurp(myObj.getString("curp"));

            BeanUsuario beanUsuario = new BeanUsuario();
            beanUsuario.setUsername(myObj.getString("email"));
            beanUsuario.setPassword(myObj.getString("contra"));
            System.out.println(myObj.getString("contra"));
            persona.setUsuario(beanUsuario);
        } catch (JSONException ex) {
            Logger.getLogger(ControlAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }

        respuesta.put("bandera", daoPersona.editProfile(persona));
        return SUCCESS;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public void setParam_integer(int param_integer) {
        this.param_integer = param_integer;
    }

    public Map getRespuesta() {
        return respuesta;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public void setHorario(BeanHorario horario) {
        this.horario = horario;
    }

    public void setGrupo(BeanGrupo grupo) {
        this.grupo = grupo;
    }

    public void setIdNumero_cuatri(int idNumero_cuatri) {
        this.idNumero_cuatri = idNumero_cuatri;
    }

    public void setIdLetra(int idLetra) {
        this.idLetra = idLetra;
    }

    public void setIdDocente(int idDocente) {
        this.idDocente = idDocente;
    }

    public void setIdCuatrimestre(int idCuatrimestre) {
        this.idCuatrimestre = idCuatrimestre;
    }

    public void setIdFecha_registro(int idFecha_registro) {
        this.idFecha_registro = idFecha_registro;
    }

    public void setIdCarrera(int idCarrera) {
        this.idCarrera = idCarrera;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public int getIdNumero_cuatri() {
        return idNumero_cuatri;
    }

    public int getIdLetra() {
        return idLetra;
    }

    public int getIdDocente() {
        return idDocente;
    }

    public int getIdCuatrimestre() {
        return idCuatrimestre;
    }

    public int getIdFecha_registro() {
        return idFecha_registro;
    }

    public int getIdCarrera() {
        return idCarrera;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimer_apellido() {
        return primer_apellido;
    }

    public void setPrimer_apellido(String primer_apellido) {
        this.primer_apellido = primer_apellido;
    }

    public String getSegundo_apellido() {
        return segundo_apellido;
    }

    public void setSegundo_apellido(String segundo_apellido) {
        this.segundo_apellido = segundo_apellido;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
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
}
