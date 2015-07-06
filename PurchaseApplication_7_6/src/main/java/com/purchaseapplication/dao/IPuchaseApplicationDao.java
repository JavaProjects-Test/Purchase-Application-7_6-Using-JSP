package com.purchaseapplication.dao;

import java.util.List;

import com.purchaseappication.model.PurchaseApplication;

public interface IPuchaseApplicationDao {
	public boolean getAddProduct(PurchaseApplication object);
	
	public List<PurchaseApplication> getList();
	
}
