package pe.edu.vallegrande.producto.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.vallegrande.producto.db.AccesoDB;
import pe.edu.vallegrande.producto.model.Producto;
import pe.edu.vallegrande.producto.service.spec.CrudServiceSpec;

public class CrudProductoService implements CrudServiceSpec<Producto> {
	// LISTAR LOS CLIENTES ACTIVOS
	@Override
	public List<Producto> getAll() {
		List<Producto> lista = new ArrayList<>();
		Connection cn = null;
		Producto rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "SELECT id, name, description, points, stock, type, brand FROM product WHERE state='A'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				rec.setDescription(rs.getString("description"));
				rec.setPoints(rs.getString("points"));
				rec.setStock(rs.getInt("stock"));
				rec.setType(rs.getString("type"));
				rec.setBrand(rs.getString("brand"));
				
				lista.add(rec);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

	@Override
	public Producto getById(Integer id) {
		// preparando los datos
		Connection cn = null;
		Producto bean = null;
		// proceso
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id, name, description, points, stock, type, brand from product ";
			sql += "where state = 'A' and id = ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new Producto();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setDescription(rs.getString("description"));
				bean.setPoints(rs.getString("points"));
				bean.setStock(rs.getInt("stock"));
				bean.setType(rs.getString("type"));
				bean.setBrand(rs.getString("brand"));
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return bean;
	}

	@Override
	public List<Producto> get(Producto bean) {
		// preparando los datos
		String name = bean.getName() != null ? "%" + bean.getName().trim() + "%" : "%%";
		String type = bean.getType() != null ? "%" + bean.getType().trim() + "%" : "%%";
		List<Producto> lista = new ArrayList<>();
		Connection cn = null;
		Producto rec = null;
		// proceso
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id, name, description, points, stock, type, brand from product ";
			sql += "where state = 'A' and name like ? and type like ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, type);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				rec.setDescription(rs.getString("description"));
				rec.setPoints(rs.getString("points"));
				rec.setStock(rs.getInt("stock"));
				rec.setType(rs.getString("type"));
				rec.setBrand(rs.getString("brand"));
				lista.add(rec);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

	@Override
	public Producto insert(Producto bean) {
		// Variables
		Integer id;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "INSERT INTO product(id, name, description, points, stock, type, brand)VALUES(?,?,?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getId() + "");
			pstm.setString(2, bean.getName());
			pstm.setString(3, bean.getDescription());
			pstm.setString(4, bean.getPoints());
			pstm.setInt(5, bean.getStock());
			pstm.setString(6, bean.getType());
			pstm.setString(7, bean.getBrand());
			pstm.executeUpdate();
			// obteniendo el id
			sql = "SELECT @@IDENTITY id";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			rs.next();
			id = rs.getInt("id");
			bean.setId(id);
			// Fin de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return bean;
	}

	@Override
	public Producto update(Producto bean) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm;
		String sql;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Actualizar registro
			sql = "UPDATE product SET name = ?, description = ?, points = ?, stock = ?, type = ?, brand = ? WHERE id = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getName());
			pstm.setString(2, bean.getDescription());
			pstm.setString(3, bean.getPoints());
			pstm.setInt(4, bean.getStock());
			pstm.setString(5, bean.getType());
			pstm.setString(6, bean.getBrand());
			pstm.setInt(7, bean.getId());
			int filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			// Fin de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte: Devolver el objeto actualizado
		return bean;
	}

	@Override
	public void delete(Integer id) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm;
		String sql;
		int filas;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "UPDATE product SET state = 'I' WHERE id =?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			// Fin de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

//listar inactivos
	@Override
	public List<Producto> getAllInactive() {
		List<Producto> lista = new ArrayList<>();
		Connection cn = null;
		Producto rec = null;
		try {
			cn = AccesoDB.getConnection();
			String sql = "SELECT id, name, description, points, stock, type, brand, state "
					+ "FROM product WHERE state='I'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setName(rs.getString("name"));
				rec.setDescription(rs.getString("description"));
				rec.setPoints(rs.getString("points"));
				rec.setStock(rs.getInt("stock"));
				rec.setType(rs.getString("type"));
				rec.setBrand(rs.getString("brand"));
				rec.setState(rs.getString("state"));
				lista.add(rec);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}

//activar cliente
	@Override
	public void activar(Integer id) {
		// Variables
		Connection cn = null;
		PreparedStatement pstm;
		String sql;
		int filas;
		// Proceso
		try {
			// Inicio de la TX
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			// Insertar registro
			sql = "UPDATE product SET state = 'A' WHERE id =?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			filas = pstm.executeUpdate();
			pstm.close();
			if (filas == 0) {
				throw new SQLException("ID no existe");
			}
			// Fin de la TX
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
			} catch (Exception e2) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	}

}
