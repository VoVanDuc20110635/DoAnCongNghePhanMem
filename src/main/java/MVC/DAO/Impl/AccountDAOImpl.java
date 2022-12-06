package MVC.DAO.Impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import MVC.DAO.IAccountDAO;
import MVC.DBConnection.SqlConnect.DBConnection;
import MVC.Models.AccountModel;

public class AccountDAOImpl extends DBConnection implements IAccountDAO {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	@Override
	public boolean authenticateAccount(String username, String password) {
		boolean isValid=false;
		try {
			String sql = "select * from TaiKhoan where TaiKhoan = ? and MatKhau = ?";
			conn = super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next())
				isValid = true;
			else
				isValid = false;
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isValid;
	}
	@Override
	public String findRoleAccount(String username, String password) {
		try {
			String sql = "select vt.TenVaiTro from TaiKhoan tk inner join VaiTro vt \r\n"
					+ "on tk.MaVaiTro = vt.MaVaiTro where tk.TaiKhoan = ? and tk.MatKhau = ?";
			conn = super.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs=ps.executeQuery();
			while(rs.next()) {
				return rs.getString("TenVaiTro");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	@Override
	public void registerAccount(String username, String password) {
		try {
			String sql = "Insert Into TaiKhoan(TaiKhoan,MatKhau,MaVaiTro) Values (?,?,3)";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeUpdate();			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public int findAdminId(String username) {
		try {
			String sql = "Select MaVaiTro From TaiKhoan Where TaiKhoan = ?";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt("MaVaiTro");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int findAccountId(String username) {
		try {
			
			String sql = "Select MaTK From TaiKhoan Where TaiKhoan = ?";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt("MaTK");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	
	public static void main(String args[] ){
		IAccountDAO dao = new AccountDAOImpl();
		boolean t = dao.authenticateAccount("1", "123");
		System.out.print(t);
	}
	
}