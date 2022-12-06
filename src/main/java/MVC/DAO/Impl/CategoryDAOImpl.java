package MVC.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import MVC.DAO.ICategoryDAO;
import MVC.DBConnection.SqlConnect.DBConnection;
import MVC.Models.CategoryModel;

public class CategoryDAOImpl extends DBConnection implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		// TODO Auto-generated method stub

		List<CategoryModel> categories = new ArrayList<CategoryModel>();
		String sql = "Select * from DanhMuc";
		try {
			Connection conn = super.getConnection();// goi ket noi sql
			PreparedStatement ps = conn.prepareStatement(sql);// nem sql vao cho phat bieu preparedStatement

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));
				category.setStatus(rs.getInt(3));
				categories.add(category);
			}
		} catch (Exception e) {

		}
		return categories;
	}

	@Override
	public CategoryModel get(int cateId) {
		String sql = "SELECT * FROM DanhMuc WHERE MaDanhMuc = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cateId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));
				category.setStatus(rs.getInt(3));
				return category;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(CategoryModel category) {
		String sql = "INSERT INTO DanhMuc(TenDanhMuc, TinhTrang) VALUES (?,1)";
		try {
			Connection con = super.getConnection();// kết nối datavase
			PreparedStatement ps = con.prepareStatement(sql);// ném câu sql vào cho phát biểu prepared
			// gán tham số
			ps.setString(1, category.getCategoryName());
			// thực thi sql
			ps.execute();// dùng để update insert delete, còn dùng select thì executeNonQuery
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void edit(CategoryModel category) {
		String sql = "Update DanhMuc set TenDanhMuc = ?, TinhTrang=? where MaDanhMuc=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getCategoryName());
			ps.setInt(2, category.getStatus());
			ps.setInt(3, category.getCategoryID());
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		String sql = "Delete from DanhMuc where MaDanhMuc=?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public static void main(String args[]) {
		CategoryDAOImpl dao = new CategoryDAOImpl();
		CategoryModel m = new CategoryModel();
		System.out.println(m);
	}

	@Override
	public CategoryModel findByID(int id) {
		String sql = "Select * From DanhMuc where MaDanhMuc=?";
		try {
			Connection conn = new DBConnection().getConnection(); // kết nối CSDL
			PreparedStatement ps = conn.prepareStatement(sql); // ném câu lệnh sql bằng phát biểu preparestatement
			ps.setInt(1, id); // đưa tham vào dấu ?
			ResultSet rs = ps.executeQuery(); // thực thi câu query và trả về Resultset
			while (rs.next()) { // duyệt từng dòng trong ResultSet trả về danh sách đối tượng
				CategoryModel category = new CategoryModel();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));
				category.setStatus(rs.getInt(3));
				return category;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<CategoryModel> findAllByCategoryID(String id) {
		String sql = "select * from DanhMuc where MaDanhMuc = ?";
		List<CategoryModel> categories = new ArrayList<CategoryModel>();
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);;
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModel category = new CategoryModel();
				category.setCategoryID(rs.getInt(1));
				category.setCategoryName(rs.getString(2));
				category.setStatus(rs.getInt(3));
				categories.add(category);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return categories;
	}


	
	
	
}
