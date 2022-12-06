package MVC.Services;

import MVC.Models.AccountModel;

public interface IAccountServices {
	boolean authenticateAccount(String username, String password);
	String findRoleAccount(String username, String password);
	void registerAccount(String username, String password);
	int findAdminId(String username);
	int findAccountId(String username);
}
