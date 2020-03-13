/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.materia.dao;

import com.sgaa.carrera.bean.BeanCarrera;
import com.sgaa.docente.bean.BeanDocente;
import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.materia.bean.BeanMateria;
import com.sgaa.materia_docente.bean.BeanMateriaDocente;
import com.sgaa.numero_cuatrimestre.bean.BeanNumeroCuatri;
import com.sgaa.usuario.bean.BeanUsuario;
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
public class DaoMateria {

    Connection con;
    CallableStatement call;
    ResultSet rs;

    public List<BeanMateria> consultarMaterias() {
        List<BeanMateria> materias = new ArrayList<>();
        BeanCarrera carrera;
        BeanNumeroCuatri numero_cuatri;
        BeanEstado estado;
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_consultarMateria}");
            rs = call.executeQuery();
            estado = new BeanEstado();
            while (rs.next()) {
                numero_cuatri = new BeanNumeroCuatri(rs.getInt("quarter_number"));
                carrera = new BeanCarrera(rs.getString("nombreCarrera"));
                estado = new BeanEstado(rs.getInt("id_status"));
                BeanMateria materia = new BeanMateria(rs.getInt("id_subject"), rs.getString("ident_subject"),
                        rs.getString("name"), rs.getString("description"), carrera, numero_cuatri, estado);
                materias.add(materia);
            }
            System.out.println("-> " + materias.get(1).getDesc());
        } catch (Exception e) {
            System.err.println("Error | DaoMateria - consultarMaterias() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return materias;
    }
    
    
    public List<BeanDocente> consultarDocentes(int id) {
        List<BeanDocente> docentes = new ArrayList<>();

        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_consultaDocentes(?)}");
            call.setInt(1, id);
            rs = call.executeQuery();

            while (rs.next()) {
                BeanGenero genero = new BeanGenero();
                BeanUsuario usuario = new BeanUsuario();
                BeanDocente docente = new BeanDocente(rs.getInt("id_docent"), rs.getString("professional_id"),
                        rs.getString("description"), rs.getInt("id_person"), rs.getString("curp"),
                        rs.getString("name"), rs.getString("last_name"), rs.getString("second_last_name"),
                        rs.getString("day_birth"), genero, usuario);
                docentes.add(docente);
            }

            System.out.println("-Dao> " + docentes.get(1).getDesc());
        } catch (Exception e) {
            System.err.println("Error | DaoDocente - consultarDocentes() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return docentes;
    }

    public int registrarMateria(BeanMateria materia) {
        int idNuevo = 0;
        BeanCarrera carrera = new BeanCarrera();
        BeanNumeroCuatri cuatri = new BeanNumeroCuatri();
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_registrarMateria(?,?,?,?,?)}");
            call.setString(1, materia.getIdentificador());
            call.setString(2, materia.getNombre());
            call.setString(3, materia.getDesc());
            call.setInt(4, materia.getNumero_cuatri().getId_numero_cuatri());
            call.setInt(5, materia.getCarrera().getId_carrera());

            if (call.executeUpdate() == 1) {
                rs = call.getGeneratedKeys();
                if (rs.next()) {
                    idNuevo = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.err.println("Error DaoMateria - registrarMateria() -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return idNuevo;
    }

    public boolean modificarMateria(BeanMateria materia) {
        boolean modificado = false;
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_modMateria(?,?,?,?,?,?)}");
            System.out.println("Dao->" + materia.getNombre());
            call.setString(1, materia.getIdentificador());
            call.setString(2, materia.getNombre());
            call.setString(3, materia.getDesc());
            call.setInt(4, materia.getNumero_cuatri().getId_numero_cuatri());
            call.setInt(5, materia.getCarrera().getId_carrera());
            call.setInt(6, materia.getId_materia());
            modificado = call.executeUpdate() == 1;
        } catch (SQLException e) {
            System.err.println("Error en el método sql ModificarMateria -> " + e.getMessage());
        } finally {
            cerrarConexiones();
        }
        return modificado;
    }

    public BeanMateria consultaIndividualMateria(int idMateria) {
        BeanMateria materia = new BeanMateria();
        BeanCarrera carrera = new BeanCarrera();
        BeanNumeroCuatri cuatri = new BeanNumeroCuatri();
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call pa_consultaInMateria(?)}");
            call.setInt(1, idMateria);
            rs = call.executeQuery();
            if (rs.next()) {
                materia.setId_materia(rs.getInt("id_subject"));
                materia.setIdentificador(rs.getString("ident_subject"));
                materia.setNombre(rs.getString("name"));
                materia.setDesc(rs.getString("description"));
                cuatri.setId_numero_cuatri(rs.getInt("id_quarter_number"));
                materia.setNumero_cuatri(cuatri);
                carrera.setId_carrera(rs.getInt("id_career"));
                materia.setCarrera(carrera);
            }
        } catch (SQLException ex) {
            System.out.println("Error DaoMateria - consultaindividualMateria()" + ex);
        } finally {
            cerrarConexiones();
        }
        return materia;
    }

    public boolean estadoMateria(BeanMateria materia) {
        boolean modificado = false;
        try {
            con = SQLConnection.getConnection();
            int m = materia.getId_materia();
            int estado = materia.getEstado().getId_estado();
            call = con.prepareCall("update subject set id_status = ? where id_subject = ?;");
            call.setInt(2, m);
            call.setInt(1, estado);

            modificado = call.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error en el método sql estadoMateria() -> " + e.getMessage());
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
