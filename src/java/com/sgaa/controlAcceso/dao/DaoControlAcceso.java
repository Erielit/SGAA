/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgaa.controlAcceso.dao;

import com.sgaa.estado.bean.BeanEstado;
import com.sgaa.genero.bean.BeanGenero;
import com.sgaa.persona.bean.BeanPersona;
import com.sgaa.role.bean.BeanRole;
import com.sgaa.usuario.bean.BeanUsuario;
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
public class DaoControlAcceso {

    Connection con;
    CallableStatement call;
    ResultSet rs;

    public BeanPersona iniciarSesion(String email, String password) {
        BeanPersona persona = null;
        BeanUsuario usuario = null;
        BeanGenero genero = null;
        BeanEstado estado = null;
        BeanRole role = null;
        List<BeanRole> roles = new ArrayList<>();
        try {
            con = SQLConnection.getConnection();
            call = con.prepareCall("{call iniciarSesion(?,?)}");
            call.setString(1, email);
            call.setString(2, password);
            rs = call.executeQuery();
            if (rs.next()) {
                persona = new BeanPersona();
                estado = new BeanEstado();
                usuario = new BeanUsuario();
                genero = new BeanGenero();
                persona.setId_persona(rs.getInt("id_person"));
                persona.setCurp(rs.getString("curp"));
                persona.setFecha_nacimiento(rs.getString("day_birth"));
                genero.setId_genero(rs.getInt("id_gender"));
                genero.setGenero(rs.getString("gender"));
                persona.setGenero(genero);
                persona.setNombre(rs.getString("name"));
                persona.setPrimer_apellido(rs.getString("last_name"));
                persona.setSegundo_apellido(rs.getString("second_last_name"));
                usuario.setId_usuario(rs.getInt("id_user"));
                usuario.setPassword("");
                usuario.setReset_code(rs.getString("reset_code"));
                usuario.setUsername(rs.getString("email"));
                estado.setId_estado(rs.getInt("id_status"));
                estado.setEstado(rs.getString("status"));
                role = new BeanRole();
                role.setId_role(rs.getInt("id_role"));
                role.setRole(rs.getString("role"));
                role.setDescripcion(rs.getString("description"));
                roles.add(role);
                while (rs.next()) {
                    role = new BeanRole();
                    role.setId_role(rs.getInt("id_role"));
                    role.setRole(rs.getString("role"));
                    role.setDescripcion(rs.getString("description"));
                    roles.add(role);
                }
                usuario.setRoles(roles);
                persona.setUsuario(usuario);
            }
        } catch (SQLException ex) {
            System.out.println("Error -> " + ex.getMessage());
        } finally {
            cerrarConexiones();
        }
        return persona;
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
            Logger.getLogger(DaoControlAcceso.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
