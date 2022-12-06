package MVC.Services;

import java.util.List;

import MVC.Models.ProductModel;

public interface IProductWebServices {
	List<ProductModel> getTop4Product();
	List<ProductModel> selectAll();
	List<ProductModel> getAllByCateID(String id);
	//List<ProductModel> findAllPage(int index);
	ProductModel topProduct();
	ProductModel getProductByID(String id);
	ProductModel findByID(int id);
	int countAll();
	int countByCategoryID(int id);
	List<ProductModel> searchByProductName(String txt);
	List<ProductModel> pagingProduct(int index);
	List<ProductModel> pagingProductByCateID(int id, int index);
	List<ProductModel> select3LastProduct();
}
