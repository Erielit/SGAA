/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.letra.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.letra.bean.BeanLetra;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
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
public class DaoLetra {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    
    public List<BeanLetra> listLetras() {
        BeanLetra letra = null;

        List<BeanLetra> letras = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_letter()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                letra = new BeanLetra();

                letra.setId_letra(rs.getInt(1));
                letra.setLetra(rs.getString(2));

                letras.add(letra);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return letras;
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
