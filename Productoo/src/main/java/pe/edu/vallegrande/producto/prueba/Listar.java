package pe.edu.vallegrande.producto.prueba;

import java.util.List;

import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.CrudProductoService;

public class Listar {
    public static void main(String[] args) {
        try {
            CrudProductoService service = new CrudProductoService();
            List<Producto> lista = service.getAll();
            System.out.println("Filas: " + lista.size());
            for (Producto rec : lista) {
                System.out.println(rec.getId() + "|" + rec.getName() + "|" + rec.getDescription() + "|"
                        + rec.getPoints() + "|" + rec.getStock() + "|" + rec.getType() + "|" + rec.getBrand());
            }
        } catch (Exception e) {
            System.err.println("Error al mostrar la lista de productos: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

