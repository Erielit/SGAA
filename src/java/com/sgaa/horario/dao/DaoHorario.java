/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.horario.dao;

import com.sgaa.horario.bean.BeanHorario;
import com.sgaa.usuario.dao.DaoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utileria.SQLConnection;

/**
 *
 * @author netmo
 */
public class DaoHorario {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public boolean addHorario(BeanHorario horario) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call add_schedule(?,?)}");//Procedimiento y/o parámetros
            cstm.setString(1, horario.getHora_inicio());
            cstm.setString(2, horario.getHora_fin());
            result = cstm.executeUpdate() == 1;//se cambió o no
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return result;
    }

    public boolean cambiarEstadoHorario(BeanHorario horario) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call change_status_schedule(?,?)}");//Procedimiento y/o parámetros
            cstm.setInt(1, horario.getId_horario());
            cstm.setString(2, horario.getEstado());
            result = cstm.executeUpdate() == 1;//se cambió o no
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
