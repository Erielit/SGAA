/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.cuatrimestre.dao;

import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.docente.dao.DaoDocente;
import com.sgaa.estado.bean.BeanEstado;
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
public class DaoCuatrimestre {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanCuatrimestre> listCuatrimestres() {
        BeanCuatrimestre cuatrimestre = null;

        List<BeanCuatrimestre> cuatrimestres = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_quarter()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                cuatrimestre = new BeanCuatrimestre();

                cuatrimestre.setId_cuatrimestre(rs.getInt(1));
                cuatrimestre.setNombre(rs.getString(2));

                cuatrimestres.add(cuatrimestre);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoCuatrimestre.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return cuatrimestres;
    }

    public List<BeanCuatrimestre> getQuarters() {
        List<BeanCuatrimestre> listCuatrimestres = new ArrayList<>();
        BeanCuatrimestre beanCuatrimestre = null;
        BeanEstado beanEstado = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getQuarters}");
            rs = cstm.executeQuery();

            while (rs.next()) {
                beanCuatrimestre = new BeanCuatrimestre();
                beanCuatrimestre.setId_cuatrimestre(rs.getInt("id_quarter"));
                beanCuatrimestre.setNombre(rs.getString("quarter_name"));
                beanCuatrimestre.setFecha_inicio(rs.getString("quarter_start"));
                beanCuatrimestre.setFecha_fin(rs.getString("quarter_end"));

                beanEstado = new BeanEstado();
                beanEstado.setId_estado(rs.getInt("id_status"));

                beanCuatrimestre.setEstado(beanEstado);

                listCuatrimestres.add(beanCuatrimestre);
            }
        } catch (SQLException e) {
            System.out.println("Error en el método getQuarters " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return listCuatrimestres;
    }

    public boolean newQuarter(BeanCuatrimestre beanCuatrimestre) {
        boolean registered = false;

        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_newQuarter(?, ?, ?)}");
            cstm.setString(1, beanCuatrimestre.getNombre());
            cstm.setString(2, beanCuatrimestre.getFecha_inicio());
            cstm.setString(3, beanCuatrimestre.getFecha_fin());

            registered = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método newQuarter " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return registered;
    }

    public boolean editStatusQuarter(int idQuarter) {
        boolean edited = false;

        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_editStatusQuarter(?)}");
            cstm.setInt(1, idQuarter);

            edited = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método editQuarter " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return edited;
    }

    public BeanCuatrimestre getInfoQuarter(int idQuarter) {
        BeanCuatrimestre beanCuatrimestre = null;

        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getInfoQuarter(?)}");
            cstm.setInt(1, idQuarter);
            rs = cstm.executeQuery();
            if (rs.next()) {
                beanCuatrimestre = new BeanCuatrimestre();
                beanCuatrimestre.setId_cuatrimestre(rs.getInt("id_quarter"));
                beanCuatrimestre.setNombre(rs.getString("quarter_name"));
                beanCuatrimestre.setFecha_inicio(rs.getString("quarter_start"));
                beanCuatrimestre.setFecha_fin(rs.getString("quarter_end"));
            }
        } catch (SQLException e) {
            System.out.println("Error en el método getInfoQuarter " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return beanCuatrimestre;
    }

    public boolean editQuarter(BeanCuatrimestre beanCuatrimestre) {
        boolean edited = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_editQuarter(?, ?, ?, ?)}");
            cstm.setInt(1, beanCuatrimestre.getId_cuatrimestre());
            cstm.setString(2, beanCuatrimestre.getNombre());
            cstm.setString(3, beanCuatrimestre.getFecha_inicio());
            cstm.setString(4, beanCuatrimestre.getFecha_fin());

            edited = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método editQuarter " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return edited;
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
