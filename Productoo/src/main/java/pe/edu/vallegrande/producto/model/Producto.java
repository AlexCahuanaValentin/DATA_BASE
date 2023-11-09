package pe.edu.vallegrande.producto.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Producto {
	private Integer id;
	private String name;
	private String description;
	private String points;
	private Integer stock;
	private String type;
	private String brand;
	private String state;
}