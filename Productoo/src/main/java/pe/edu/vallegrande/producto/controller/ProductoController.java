package pe.edu.vallegrande.producto.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.List;
import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

@WebServlet({ "/btnBuscar", "/CerrarSesionX", "/ClienteProcesar" }) // Mapea el servlet a la URL raíz
public class ProductoController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CrudProductoService clienteService = new CrudProductoService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/btnBuscar":
			buscar(request, response);
			break;
		case "/ClienteProcesar":
			procesar(request, response);
			break;

		}

	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String accion = request.getParameter("accion");
		Producto bean = new Producto();
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr);

		bean.setId(Integer.parseInt(request.getParameter("id")));
		bean.setName(request.getParameter("name"));
		bean.setDescription(request.getParameter("description"));
		bean.setPoints(request.getParameter("points"));
		bean.setStock(Integer.parseInt(request.getParameter("stock")));
		bean.setType(request.getParameter("type"));
		bean.setBrand(request.getParameter("brand"));
		bean.setState(request.getParameter("state"));
		// Proceso
		try {
			switch (accion) {
			case ControllerUtil.CRUD_NUEVO:
				clienteService.insert(bean);
				break;
			case ControllerUtil.CRUD_EDITAR:
				clienteService.update(bean);
				break;
			case ControllerUtil.CRUD_ELIMINAR:
				clienteService.delete(id);
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + accion);
			}
			ControllerUtil.responseJson(response, "Proceso ok.");
		} catch (Exception e) {
			ControllerUtil.responseJson(response, e.getMessage());
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		// Proceso
		Producto model = new Producto();
		model.setName(name);
		model.setType(type);
		List<Producto> lista = clienteService.get(model);
		// Convertir lista en JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}
}