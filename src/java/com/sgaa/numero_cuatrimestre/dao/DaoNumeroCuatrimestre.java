/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.numero_cuatrimestre.dao;

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
public class DaoNumeroCuatrimestre {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanNumeroCuatri> listNumeroCuatris() {
        BeanNumeroCuatri numeroCuatri = null;

        List<BeanNumeroCuatri> numeroCuatris = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_quarter_number()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                numeroCuatri = new BeanNumeroCuatri();

                numeroCuatri.setId_numero_cuatri(rs.getInt(1));
                numeroCuatri.setNumero(rs.getInt(3));

                numeroCuatris.add(numeroCuatri);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return numeroCuatris;
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
