package MVC.DAO;

import java.util.List;

import MVC.Models.StaffModel;

public interface IStaffDAO {

	void delete(int id);

	void edit(StaffModel staff);

	void insert(StaffModel staff);

	StaffModel findById(int MaNV);

	List<StaffModel> findAll();

	List<StaffModel> pagingStaff(int index);

	int countAll();

}
