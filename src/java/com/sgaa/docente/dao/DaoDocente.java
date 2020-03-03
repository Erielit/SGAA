/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.docente.dao;

import com.sgaa.docente.bean.BeanDocente;
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
