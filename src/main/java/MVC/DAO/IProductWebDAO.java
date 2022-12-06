package MVC.DAO;

import java.util.List;

import MVC.Models.ProductModel;

public interface IProductWebDAO {
	List<ProductModel> selectAll();
	List<ProductModel> getTop4Product();
	ProductModel topProduct();
	List<ProductModel> getAllByCateID(String cateID);
	ProductModel getProductByID(String id);
	ProductModel findByID(int id);
	//List<ProductModel> findAllPage(int index);
	int countAll();
	int countByCategoryID(int id);
	List<ProductModel>searchByProductName(String txt);
	List<ProductModel> pagingProduct(int index);
	List<ProductModel> pagingProductByCateID(int id, int index);
	List<ProductModel> select3LastProduct();
}
