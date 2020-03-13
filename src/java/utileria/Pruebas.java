package utileria;

import com.sgaa.docente.dao.DaoDocente;

public class Pruebas {

    public static void main(String[] args) {
        DaoDocente daoDocente = new DaoDocente();
        daoDocente.listDocentes().forEach(beanLetra ->
                System.out.println("bfuis" + beanLetra.getNombre())
        );
    }
}
