<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page
	import="com.purchaseapplication.service.PurchaseApplicationServiceImpl"%>
<%@page
	import="com.purchaseapplication.service.IPurchaseapplicationService"%>
<%@page import="com.purchaseappication.model.PurchaseApplication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}
</style>
<title>Purchase Application</title>
</head>
<body>
	<%
	
		PurchaseApplication purchaseApplicationObject = new PurchaseApplication();
		IPurchaseapplicationService purchaseapplicationServiceObject = new PurchaseApplicationServiceImpl();

		
		String productName = request.getParameter("pname");
		String productType = request.getParameter("ptype");
		String productColor = request.getParameter("pcolor");
		String productPrice = request.getParameter("pprice");
		String itemsInStock = request.getParameter("itemsinstock");
		String productImage = request.getParameter("pimage");

		purchaseApplicationObject.setProductName(productName);
		purchaseApplicationObject.setProductType(productType);
		purchaseApplicationObject.setProductColor(productColor);
		purchaseApplicationObject.setProductPrice(productPrice);
		purchaseApplicationObject.setItemInStock(itemsInStock);
		purchaseApplicationObject.setProductImage(productImage);

		boolean status = purchaseapplicationServiceObject
				.getAddProduct(purchaseApplicationObject);
		if (status) {
			
		/* 	if (!ServletFileUpload.isMultipartContent(request)) {
				out.println("<h2>Nothing to upload</h2>");
				return;
			}
			
			FileItemFactory itemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(itemFactory);
			try {
				
				List<FileItem> items = upload.parseRequest(request);
				for (FileItem item : items) {
					String contentType = item.getContentType();
					if (!contentType.equals("image/JPG")) {
						out.println("<h4>only JPEG format file support");
						continue;
					}
				
					File uploadDir = new File("F:\\uploadfiles");
					File file = File.createTempFile("img", ".JPG", uploadDir);
					item.write(file);
				}
			} catch (FileUploadException e) {
				out.println("<h4>upload fail</h4>");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/

			out.println("<h3>List of Products:</h3>");
			List<PurchaseApplication> list = purchaseapplicationServiceObject
					.getList(); 

			Iterator<PurchaseApplication> iterator = list.iterator();
	%>
	<h2>ADDED SUCCESSFULLY</h2>
	<table style="width: 100%">
		<tr>

			<th>PRODUCT NAME</th>
			<th>PRODUCT TYPE</th>
			<th>PRODUCT COLOR</th>
			<th>PRODUCT PRICE</th>
			<th>ITEMS IN STOCK</th>
			<th>IMAGE NAME</th>
		</tr>


		<%
			while (iterator.hasNext()) {
					PurchaseApplication products = iterator.next();
		%>
		<tr>
			<td>
				<%
					out.println(products.getProductName());
				%>
			</td>
			<td>
				<%
					out.println(products.getProductType());
				%>
			</td>
			<td>
				<%
					out.println(products.getProductColor());
				%>
			</td>
			<td>
				<%
					out.println(products.getProductPrice());
				%>
			</td>
			<td>
				<%
					out.println(products.getItemInStock());
				%>
			</td>
			<td>
				<%
					out.println(products.getProductImage());
				%>
			</td>
		</tr>


		<%
			}
		%>
	</table>
	<%
		}
	%>
</body>
</html>