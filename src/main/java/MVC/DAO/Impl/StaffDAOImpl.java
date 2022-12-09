package MVC.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import MVC.DAO.IStaffDAO;
import MVC.DBConnection.SqlConnect.DBConnection;
import MVC.Models.StaffModel;



public class StaffDAOImpl extends DBConnection implements IStaffDAO  {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	

	@Override
	public List<StaffModel> findAll() {
		List<StaffModel> staffs = new ArrayList<StaffModel>();
		String sql = "Select * From NhanVien";
		
		//cột nào là số thì mặc định là 0
		//cột nào là String hoặc Date thì mặc định là null
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				StaffModel staff = new StaffModel();
				staff.setStaffID(rs.getInt(1));
				staff.setStaffName(rs.getString(2));				
				staff.setDOB(rs.getDate(3));
				staff.setSex(rs.getString(4));
				staff.setStaffPhone(rs.getString(5));
				staff.setSalaryID(rs.getString(6));
				staff.setAccountID(rs.getInt(7));
				staffs.add(staff);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return staffs;
	}
	
	

	@Override
	public StaffModel findById (int MaNV) {
		StaffModel staff = new StaffModel();
		String sql = "select * from NhanVien where MaNV = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, MaNV);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				staff.setStaffID(rs.getInt(1));
				staff.setStaffName(rs.getString(2));
				staff.setDOB(rs.getDate(3));
				staff.setSex(rs.getString(4));
				staff.setStaffPhone(rs.getString(5));
				staff.setSalaryID(rs.getString(6));
				staff.setAccountID(rs.getInt(7));
				staff.setStatus(rs.getInt(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staff;
	}


	@Override
	public void insert(StaffModel staff) {
		String sql = "INSERT INTO NhanVien(HoTen,NgaySinh,GioiTinh,SDT,MaLuong, MaTK, TinhTrang) VALUES (?,?,?,?,?,?,?)";
		try {
			Connection con = super.getConnection();// kết nối datavase
			PreparedStatement ps = con.prepareStatement(sql);// ném câu sql vào cho phát biểu prepared
			// gán tham số
			ps.setString(1, staff.getStaffName());
			ps.setDate(2, staff.getDOB());
			ps.setString(3, staff.getSex());
			ps.setString(4, staff.getStaffPhone());
			ps.setString(5, staff.getSalaryID());
			ps.setInt(6, staff.getAccountID());
			ps.setInt(7, staff.getStatus());
			// thực thi sql
			ps.execute();// dùng để update insert delete, còn dùng select thì executeNonQuery
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}


	@Override
	public void edit(StaffModel staff) {
		
		String sql = "UPDATE NhanVien set HoTen =?,NgaySinh=?,GioiTinh=?,SDT=?,MaLuong=?, MaTK=?, TinhTrang=? where MaNV = ?";
		try {
			Connection con = super.getConnection();// kết nối datavase
			PreparedStatement ps = con.prepareStatement(sql);// ném câu sql vào cho phát biểu prepared
			// gán tham số
			ps.setString(1, staff.getStaffName());
			ps.setDate(2, staff.getDOB());
			ps.setString(3, staff.getSex());
			ps.setString(4, staff.getStaffPhone());
			ps.setString(5, staff.getSalaryID());
			ps.setInt(6, staff.getAccountID());
			ps.setInt(7, staff.getStatus());
			ps.setInt(8, staff.getStaffID());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void delete(int id) {
		String sql = "update NhanVien set TinhTrang = 0 where MaNV = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	@Override
	public int countAll() {
		String sql = "select count(*) from NhanVien";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<StaffModel> pagingStaff(int index){
		List<StaffModel> staffs = new ArrayList<StaffModel>();
		String sql = "select * from NhanVien order by MaNV OFFSET ? ROW fetch next 3 rows only";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, index);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				StaffModel staff = new StaffModel();
				staff.setStaffID(rs.getInt(1));
				staff.setStaffName(rs.getString(2));				
				staff.setDOB(rs.getDate(3));
				staff.setSex(rs.getString(4));
				staff.setStaffPhone(rs.getString(5));
				staff.setSalaryID(rs.getString(6));
				staff.setAccountID(rs.getInt(7));
				staffs.add(staff);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return staffs;
	}
	
}
