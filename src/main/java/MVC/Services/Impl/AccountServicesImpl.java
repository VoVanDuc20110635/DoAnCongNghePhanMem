package MVC.Services.Impl;

import java.util.List;

import MVC.DAO.IAccountDAO;
import MVC.DAO.Impl.AccountDAOImpl;
import MVC.Models.AccountModel;
import MVC.Services.IAccountServices;

public class AccountServicesImpl implements IAccountServices {

	IAccountDAO accountDAO = new AccountDAOImpl();

	@Override
	public boolean authenticateAccount(String username, String password) {
		// TODO Auto-generated method stub
		return accountDAO.authenticateAccount(username, password);
	}

	@Override
	public String findRoleAccount(String username, String password) {
		// TODO Auto-generated method stub
		return accountDAO.findRoleAccount(username, password);
	}

	@Override
	public void registerAccount(String username, String password, String email) {
		accountDAO.registerAccount(username, password, email);
		
	}


	@Override
	public int findAdminId(String username) {
		// TODO Auto-generated method stub
		return accountDAO.findAdminId(username);
	}

	@Override
	public int findAccountId(String username) {
		// TODO Auto-generated method stub
		return accountDAO.findAccountId(username);
	}

	@Override
	public void delete(int MaTK) {
		accountDAO.delete(MaTK);
		
	}

	@Override
	public void edit(AccountModel account) {
		accountDAO.edit(account);
		
	}

	@Override
	public void insert(AccountModel account) {
		accountDAO.insert(account);
		
	}

	@Override
	public List<AccountModel> findAll() {
		// TODO Auto-generated method stub
		return accountDAO.findAll();
	}

	@Override
	public AccountModel findById(int accountId) {
		// TODO Auto-generated method stub
		return accountDAO.findById(accountId);
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return accountDAO.countAll();
	}

	@Override
	public List<AccountModel> pagingAccount(int index) {
		// TODO Auto-generated method stub
		return accountDAO.pagingAccount(index);
	}

	@Override
	public int countByAccountNameSearch(String txtSearch) {
		// TODO Auto-generated method stub
		return accountDAO.countByAccountNameSearch(txtSearch);
	}

	@Override
	public List<AccountModel> searchByAccountName(String txtSearch, int index, int pageSize) {
		// TODO Auto-generated method stub
		return accountDAO.searchByAccountName(txtSearch, index, pageSize);
	}

	@Override
	public boolean checkDuplicateUsername(String username) {
		// TODO Auto-generated method stub
		return accountDAO.checkDuplicateUsername(username);
	}
}