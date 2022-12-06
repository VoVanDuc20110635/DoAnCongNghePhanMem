<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="container-xxl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Quản lý <b>Sản phẩm</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addProductModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm sản phẩm</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Tên sản phẩm</th>
						<th>Số lượng</th>
						<th>Giá tiền</th>
						<th>Mô tả</th>
						<th>Ảnh</th>
						<th>Tình trạng</th>
						<th>Mã danh mục</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${productList}" var="list">
					<tr>
						<td>${list.productID}</td>
						<td>${list.productName}</td>
						<td>${list.productAmount}</td>
						<td>${list.productPrice}</td>
						<td>${list.productDescription}</td>
						<td>${list.productImage}</td>
						<td>${list.productStatus}</td>
						<td>${list.categoryID}</td>
						<td>
							<a href="#editProductModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteProductModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							<input type="hidden" name="id" id="id" value="${list.productID}">
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">Showing <b>${index*3}</b> out of <b>${endPage*3}</b> entries</div>
				<ul class="pagination">
				<c:forEach begin="1" end="${endPage}" var="i">
					<li class="page-item"><a href="${pageContext.request.contextPath}/admin/product/list?index=${i}" class="page-link">${i}</a></li>	
				</c:forEach>
					<!---<c:if test="${index >1}">
								<li class="page-item disabled"><a class="page-link"
									href="category?cateID=${tagActive}&index=${tag-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="1" end="${endPage}" var="i">
								<li class="page-item"><a class="page-link ${tag==i ? "
									active" : "" }" href="category?cateID=${tagActive}&index=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${tag < endPage }">
								<li class="page-item"><a class="page-link"
									href="category?cateID=${tagActive}&index=${tag + 1 }">Next</a></li>
							</c:if> -->
				</ul>
			</div>
		</div>
	</div>        
</div>
<!-- Add Modal HTML -->
<div id="addProductModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/admin/product/list?action=create" method="post">
				<div class="modal-header">						
					<h4 class="modal-title">Thêm sản phẩm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Tên sản phẩm</label>
						<input type="text" name="productName" id="productName" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Số lượng</label>
						<input type="text" name="productAmount" id="productAmount" class="form-control" required>
					</div>		
					<div class="form-group">
						<label>Giá tiền</label>
						<input type="text" name="productPrice" id="productPrice" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Mô tả</label>
						<input type="text" name="productDescription" id="productDescription" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Ảnh</label>
						<input type="text" name="productImage" id="productImage" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Tình trạng</label>
						<input type="text" name="productStatus" id="productStatus" class="form-control" required>
					</div>	
					<div class="form-group">
						<label>Mã danh mục</label>
						<input type="text" name="categoryID" id="categoryID" class="form-control" required>
					</div>			
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editProductModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/admin/product/list?action=update" method="post">
				<div class="modal-header">						
					<h4 class="modal-title">Sửa sản phẩm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">									
					<div class="form-group">
						<label>Tên sản phẩm</label>
						<input type="text" name="productName" id="productName" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Số lượng</label>
						<input type="text" name="productAmount" id="productAmount" class="form-control" required>
					</div>		
					<div class="form-group">
						<label>Giá tiền</label>
						<input type="text" name="productPrice" id="productPrice" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Mô tả</label>
						<input type="text" name="productDescription" id="productDescription" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Ảnh</label>
						<input type="text" name="productImage" id="productImage" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Tình trạng</label>
						<input type="text" name="productStatus" id="productStatus" class="form-control" required>
					</div>	
					<div class="form-group">
						<label>Mã danh mục</label>
						<input type="text" name="categoryID" id="categoryID" class="form-control" required>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
					<input type="hidden" name="id" id="id">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteProductModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="${pageContext.request.contextPath}/admin/product/list?action=delete" method="post">
				<div class="modal-header">						
					<h4 class="modal-title">Xóa sản phẩm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
					<input type="hidden" name="id" id="id">
				</div>
			</form>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	$('table .delete').on('click', function(){
		var id = $(this).parent().find("#id").val();
		$('#deleteProductModal #id').val(id);
	});
	
	$('table .edit').on('click', function(){
		var id = $(this).parent().find("#id").val();
		alert(id)
		$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/admin/product/list',
			data:{action:'find', id:id},
			dataType:'json',
			contentType:'application/json',
			success: function(result){
				$('#editProductModal #id').val(result.productID);
				$('#editProductModal #productName').val(result.productName);
				$('#editProductModal #productAmount').val(result.productAmount);
				$('#editProductModal #productPrice').val(result.productPrice);
				$('#editProductModal #productDescription').val(result.productDescription);
				$('#editProductModal #productImage').val(result.productImage);
				$('#editProductModal #productStatus').val(result.productStatus);
				$('#editProductModal #categoryID').val(result.categoryID);
			}
		});
	});
});
</script>
