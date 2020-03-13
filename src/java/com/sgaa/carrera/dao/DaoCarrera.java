package com.sgaa.carrera.dao;

import com.sgaa.carrera.bean.BeanCarrera;
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

public class DaoCarrera {

    Connection con;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanCarrera> listCarreras() {
        BeanCarrera carrera = null;

        List<BeanCarrera> carreras = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_career()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                carrera = new BeanCarrera();

                carrera.setId_carrera(rs.getInt(1));
                carrera.setNombre(rs.getString(2));
                carrera.setSiglas(rs.getString(3));

                carreras.add(carrera);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoCarrera.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return carreras;
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
