package pe.edu.vallegrande.producto.prueba;

import java.util.List;

import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

public class Buscar {
	
	public static void main(String[] args) {
		try {
			// Datos de consulta
			Producto model = new Producto();
			model.setName(" ");
			model.setType(" audifono ");
			// Proceso
			CrudProductoService service = new CrudProductoService();
			List<Producto> lista = service.get(model);
			// Reporte
			System.out.println("LISTADO");
			System.out.println("Registros: " + lista.size());
			for (Producto rec : lista) {
				System.out.println(rec.getId() + " - " + rec.getName() + " - " + rec.getType() + " - " + rec.getBrand());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
