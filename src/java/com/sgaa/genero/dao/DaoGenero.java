/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.genero.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.carrera.dao.DaoCarrera;
import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.usuario.dao.DaoUsuario;
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
public class DaoGenero {
     Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanGenero> listGeneros() {
        BeanGenero genero = null;

        List<BeanGenero> generos = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_gender()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                genero = new BeanGenero();

                genero.setId_genero(rs.getInt(1));
                genero.setGenero(rs.getString(2));

                generos.add(genero);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoGenero.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return generos;
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
