package pe.edu.vallegrande.producto.prueba;

import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

public class prueba03 {

	public static void main(String[] args) {
		try {
			// Datos de consulta
			Integer id = 123426;
			// Proceso
			CrudProductoService service = new CrudProductoService();
			Producto rec = service.getById(id);
			// Reporte
			System.out.println(rec.getName() + " - " + rec.getDescription());
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}

