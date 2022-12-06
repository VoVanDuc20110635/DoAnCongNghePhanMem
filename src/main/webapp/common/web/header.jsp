<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home">Filtro</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
       	<c:forEach items="${listCate}" var="list">
          <a class="dropdown-item ${tagActive==list.categoryID ? "active" : ""}" href="category?cateID=${list.categoryID}">${list.categoryName}</a>
         </c:forEach>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="category?cateID=0">Product</a>
      </li>
      <li class="nav-item">
        <a class="nav-link inactive" href="views/cart.jsp">Cart</a>
      </li>
    </ul>
      
    <form action="search" class="form-inline my-2 my-lg-0">
        <a class="nav-link inactive" href="login">Cart</a>
      <input class="form-control mr-sm-2" type="text" name="txt" placeholder="Search..." aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
      	<i class="fa fa-shopping-cart"></i> Cart
      	<span class="badge bagde-light">3</span>
      </a>
      
      <%
     	String rootPath = request.getContextPath();
      	String username = (String)session.getAttribute("username");      
  		String userRole = (String)session.getAttribute("userRole");
      	String registerPageURL = rootPath + "/views/register.jsp";
      	String emptyRole="";
      	if(username!=null){
      		String logoutPageURL = rootPath+"/common/logout";
      		out.print("<p class='text-white m-2'>Hello " + username + "</p>");
    		out.print("<a href='"+ logoutPageURL + "' class='btn btn-light m-2'>Logout</a>");
      	}else{
      		String loginPageURL = rootPath + "/common/login";
    		out.print("<a href='"+ loginPageURL + "' class='btn btn-light m-2'>Login</a>");
      	}
      	out.print("<a href='"+ registerPageURL + "' class='btn btn-light m-2'>Register</a>");
      %>
      <c:if test="${ userRole != emptyRole }">
      	<c:if test="${ userRole.equalsIgnoreCase('admin')}">
                <a class="btn btn-success btn-sm ml-3" href="<%=request.getContextPath() %>/admin/category/list">
                    	Order management 1                 
                </a>
                <a class="btn btn-success btn-sm ml-3" href="<%=request.getContextPath() %>/admin/product/list">
                    	Order management 2                 
                </a>
         </c:if>
      
      </c:if>
      
    </form>
  </div>
</nav>