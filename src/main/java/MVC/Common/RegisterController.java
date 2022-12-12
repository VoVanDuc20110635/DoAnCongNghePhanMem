package MVC.Common;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MVC.Models.AccountModel;
import MVC.Services.IAccountServices;
import MVC.Services.Impl.AccountServicesImpl;

@WebServlet(urlPatterns = { "/common/register" })
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IAccountServices accountService = new AccountServicesImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			resp.setContentType("charset=UTF-8");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String confirmedPassword = req.getParameter("confirmedPassword");
			if (password.equals(confirmedPassword)) {
				accountService.registerAccount(username, confirmedPassword);
				String thongBao = "Đăng ký thành công";
				req.setAttribute("thongBao", thongBao);
				req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
//				resp.sendRedirect(req.getContextPath() + "/common/login");
			} else {
				String thongBao = "Đăng ký thất bại";
				req.setAttribute("thongBao", thongBao);
				req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
//				resp.sendRedirect(req.getContextPath() + "/common/register");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
//		AccountModel account = new AccountModel();
//		try {
//			req.setCharacterEncoding("utf-8");
//			resp.setContentType("text/html");
//			resp.setCharacterEncoding("utf-8");
//			// account.setAccountId(Integer.parseInt(req.getParameter("accountId")));
//			account.setUserName(req.getParameter("userName"));
//			account.setPassWord(req.getParameter("passWord"));
//			account.setEmail(req.getParameter("email"));
////			String ngayTao = req.getParameter("createdDate");
//			
//			//DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//
//			//Date today = new Date();
//
//			Date todayWithZeroTime = formatter.parse(formatter.format(today))
//					
//			//String ngayTao = LocalDateTime.now().toString();
//			Date ngayTao = new Date();
//			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//			Date date = new Date(formatter.parse(ngayTao).getTime());
//			account.setCreatedDate(date);
//			account.setRoleId(3);
//			account.setStatus(1);
//			accountService.insert(account);
//			resp.sendRedirect(req.getContextPath() + "/admin/account/list");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
