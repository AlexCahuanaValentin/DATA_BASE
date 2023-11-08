package pe.edu.vallegrande.producto.prueba;

import pe.edu.vallegrande.producto.service.CrudProductoService;


public class Eliminar {

	public static void main(String[] args) {
		try {
			// Datos de consulta
			Integer id = 123426;
			// Proceso
			CrudProductoService service = new CrudProductoService();
			service.delete(id);
			// Reporte
			System.out.println("Registro eliminado logicamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
