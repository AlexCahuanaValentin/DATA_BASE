package pe.edu.vallegrande.producto.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pe.edu.vallegrande.producto.model.Usuario;

import com.microsoft.aad.msal4j.HttpResponse;

@WebServlet(name = "SvUsuario", urlPatterns = { "/SvUsuario" })
public class SvUsuario {
	protected void processRequest(HttpServletRequest request, HttpResponse response)
			throws ServletException, IOException {

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		List<Usuario> listaUsuarios = new ArrayList<>();
		listaUsuarios.add(new Usuario("celular","es de color","1500"));
		
		
		HttpSession misesion = request.getSession();
		misesion.setAttribute("listaUsuarios", listaUsuarios);
		
		response.sendRedirect("mostrarUsuarios.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String nombre = request.getParameter("nombre");
		String descrip = request.getParameter("descrip");
		String puntos = request.getParameter("puntos");
		
		System.out.println("nombre es:" + nombre);
		System.out.println("nombre es:" + descrip);
		System.out.println("nombre es:" + puntos);
	}
	
	public String getServletInfo() {
		return "Short description";
	}
	
	
}
