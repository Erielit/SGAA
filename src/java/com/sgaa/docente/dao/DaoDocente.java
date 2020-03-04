/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.docente.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estudiante.bean.BeanEstudiante;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.grupoEstudiante.bean.BeanGrupoEstudiante;
import com.sgaa.letra.bean.BeanLetra;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
import com.sgaa.usuario.bean.BeanUsuario;
import com.sgaa.usuario.dao.DaoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utileria.SQLConnection;
import java.util.List;

/**
 *
 * @author netmo
 */
public class DaoDocente {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public boolean CambiarContrasena(String contrasena) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("call procedureName(?,?)");//Procedimiento y/o parámetros
            rs = cstm.executeQuery();//Resultados
            result = cstm.executeUpdate() == 1;//se cambió o no
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public BeanDocente getInfoDocent(int idPerson) {
        BeanDocente beanDocente = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getInfoDocent(?)}");
            cstm.setInt(1, idPerson);
            rs = cstm.executeQuery();

            if (rs.next()) {
                beanDocente = new BeanDocente();
                beanDocente.setId_docent(rs.getInt("id_docent"));
                beanDocente.setCedula(rs.getString("professional_id"));
                beanDocente.setDesc(rs.getString("description"));
            }
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return beanDocente;
    }

    public boolean aceptarAsesoria(int asesoria) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_aceptar_course(?)}");
            cstm.setInt(1, asesoria);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return result;
    }
    
    public boolean rechazarAsesoria(int asesoria) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_rechazar_course(?)}");
            cstm.setInt(1, asesoria);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método SQL " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return result;
    }

        public List<BeanEstudiante> getListStudents(int idDocent) {
        List<BeanEstudiante> listaEstudiantes = new ArrayList<>();
        BeanEstudiante beanEstudiante = null;
        BeanGrupo beanGrupo = null;
        BeanCarrera beanCarrera = null;
        BeanLetra beanLetra = null;
        BeanCuatrimestre beanCuatrimestre = null;
        BeanNumeroCuatri beanNumeroCuatri = null;
        BeanUsuario beanUsuario = null;
        BeanGrupoEstudiante beanGrupoEstudiante = null;

        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getListStudents(?)}");
            cstm.setInt(1, idDocent);
            rs = cstm.executeQuery();
            while (rs.next()) {
                beanEstudiante = new BeanEstudiante();
                beanEstudiante.setId_estudiante(rs.getInt("id_student"));
                beanEstudiante.setNombre(rs.getString("name"));
                beanEstudiante.setPrimer_apellido(rs.getString("last_name"));
                beanEstudiante.setSegundo_apellido(rs.getString("second_last_name"));
                beanEstudiante.setMatricula(rs.getString("matricula"));

                beanUsuario = new BeanUsuario();
                beanUsuario.setUsername(rs.getString("email"));

                beanEstudiante.setUsuario(beanUsuario);

                beanGrupoEstudiante = new BeanGrupoEstudiante();
                beanGrupoEstudiante.setId_grupo_estudiante(rs.getInt("id_group_student"));

                beanEstudiante.setGrupoEstudiante(beanGrupoEstudiante);

                beanGrupo = new BeanGrupo();
                beanGrupo.setId_grupo(rs.getInt("id_group"));

                beanCuatrimestre = new BeanCuatrimestre();
                beanCuatrimestre.setNombre(rs.getString("quarter_name"));

                beanCarrera = new BeanCarrera();
                beanCarrera.setNombre(rs.getString("career"));

                beanLetra = new BeanLetra();
                beanLetra.setLetra(rs.getString("letter"));

                beanNumeroCuatri = new BeanNumeroCuatri();
                beanNumeroCuatri.setNumero(rs.getInt("quarter_number"));

                beanGrupo.setCuatrimestre(beanCuatrimestre);
                beanGrupo.setCarrera(beanCarrera);
                beanGrupo.setLetra(beanLetra);
                beanGrupo.setNumero_cuatri(beanNumeroCuatri);

                beanEstudiante.setGrupo(beanGrupo);
                listaEstudiantes.add(beanEstudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método getListStudents " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listaEstudiantes;
    }

    public boolean canalizeStudent(int idGroupStudent) {
        boolean canalized = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_newDirected(?)}");
            cstm.setInt(1, idGroupStudent);
            canalized = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el metodo canalizeStudent " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return canalized;
    }
    
    public void cerrarConexiones() {
        try {
            if (con != null) {
                con.close();
            }
            if (cstm != null) {
                cstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
