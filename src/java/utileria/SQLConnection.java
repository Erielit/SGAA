package utileria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class SQLConnection {

    private static String ipAddress;
    private static String dbName;
    private static String user;
    private static String password;
    private static String service;
    private static ResourceBundle propiedadesBD;

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        if (propiedadesBD == null) {
            //búsqueda de archivos y asignación de datos            
            propiedadesBD = ResourceBundle.getBundle("properties-bd");
            ipAddress = propiedadesBD.getString("host");
            dbName = propiedadesBD.getString("nombreBD");
            user = propiedadesBD.getString("usuario");
            password = propiedadesBD.getString("contrasexa");
            service = propiedadesBD.getString("servicio");
        }
        //retorno de conexión a la BD
        return DriverManager.getConnection("jdbc:sqlserver://" + ipAddress + ":" + service + ";databaseName=" + dbName + ";user=" + user + ";password=" + password);

    }

    public static void main(String[] args) throws SQLException {
        Connection con = SQLConnection.getConnection();
        if (con != null) {
            System.out.println("Conexión establecida!");
            con.close();
        }
    }

}
