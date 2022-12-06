<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url value="/template/admin/" var="URL" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${URL}css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	$('table .delete').on('click', function(){
		var id = $(this).parent().find("#id").val();
		$('#deleteEmployeeModal #id').val(id);
	});
	
	$('table .edit').on('click', function(){
		var id = $(this).parent().find("#id").val();
		$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/admin/category/list',
			data:{action:'find', id:id},
			dataType:'json',
			contentType:'application/json',
			success: function(result){
				$('#editEmployeeModal #id').val(result.categoryID);
				$('#editEmployeeModal #categoryName').val(result.categoryName);
				$('#editEmployeeModal #status').val(result.status);
			}
		});
	});
});
</script>
</head>
<body>
<!-- === HEADER === -->
<%@ include file="/common/admin/header.jsp"%>

<!-- body -->
<dec:body />
<!-- body -->

<!--=== Footer v4 ===-->
<jsp:include page="/common/admin/footer.jsp"></jsp:include>
<!--=== End Footer v4 ===-->

</body>

</html>