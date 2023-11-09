package pe.edu.vallegrande.producto.prueba;

import java.util.List;

import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

public class ListarInactivos {
	public static void main(String[] args) {
		try {
			CrudProductoService service = new CrudProductoService();
			List<Producto> lista = service.getAllInactive();
			System.out.println("Filas: "+ lista.size());
			for (Producto rec : lista) {
				System.out.println(rec.getId()+"|"+rec.getName()+"|"+
						rec.getDescription()+"|"+rec.getBrand());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
