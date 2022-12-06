package MVC.Common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MVC.Services.IAccountServices;
import MVC.Services.Impl.AccountServicesImpl;
import MVC.Utils.Constant;

@WebServlet(urlPatterns = { "/common/register" })
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IAccountServices accountService = new AccountServicesImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		resp.setContentType("charset=UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String confirmedPassword = req.getParameter("confirmedPassword");
		if (password.equals(confirmedPassword)) {
			accountService.registerAccount(username, confirmedPassword);
			resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
		} else {
			resp.sendRedirect(req.getContextPath() + "/views/register.jsp");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
