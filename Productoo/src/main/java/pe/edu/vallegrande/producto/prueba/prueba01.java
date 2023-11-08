package pe.edu.vallegrande.producto.prueba;

import java.sql.Connection;
import java.sql.SQLException;

import pe.edu.vallegrande.producto.db.AccesoDB;

public class prueba01 {
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Conexion ok.");
			cn.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

}
