package com.purchaseapplication.service;

import java.util.List;

import com.purchaseappication.model.PurchaseApplication;
import com.purchaseapplication.dao.IPuchaseApplicationDao;
import com.purchaseapplication.dao.PurchaseApplicationDaoImpl;

public class PurchaseApplicationServiceImpl implements
		IPurchaseapplicationService {
	IPuchaseApplicationDao purchaseApplicationDaoObject = new PurchaseApplicationDaoImpl();

	public boolean getAddProduct(PurchaseApplication object) {
		boolean status = false;
		if (object.getProductImage() != null && object.getProductType() != null
				&& object.getProductColor() != null
				&& object.getProductPrice() != null
				&& object.getItemInStock() != null
				&& object.getProductImage() != null) {
			status = purchaseApplicationDaoObject.getAddProduct(object);
		}
		return status;
	}

	public List<PurchaseApplication> getList() {

		return purchaseApplicationDaoObject.getList();
	}

}
