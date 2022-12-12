package MVC.DAO.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import MVC.DAO.IAccountDAO;
import MVC.DBConnection.SqlConnect.DBConnection;
import MVC.Models.AccountModel;

public class AccountDAOImpl extends DBConnection implements IAccountDAO {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public boolean authenticateAccount(String username, String password) {
		boolean isValid = false;
		try {
			String sql = "select * from TaiKhoan where TaiKhoan = ? and MatKhau = ?";
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next())
				isValid = true;
			else
				isValid = false;

		} catch (Exception e) {
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
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getString("TenVaiTro");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public void registerAccount(String username, String password, String email) {
		try {
			String sql = "Insert Into TaiKhoan(TaiKhoan,MatKhau,Email,NgayTao,MaVaiTro, TinhTrang) Values (?, ?, ?, Cast(GETDATE() as Date), 3, 1)";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.executeUpdate();
		} catch (Exception e) {
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
			while (rs.next()) {
				return rs.getInt("MaVaiTro");
			}
		} catch (Exception e) {
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
			while (rs.next()) {
				return rs.getInt("MaTK");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public static void main(String args[]) {
		IAccountDAO dao = new AccountDAOImpl();
		AccountModel ac = new AccountModel();
		boolean a = "123".equals("123");
		boolean t = dao.checkDuplicateUsername("tester");
		System.out.print(a);
		System.out.print(t);
		if(t&&a)
			System.out.print(t +"\n" + a);
		else
			System.out.print("CC");
	}

	@Override
	public AccountModel findByUserNameAndEmail(String username, String email) {
		AccountModel account = new AccountModel();
		try {
			String sql = "select * from TaiKhoan where TenTaiKhoan = ? and Email=?";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.executeQuery();
			while (rs.next()) {
				account.setAccountId(rs.getInt(1));
				account.setUserName(rs.getString(2));
				account.setPassWord(rs.getString(3));
				account.setEmail(rs.getString(4));
				account.setCreatedDate(rs.getDate(5));
				account.setRoleId(rs.getInt(6));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;

	}

	@Override
	public void insert(AccountModel account) {
		String sql = "INSERT INTO TaiKhoan(TaiKhoan,MatKhau,Email,NgayTao, MaVaiTro,TinhTrang) VALUES (?,?,?,?,?,?)";
		try {
			System.out.print("hehe");
			Connection con = super.getConnection();// kết nối datavase
			PreparedStatement ps = con.prepareStatement(sql);// ném câu sql vào cho phát biểu prepared
			// gán tham số
			// ps.setInt(1, account.getAccountId());
			ps.setString(1, account.getUserName());
			ps.setString(2, account.getPassWord());
			ps.setString(3, account.getEmail());
			ps.setDate(4, account.getCreatedDate());
			ps.setInt(5, account.getRoleId());
			ps.setInt(6, account.getStatus());
			// thực thi sql
			ps.execute();// dùng để update insert delete, còn dùng select thì executeNonQuery
			System.out.print("hehe");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void edit(AccountModel account) {

		String sql = "UPDATE TaiKhoan set TaiKhoan=?,MatKhau=?,Email=?,NgayTao=?, MaVaiTro=?,TinhTrang=? where MaTK = ?";
		try {
			Connection con = super.getConnection();// kết nối datavase
			PreparedStatement ps = con.prepareStatement(sql);// ném câu sql vào cho phát biểu prepared
			// gán tham số
			// ps.setInt(1, account.getAccountId());
			ps.setString(1, account.getUserName());
			ps.setString(2, account.getPassWord());
			ps.setString(3, account.getEmail());
			ps.setDate(4, account.getCreatedDate());
			ps.setInt(5, account.getRoleId());
			ps.setInt(6, account.getStatus());
			ps.setInt(7, account.getAccountId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int MaTK) {
		String sql = "update TaiKhoan set TinhTrang = 0 where MaTK = ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, MaTK);
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@Override
	public AccountModel findById(int accountId) {
		AccountModel account = new AccountModel();
		try {
			String sql = "Select * From TaiKhoan Where MaTK = ?";
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, accountId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				account.setAccountId(rs.getInt(1));
				account.setUserName(rs.getString(2));
				account.setPassWord(rs.getString(3));
				account.setEmail(rs.getString(4));
				account.setCreatedDate(rs.getDate(5));
				account.setRoleId(rs.getInt(6));
				account.setStatus(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return account;
	}

	@Override
	public List<AccountModel> findAll() {
		List<AccountModel> accounts = new ArrayList<AccountModel>();
		String sql = "Select * From TaiKhoan";

		// cột nào là số thì mặc định là 0
		// cột nào là String hoặc Date thì mặc định là null
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountModel account = new AccountModel();
				account.setAccountId(rs.getInt(1));
				account.setUserName(rs.getString(2));
				account.setPassWord(rs.getString(3));
				account.setEmail(rs.getString(4));
				account.setCreatedDate(rs.getDate(5));
				account.setRoleId(rs.getInt(6));
				account.setStatus(rs.getInt(7));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accounts;
	}

	@Override
	public int countAll() {
		String sql = "select count(*) from TaiKhoan";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<AccountModel> pagingAccount(int index){
		List<AccountModel> accountList = new ArrayList<AccountModel>();
		String sql = "select * from TaiKhoan order by MaTK OFFSET ? ROW fetch next 3 rows only";
		try {
			Connection conn = new DBConnection().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, (index - 1) * 3);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountModel account = new AccountModel();
				account.setAccountId(rs.getInt(1));
				account.setUserName(rs.getString(2));
				account.setPassWord(rs.getString(3));
				account.setEmail(rs.getString(4));
				account.setCreatedDate(rs.getDate(5));
				account.setRoleId(rs.getInt(6));
				account.setStatus(rs.getInt(7));
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accountList;
	}
	
	@Override
	public List<AccountModel> searchByAccountName(String txtSearch, int index, int pageSize){
		String sql = "with temp as (select ROW_NUMBER() over (order by MaTK desc) as r, * from TaiKhoan where TaiKhoan like ?)\r\n"
				+ "select * from temp where r between ?*?-2 and ?*?";
		List<AccountModel> accounts = new ArrayList<AccountModel>();
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + txtSearch + "%");
			ps.setInt(2, index);
			ps.setInt(3, pageSize);
			ps.setInt(4, index);
			ps.setInt(5, pageSize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AccountModel account = new AccountModel();
				account.setAccountId(rs.getInt(2));
				account.setUserName(rs.getString(3));
				account.setPassWord(rs.getString(4));
				account.setEmail(rs.getString(5));;
				account.setCreatedDate(rs.getDate(6));
				account.setRoleId(rs.getInt(7));
				account.setStatus(rs.getInt(8));	
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accounts;
	}
	
	
	@Override
	public int countByAccountNameSearch(String txtSearch) {
		String sql = "select count(*) from TaiKhoan where TaiKhoan like ?";
		try {
			Connection conn = super.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + txtSearch + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean checkDuplicateUsername(String username) {
		boolean isValid = false;
		try {
			String sql = "select * from TaiKhoan where TaiKhoan = ?";
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next())
				isValid = true;
			else
				isValid = false;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isValid;
	}
	
}