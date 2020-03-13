/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia_docente.dao;

import com.sgaa.materia_docente.bean.BeanMateriaDocente;
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
public class DaoMateriaDocente {
     Connection con;
    CallableStatement call;
    ResultSet rs;
    
     public int registrarMateria(BeanMateriaDocente materia) {
        int idNuevo = 0;
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_docenteMateria(?,?)}");
            call.setInt(1, materia.getMateria().getId_materia());
            call.setInt(2, materia.getDocente().getId_docent());
           
            if (call.executeUpdate() == 1) {
                rs = call.getGeneratedKeys();
                if (rs.next()) {
                    idNuevo = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.err.println("Error DaoMateria - registrarMateriaDocente() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return idNuevo;
    }

    public void cerrarConexiones() {
        try {
            if (con != null) {
                con.close();
            }
            if (call != null) {
                call.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
