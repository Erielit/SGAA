/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.grupo.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.cuatrimestre.bean.BeanCuatrimestre;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.grupo.bean.BeanGrupo;
import com.sgaa.horario.bean.BeanHorario;
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
public class DaoGrupo {
     Connection con;
    CallableStatement cstm;
    ResultSet rs;
    
    public boolean CambiarContrasena(String contrasena){
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("call procedureName(?,?)");//Procedimiento y/o parámetros
            rs = cstm.executeQuery();//Resultados
            result = cstm.executeUpdate() == 1;//se cambió o no
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            cerrarConexiones();
        }
        return result;
    }

    public List<BeanGrupo> listGrupos() {
        BeanGrupo grupo = null;

        BeanNumeroCuatri numero_cuatri;
        BeanLetra letra;
        BeanDocente docente;
        BeanCuatrimestre cuatrimestre;
        BeanCarrera carrera;
        BeanEstado estado;

        List<BeanGrupo> grupos = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call sp_list_groups()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                grupo = new BeanGrupo();

                numero_cuatri = new BeanNumeroCuatri();
                letra = new BeanLetra();
                docente = new BeanDocente();
                cuatrimestre = new BeanCuatrimestre();
                carrera = new BeanCarrera();
                estado = new BeanEstado();

                grupo.setId_grupo(rs.getInt(1));
                grupo.setFecha_registro(rs.getString(7));

                numero_cuatri.setId_numero_cuatri(rs.getInt(9));
                numero_cuatri.setNumero(rs.getInt(11));

                letra.setId_letra(rs.getInt(12));
                letra.setLetra(rs.getString(13));

                docente.setId_docent(rs.getInt(14));
                docente.setNombre(rs.getString(20));
                docente.setPrimer_apellido(rs.getString(21));
                docente.setSegundo_apellido(rs.getString(22));

                cuatrimestre.setId_cuatrimestre(rs.getInt(26));
                cuatrimestre.setNombre(rs.getString(27));

                carrera.setId_carrera(rs.getInt(31));
                carrera.setNombre(rs.getString(32));

                estado.setId_estado(rs.getInt(37));
                estado.setEstado(rs.getString(38));

                grupo.setNumero_cuatri(numero_cuatri);
                grupo.setLetra(letra);
                grupo.setDocente(docente);
                grupo.setCuatrimestre(cuatrimestre);
                grupo.setCarrera(carrera);
                grupo.setEstado(estado);
                grupos.add(grupo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            cerrarConexiones();
        }
        return grupos;
    }


    public boolean cambiarEstadoGrupo(String grupo) {
        boolean result = false;
        try {
            con = SQLConnection.getConnection();
            cstm = con.prepareCall("{call change_status_group(?)}");
            cstm.setString(1, grupo);
            result = cstm.executeUpdate() == 1;
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
