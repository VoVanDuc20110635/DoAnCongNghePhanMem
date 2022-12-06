package MVC.Controllers.Admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import MVC.Models.CategoryModel;
import MVC.Services.ICategoryServices;
import MVC.Services.Impl.CategoryServicesImpl;
import MVC.Utils.Constant;

@WebServlet(urlPatterns = { "/admin/category/add" })

public class CategoryAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ICategoryServices categoryService = new CategoryServicesImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryModel category = new CategoryModel();
		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html");
			resp.setCharacterEncoding("utf-8");
			category.setCategoryName(req.getParameter("categoryName"));
			category.setStatus(Integer.parseInt(req.getParameter("status")));
			categoryService.insert(category);
			resp.sendRedirect(req.getContextPath() + "/admin/category/list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}

}
