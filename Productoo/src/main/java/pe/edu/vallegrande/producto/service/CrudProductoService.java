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
			String sql = "SELECT id, nombre, descrip, puntos FROM PRODUC WHERE estado='A'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setNombre(rs.getString("nombre"));
				rec.setDescrip(rs.getString("descrip"));
				rec.setPuntos(rs.getString("puntos"));
				
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
			String sql = "select id, nombre, descrip, puntos from PRODUC ";
			sql += "where estado = 'A' and id = ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new Producto();
				bean.setId(rs.getInt("id"));
				bean.setNombre(rs.getString("nombre"));
				bean.setDescrip(rs.getString("descrip"));
				bean.setPuntos(rs.getString("puntos"));
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
		String nombre = bean.getNombre() != null ? "%" + bean.getNombre().trim() + "%" : "%%";
		String descrip = bean.getDescrip() != null ? "%" + bean.getDescrip().trim() + "%" : "%%";
		List<Producto> lista = new ArrayList<>();
		Connection cn = null;
		Producto rec = null;
		// proceso
		try {
			cn = AccesoDB.getConnection();
			String sql = "select id, nombre, descrip, puntos from PRODUC ";
			sql += "where estado = 'A' and nombre like ? and descrip like ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setString(1, nombre);
			pstm.setString(2, descrip);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setNombre(rs.getString("nombre"));
				rec.setDescrip(rs.getString("descrip"));
				rec.setPuntos(rs.getString("puntos"));
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
			sql = "INSERT INTO PRODUC(id, nombre, descrip, puntos)VALUES(?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getId() + "");
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getDescrip());
			pstm.setString(4, bean.getPuntos());
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
			sql = "UPDATE PRODUC SET nombre = ?, descrip = ?, puntos = ? WHERE id = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDescrip());
			pstm.setString(3, bean.getPuntos());
			pstm.setInt(4, bean.getId());
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
			sql = "UPDATE PRODUC SET estado = 'I' WHERE id =?";
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
			String sql = "SELECT id, nombre, descrip, puntos, estado "
					+ "FROM PRODUC WHERE estado='I'";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				rec = new Producto();
				rec.setId(rs.getInt("id"));
				rec.setNombre(rs.getString("nombre"));
				rec.setDescrip(rs.getString("descrip"));
				rec.setPuntos(rs.getString("puntos"));
				rec.setEstado(rs.getString("estado"));
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
			sql = "UPDATE PRODUC SET estado = 'A' WHERE id =?";
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
