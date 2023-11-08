package pe.edu.vallegrande.producto.service;

public class UtilService {
	
	private UtilService() {
	}

	public static String setStringVacio(String dato) {
		if(dato == null) {
			dato = "";
		}
		dato = dato.trim(); // Para pensarlo
		return dato;
	}
	
}