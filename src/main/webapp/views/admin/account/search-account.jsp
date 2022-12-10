<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="container-xxl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<a href="<%=request.getContextPath()%>/admin/account/list"
								style="margin-right: 20px;"> <svg
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-arrow-return-left"
									viewBox="0 0 16 16">
									<path fill-rule="evenodd"
										d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z" /></svg>
							</a>
							<h2>
								Quản lý <b>Tài Khoản</b>
							</h2>
						</div>
					</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-2">
						<form class="form-inline"
							action="${pageContext.request.contextPath}/admin/account/search?action=account&index=1"
							method="post">
							<div class="input-group input-group-sm">
								<input type="text" value="${txtSearch}" name="txtSearch"
									class="form-control" placeholder="Search...">
								<div class="input-group-append">
									<button type="submit" class="btn btn-secondary btn-number">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Mã tài khoản</th>
						<th>Tên tài khoản</th>
						<th>Mật khẩu</th>
						<th>Email</th>
						<th>Ngày tạo</th>
						<th>Vai trò</th>
						<th>Trạng thái</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${accountList}" var="list">
						<tr>
							<td>${list.accountId}</td>
							<td>${list.userName}</td>
							<td>${list.passWord}</td>
							<td>${list.email}</td>
							<td>${list.createdDate}</td>
							<td>${list.roleId}</td>
							<td>${list.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">
					Showing <b>${index*3}</b> out of <b>${endPage*3}</b> entries
				</div>
				<ul class="pagination">
					<c:if test="${index > 1}">
						<li class="page-item disabled"><a
							href="${pageContext.request.contextPath}/admin/account/search?action=account&index=${index-1}&txtSearch=${txtSearch}">Previous</a></li>
					</c:if>
					<c:forEach begin="1" end="${endPage}" var="i">
						<li class="page-item ${index ==i ?"active" : "" }"><a
							href="${pageContext.request.contextPath}/admin/account/search?action=account&index=${i}&txtSearch=${txtSearch}"
							class="page-link">${i}</a></li>
					</c:forEach>
					<c:if test="${index < endPage }">
						<li class="page-item"><a
							href="${pageContext.request.contextPath}/admin/account/search?action=account&index=${index+1}&txtSearch=${txtSearch}"
							class="page-link">Next</a></li>
					</c:if>
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
