package pe.edu.vallegrande.producto.prueba;

import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

public class Insertar {

	public static void main(String[] args) {
		try {
			// Datos de consulta
			Producto model = new Producto();
			model.setId(123426);
			model.setNombre("recarga 5");
			model.setDescrip("solo operador claro");
			model.setPuntos("1500");
			// Proceso
			CrudProductoService service = new CrudProductoService();
			service.insert(model); // Llama al método insert de CrudClienteService
			// Reporte
			System.out.println("Registro grabado correctamente");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
