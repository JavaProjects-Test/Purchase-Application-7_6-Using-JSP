package com.purchaseapplication.service;

import java.util.List;

import com.purchaseappication.model.PurchaseApplication;

public interface IPurchaseapplicationService {

	public boolean getAddProduct(PurchaseApplication object);
	
	public List<PurchaseApplication> getList();
	
}
