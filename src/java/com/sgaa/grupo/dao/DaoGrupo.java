/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.grupo.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.letra.bean.BeanLetra;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
import com.sgaa.usuario.dao.DaoUsuario;
import utileria.SQLConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author netmo
 */
public class DaoGrupo {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanGrupo> listGrupos() {
        BeanGrupo grupo = null;

        BeanNumeroCuatri numero_cuatri;
        BeanLetra letra;
        BeanDocente docente;
        BeanCuatrimestre cuatrimestre;
        BeanCarrera carrera;
        BeanEstado estado;

        List<BeanGrupo> grupos = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_groups()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                grupo = new BeanGrupo();

                numero_cuatri = new BeanNumeroCuatri();
                letra = new BeanLetra();
                docente = new BeanDocente();
                cuatrimestre = new BeanCuatrimestre();
                carrera = new BeanCarrera();
                estado = new BeanEstado();

                grupo.setId_grupo(rs.getInt(1));
                grupo.setFecha_registro(rs.getString(7));

                numero_cuatri.setId_numero_cuatri(rs.getInt(9));
                numero_cuatri.setNumero(rs.getInt(11));

                letra.setId_letra(rs.getInt(12));
                letra.setLetra(rs.getString(13));

                docente.setId_docent(rs.getInt(14));
                docente.setNombre(rs.getString(20));
                docente.setPrimer_apellido(rs.getString(21));
                docente.setSegundo_apellido(rs.getString(22));

                cuatrimestre.setId_cuatrimestre(rs.getInt(26));
                cuatrimestre.setNombre(rs.getString(27));

                carrera.setId_carrera(rs.getInt(31));
                carrera.setNombre(rs.getString(32));

                estado.setId_estado(rs.getInt(37));
                estado.setEstado(rs.getString(38));

                grupo.setNumero_cuatri(numero_cuatri);
                grupo.setLetra(letra);
                grupo.setDocente(docente);
                grupo.setCuatrimestre(cuatrimestre);
                grupo.setCarrera(carrera);
                grupo.setEstado(estado);
                grupos.add(grupo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoGrupo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return grupos;
    }

    public BeanGrupo getGrupo(int idGrupo) {
        BeanGrupo grupo = null;

        BeanNumeroCuatri numero_cuatri;
        BeanLetra letra;
        BeanDocente docente;
        BeanCuatrimestre cuatrimestre;
        BeanCarrera carrera;
        BeanEstado estado;

        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_get_group(?)}");
            cstm.setInt(1, idGrupo);
            rs = cstm.executeQuery();
            while (rs.next()) {
                grupo = new BeanGrupo();

                numero_cuatri = new BeanNumeroCuatri();
                letra = new BeanLetra();
                docente = new BeanDocente();
                cuatrimestre = new BeanCuatrimestre();
                carrera = new BeanCarrera();
                estado = new BeanEstado();

                grupo.setId_grupo(rs.getInt(1));
                grupo.setFecha_registro(rs.getString(7));

                numero_cuatri.setId_numero_cuatri(rs.getInt(9));
                numero_cuatri.setNumero(rs.getInt(11));

                letra.setId_letra(rs.getInt(12));
                letra.setLetra(rs.getString(13));

                docente.setId_docent(rs.getInt(14));
                docente.setNombre(rs.getString(20));
                docente.setPrimer_apellido(rs.getString(21));
                docente.setSegundo_apellido(rs.getString(22));

                cuatrimestre.setId_cuatrimestre(rs.getInt(26));
                cuatrimestre.setNombre(rs.getString(27));

                carrera.setId_carrera(rs.getInt(31));
                carrera.setNombre(rs.getString(32));

                estado.setId_estado(rs.getInt(37));
                estado.setEstado(rs.getString(38));

                grupo.setNumero_cuatri(numero_cuatri);
                grupo.setLetra(letra);
                grupo.setDocente(docente);
                grupo.setCuatrimestre(cuatrimestre);
                grupo.setCarrera(carrera);
                grupo.setEstado(estado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoGrupo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return grupo;
    }

    public boolean cambiarEstadoGrupo(String grupo) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call change_status_group(?)}");
            cstm.setString(1, grupo);
            result = cstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(DaoGrupo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public boolean nuevoGrupo(BeanGrupo grupo) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_new_group(?,?,?,?,?,?)}");
            cstm.setInt(1, grupo.getNumero_cuatri().getId_numero_cuatri());
            System.out.println("grupo.getNumero_cuatri().getId_numero_cuatri()" + grupo.getNumero_cuatri().getId_numero_cuatri());
            cstm.setInt(2, grupo.getLetra().getId_letra());
            System.out.println("grupo.getLetra().getId_letra()" + grupo.getLetra().getId_letra());
            cstm.setInt(3, grupo.getDocente().getId_docent());
            System.out.println("grupo.getDocente().getId_docent()" + grupo.getDocente().getId_docent());
            cstm.setInt(4, grupo.getCuatrimestre().getId_cuatrimestre());
            System.out.println("grupo.getCuatrimestre().getId_cuatrimestre()" + grupo.getCuatrimestre().getId_cuatrimestre());
            cstm.setInt(5, grupo.getCarrera().getId_carrera());
            System.out.println("grupo.getCarrera().getId_carrera()" + grupo.getCarrera().getId_carrera());
            cstm.setInt(6, grupo.getEstado().getId_estado());
            System.out.println("grupo.getEstado().getId_estado()" + grupo.getEstado().getId_estado());
            result = cstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(DaoGrupo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public boolean modificarGrupo(BeanGrupo grupo) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_mod_group(?,?,?,?,?,?,?)}");
            cstm.setInt(1, grupo.getNumero_cuatri().getId_numero_cuatri());
            System.out.println("grupo.getNumero_cuatri().getId_numero_cuatri()" + grupo.getNumero_cuatri().getId_numero_cuatri());
            cstm.setInt(2, grupo.getLetra().getId_letra());
            System.out.println("grupo.getLetra().getId_letra()" + grupo.getLetra().getId_letra());
            cstm.setInt(3, grupo.getDocente().getId_docent());
            System.out.println("grupo.getDocente().getId_docent()" + grupo.getDocente().getId_docent());
            cstm.setInt(4, grupo.getCuatrimestre().getId_cuatrimestre());
            System.out.println("grupo.getCuatrimestre().getId_cuatrimestre()" + grupo.getCuatrimestre().getId_cuatrimestre());
            cstm.setInt(5, grupo.getCarrera().getId_carrera());
            System.out.println("grupo.getCarrera().getId_carrera()" + grupo.getCarrera().getId_carrera());
            cstm.setInt(6, grupo.getEstado().getId_estado());
            System.out.println("grupo.getEstado().getId_estado()" + grupo.getEstado().getId_estado());
            cstm.setInt(7, grupo.getId_grupo());
            System.out.println("grupo.getId_grupo()" + grupo.getId_grupo());
            result = cstm.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(DaoGrupo.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
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
