package com.ziobite.model;

import java.util.ArrayList;
import java.util.List;

public class Order {

	  private int orderId;
	    private int userId;
	    private int restaurantId;
	    private String orderDate;
	    private double totalAmount;
	    private String paymentMethod;
	    private String status;
	    private double foodTotal;
	    private double deliveryFee;
	    private double platformFee;
	    private List<OrderItem> items = new ArrayList<>();
	    
	    
    public Order() {
    	
    }


	public Order(int orderId, int userId, int restaurantId, String orderDate, double totalAmount, String paymentMethod,
			String status, double foodTotal, double deliveryFee, double platformFee, List<OrderItem> items) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.foodTotal = foodTotal;
		this.deliveryFee = deliveryFee;
		this.platformFee = platformFee;
		this.items = items;
	}


	/**
	 * @return the orderId
	 */
	public int getOrderId() {
		return orderId;
	}


	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}


	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}


	/**
	 * @return the restaurantId
	 */
	public int getRestaurantId() {
		return restaurantId;
	}


	/**
	 * @param restaurantId the restaurantId to set
	 */
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	/**
	 * @return the orderDate
	 */
	public String getOrderDate() {
		return orderDate;
	}


	/**
	 * @param orderDate the orderDate to set
	 */
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	/**
	 * @return the totalAmount
	 */
	public double getTotalAmount() {
		return totalAmount;
	}


	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}


	/**
	 * @return the paymentMethod
	 */
	public String getPaymentMethod() {
		return paymentMethod;
	}


	/**
	 * @param paymentMethod the paymentMethod to set
	 */
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}


	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * @return the foodTotal
	 */
	public double getFoodTotal() {
		return foodTotal;
	}


	/**
	 * @param foodTotal the foodTotal to set
	 */
	public void setFoodTotal(double foodTotal) {
		this.foodTotal = foodTotal;
	}


	/**
	 * @return the deliveryFee
	 */
	public double getDeliveryFee() {
		return deliveryFee;
	}


	/**
	 * @param deliveryFee the deliveryFee to set
	 */
	public void setDeliveryFee(double deliveryFee) {
		this.deliveryFee = deliveryFee;
	}


	/**
	 * @return the platformFee
	 */
	public double getPlatformFee() {
		return platformFee;
	}


	/**
	 * @param platformFee the platformFee to set
	 */
	public void setPlatformFee(double platformFee) {
		this.platformFee = platformFee;
	}


	/**
	 * @return the items
	 */
	public List<OrderItem> getItems() {
		return items;
	}


	/**
	 * @param items the items to set
	 */
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}


	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + ", paymentMethod=" + paymentMethod + ", status=" + status
				+ ", foodTotal=" + foodTotal + ", deliveryFee=" + deliveryFee + ", platformFee=" + platformFee
				+ ", items=" + items + "]";
	}
	
	

}
	