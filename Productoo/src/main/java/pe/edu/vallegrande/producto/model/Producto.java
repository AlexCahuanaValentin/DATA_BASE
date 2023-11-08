package pe.edu.vallegrande.producto.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Producto {
	private Integer id;
	private String nombre;
	private String descrip;
	private String puntos;
	private String estado;
}