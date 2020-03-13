/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.carrera.dao;

import com.sgaa.carrera.dao.*;
import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.divisionAcademica.bean.BeanDivisionAcademica;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
import com.sgaa.usuario.dao.DaoUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class DaoCarrera {

    Connection con;
    CallableStatement call;
    ResultSet rs;

    public List<BeanCarrera> consultarCarreras() {
        List<BeanCarrera> carreras = new ArrayList<>();
        BeanDivisionAcademica division = new BeanDivisionAcademica();
        BeanEstado estado = new BeanEstado();
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_inicioCarrera}");
            rs = call.executeQuery();
         
            while (rs.next()) {
                estado = new BeanEstado(rs.getInt("id_status"));
               
                BeanCarrera carrera = new BeanCarrera(rs.getInt("id_career"), rs.getString("name"),
                        rs.getString("acronym"), rs.getString("description"), division, estado);
                System.out.println("");
                carreras.add(carrera);
            }
        } catch (Exception e) {
            System.err.println("Error | DaoCarrera - consultarCarreras() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return carreras;
    }

    public boolean registrarCarrera(BeanCarrera carrera) {
        int idNuevo = 0;
        BeanDivisionAcademica division = new BeanDivisionAcademica();
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_registrarCarrera(?,?,?)}");
            call.setString(1, carrera.getNombre());
            call.setString(2, carrera.getSiglas());
            call.setString(3, carrera.getDescripciont());
            return (call.executeUpdate() == 1);

        } catch (Exception e) {
            System.err.println("Error DaoCarrera - registrarCarrera() -> " + e.getMessage() );
        } finally {
            cerrarConexiones();
        }
        return false;
    }
    
       public BeanCarrera consultaIndividualCarrera(int idCarrera) {
        BeanCarrera carrera = new BeanCarrera();
           System.out.println("idCarrera->" + idCarrera);
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_consultaInCarrera(?)}");
            call.setInt(1, idCarrera);
            rs = call.executeQuery();
            if (rs.next()) {
                carrera.setId_carrera(rs.getInt("id_career"));
                carrera.setNombre(rs.getString("name"));
                carrera.setSiglas((rs.getString("acronym")));
                carrera.setDescripciont(rs.getString("description"));
                carrera.setId_carrera(rs.getInt("id_academic_division"));
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoCarrera - consultaindividualCarrera()" + ex);
        } finally {
            cerrarConexiones();
        }
        return carrera;
    }
    
    

          public boolean modificarCarrera(BeanCarrera carrera) {
        boolean modificado = false;
        try {
            con = SQLConnection.getConnection();
            System.out.println("-->>>" + carrera.getId_carrera());
            call = con.prepareCall("{call pa_modificarCarrera(?,?,?,?)}");
            call.setInt(1, carrera.getId_carrera());
            call.setString(2, carrera.getNombre());
            call.setString(3, carrera.getSiglas());
            call.setString(4, carrera.getDescripciont());

            modificado = call.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error en el método sql  modificarCarrera() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return modificado;
    }
          public boolean estadoCarrera(BeanCarrera carrera) {
        boolean modificado = false;
        try {
            con = SQLConnection.getConnection();
            System.out.println("-->>>" + carrera.getId_carrera());
            call = con.prepareCall("{call pa_estadoCarrera(?,?)}");
            call.setInt(1, carrera.getId_carrera());
            call.setInt(2, carrera.getEstado().getId_estado());

            modificado = call.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error en el método sql  modificarCarrera() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return modificado;
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
