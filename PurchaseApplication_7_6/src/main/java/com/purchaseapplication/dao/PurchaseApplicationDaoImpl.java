package com.purchaseapplication.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.purchaseappication.model.PurchaseApplication;

public class PurchaseApplicationDaoImpl implements IPuchaseApplicationDao {

	public Connection getConnection() throws Exception {
		System.out.println("Driver Uploading......");
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver Uploaded Successfully.");
		System.out.println("Establishing Connection......");
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3307/productdb", "root", "12345");
		System.out.println("Connection Established.");
		return connection;
	}

	public boolean getAddProduct(PurchaseApplication object) {
		boolean status = false;
		Connection connection;
		try {
			connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO PRODUCTSDETAIL values(?,?,?,?,?,?)");
			preparedStatement.setString(1, object.getProductName());
			preparedStatement.setString(2, object.getProductType());
			preparedStatement.setString(3, object.getProductColor());
			preparedStatement.setString(4, object.getProductPrice());
			preparedStatement.setString(5, object.getItemInStock());
			preparedStatement.setString(6, object.getProductImage());

			int numberOfRecords = preparedStatement.executeUpdate();
			if (numberOfRecords == 1) {
				status = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public List<PurchaseApplication> getList() {
		List<PurchaseApplication> list = new ArrayList<PurchaseApplication>();

		Connection connection;

		try {
			connection = getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM PRODUCTSDETAIL");
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				PurchaseApplication purchaseApplicationObject = new PurchaseApplication();
				purchaseApplicationObject
						.setProductName(resultSet.getString(1));
				purchaseApplicationObject
						.setProductType(resultSet.getString(2));
				purchaseApplicationObject.setProductColor(resultSet
						.getString(3));
				purchaseApplicationObject.setProductPrice(resultSet
						.getString(4));
				purchaseApplicationObject
						.setItemInStock(resultSet.getString(5));
				purchaseApplicationObject.setProductImage(resultSet
						.getString(6));

				list.add(purchaseApplicationObject);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
