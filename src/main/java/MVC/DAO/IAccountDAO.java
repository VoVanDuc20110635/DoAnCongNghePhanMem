package MVC.DAO;

import java.util.List;

import MVC.Models.AccountModel;

public interface IAccountDAO {
	boolean authenticateAccount(String username, String password);
	boolean checkDuplicateUsername(String username);
	String findRoleAccount(String username, String password);
	void registerAccount(String username, String password, String email);
	int findAdminId(String username);
	int findAccountId(String username);
	AccountModel findByUserNameAndEmail(String username, String email);
	void delete(int MaTK);
	void edit(AccountModel account);
	void insert(AccountModel account);
	List<AccountModel> findAll();
	AccountModel findById(int accountId);
	List<AccountModel> pagingAccount(int index);
	int countAll();
	int countByAccountNameSearch(String txtSearch);
	List<AccountModel> searchByAccountName(String txtSearch, int index, int pageSize);
}	
