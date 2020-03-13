/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.persona.dao;

import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.permiso.bean.BeanPermiso;
import com.sgaa.persona.bean.BeanPersona;
import com.sgaa.usuario.bean.BeanUsuario;
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
public class DaoPersona {

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

    public BeanPersona getProfile(int idPerson) {
        BeanPersona beanPersona = null;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_getProfile(?)}");
            cstm.setInt(1, idPerson);
            rs = cstm.executeQuery();

            if (rs.next()) {
                beanPersona = new BeanPersona();
                beanPersona.setId_persona(rs.getInt("id_person"));
                beanPersona.setCurp(rs.getString("curp"));
                beanPersona.setNombre(rs.getString("name"));
                beanPersona.setPrimer_apellido(rs.getString("last_name"));
                beanPersona.setSegundo_apellido(rs.getString("second_last_name"));
                beanPersona.setFecha_nacimiento(rs.getString("day_birth"));

                BeanUsuario beanUsuario = new BeanUsuario();
                beanUsuario.setUsername(rs.getString("email"));
                beanUsuario.setPassword(rs.getString("password"));

                beanPersona.setUsuario(beanUsuario);

            }
        } catch (SQLException e) {
            System.out.println("Error en el método getProfile " + e.getMessage());
        }
        return beanPersona;
    }

    public boolean editProfile(BeanPersona beanPersona) {
        boolean edited = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_editProfile(?, ?, ?, ?, ?, ?, ?, ?)}");
            cstm.setInt(1, beanPersona.getId_persona());
            cstm.setString(2, beanPersona.getCurp());
            cstm.setString(3, beanPersona.getNombre());
            cstm.setString(4, beanPersona.getPrimer_apellido());
            cstm.setString(5, beanPersona.getSegundo_apellido());
            cstm.setString(6, beanPersona.getFecha_nacimiento());
            cstm.setString(7, beanPersona.getUsuario().getUsername());
            cstm.setString(8, beanPersona.getUsuario().getPassword());

            edited = cstm.executeUpdate() == 1;
        } catch (SQLException e) {
            System.out.println("Error en el método editProfile " + e.getMessage());
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
