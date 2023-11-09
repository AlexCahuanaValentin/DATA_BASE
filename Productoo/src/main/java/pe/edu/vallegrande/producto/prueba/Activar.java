package pe.edu.vallegrande.producto.prueba;

import pe.edu.vallegrande.producto.service.CrudProductoService;

public class Activar {
	public static void main(String[] args) {
		try {
			// Datos de consulta
			Integer id = 123427;
			// Proceso
			CrudProductoService service = new CrudProductoService();
			service.activar(id);
			// Reporte
			System.out.println("Registro activado logicamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
