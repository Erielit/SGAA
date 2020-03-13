/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.coordinador.dao;

import com.sgaa.estudiante.bean.BeanEstudiante;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utileria.SQLConnection;

/**
 *
 * @author netmo
 */
public class DaoCoordinadorUtils {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    boolean result;

    public List<BeanEstudiante> estudiantesEstadisticasM() {
        String sql = "{call sp_list_stadistics_M}";
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall(sql);
            rs = cstm.executeQuery();
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setId_estudiante(rs.getInt(1));
                estudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error estadisticas " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
    }

    public List<BeanEstudiante> estudiantesEstadisticasH() {
        String sql = "{call sp_list_stadistics_H}";
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall(sql);
            rs = cstm.executeQuery();
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setId_estudiante(rs.getInt(1));
                estudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error estadisticas " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
    }

    public List<BeanEstudiante> estudiantesEstadisticasDirectedM() {
        String sql = "{call sp_list_stadistics_directed_M}";
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall(sql);
            rs = cstm.executeQuery();
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setId_estudiante(rs.getInt(1));
                estudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error estudiantesEstadisticasDirectedM " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
    }

    public List<BeanEstudiante> estudiantesEstadisticasDirectedH() {
        String sql = "{call sp_list_stadistics_directed_H}";
        BeanEstudiante estudiante = null;
        List<BeanEstudiante> estudiantes = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall(sql);
            rs = cstm.executeQuery();
            while (rs.next()) {
                estudiante = new BeanEstudiante();
                estudiante.setId_estudiante(rs.getInt(1));
                estudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            System.out.println("Error estudiantesEstadisticasDirectedH " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return estudiantes;
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
            Logger.getLogger(DaoCoordinadorUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
