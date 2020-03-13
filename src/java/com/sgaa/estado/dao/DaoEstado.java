package com.sgaa.estado.dao;

import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.letra.bean.BeanLetra;
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

public class DaoEstado {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanEstado> listEstados() {
        BeanEstado estado = null;

        List<BeanEstado> estados = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_estatus()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                estado = new BeanEstado();

                estado.setId_estado(rs.getInt(1));
                estado.setEstado(rs.getString(2));

                estados.add(estado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return estados;
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
