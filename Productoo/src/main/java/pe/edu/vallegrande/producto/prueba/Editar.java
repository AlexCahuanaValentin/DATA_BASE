package pe.edu.vallegrande.producto.prueba;


import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;
public class Editar {

	public static void main(String[] args) {
		try {
			// Datos del cliente a editar
			int clienteId = 123427;
			// Consultar el cliente actual
			CrudProductoService consultaService = new CrudProductoService();
			Producto cliente = consultaService.getById(clienteId);

			if (cliente != null) {
				// Modificar los datos del producto
				cliente.setName("audifonos");
				cliente.setDescription("con 8h de carga");
				cliente.setPoints("3500");
				cliente.setStock(02);
				cliente.setType("audifonos");
				cliente.setBrand("xiomi");

				// Actualizar el cliente
				CrudProductoService servicio = new CrudProductoService();
				servicio.update(cliente);

				// Reporte
				System.out.println("Cliente actualizado con éxito");
			} else {
				System.out.println("El cliente con ID " + clienteId + " no existe.");
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}


