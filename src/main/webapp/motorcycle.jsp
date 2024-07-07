<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.showroom.connection.Dbcon"%>
<%@ page import="com.showroom.dao.ProductDao"%>
<%@ page import="com.showroom.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
 ProductDao pd = new ProductDao(Dbcon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list !=null)
{
	request.setAttribute("cart_list",cart_list);
}

%>
<!DOCTYPE html>
<html>
<head>
<title>Royal Enfield</title>
<%@ include file="includes/head.jsp"%>

	<%@ include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3"> Available Bikes </div>
		<div class="row"> 
		<%
			if(!products.isEmpty())
			{
				for(Product p:products)
				{ 
				%>
				<div class="col-md-6 my-3">
				<div class="card w-750">
					<img class="card-img-top" src="project-images/royal/<%= p.getImage() %>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%= p.getBike() %></h5>
						<h6 class="card-title">Color: <%= p.getColors() %></h6>
						<h6 class="card-title">Price: <%= p.getPrice() %></h6>
						<div class="mt-1 d-flex justify-content-between">
						<a href="bike<%=p.id%>.jsp" class="btn btn-outline-primary btn-lg">Explore</a>
						<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-outline-primary btn-lg">Book a Test Ride</a>
						</div>
					</div>
				</div>
			</div>
	 			<% 
				}
			}
		%>
		</div>
	</div>

	<%@ include file="includes/footer.jsp"%>
</body>
</html>