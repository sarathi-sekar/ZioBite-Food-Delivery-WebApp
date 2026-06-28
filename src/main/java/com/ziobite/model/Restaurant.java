package com.ziobite.model;

public class Restaurant {
	
    private int id;
    private String name;
    private String address;
    private double rating;
    private String image;
    private String cuisineType;
    private int deliveryTime;
    private String isActive;
	
    public Restaurant() {

    }
    
    
	public Restaurant(int id, String name, String address, double rating, String image, String cuisineType,
			int deliveryTime, String isActive) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.rating = rating;
		this.image = image;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.isActive = isActive;
	}


	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the rating
	 */
	public double getRating() {
		return rating;
	}

	/**
	 * @param rating the rating to set
	 */
	public void setRating(double rating) {
		this.rating = rating;
	}

	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}

	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * @return the cuisineType
	 */
	public String getCuisineType() {
		return cuisineType;
	}

	/**
	 * @param cuisineType the cuisineType to set
	 */
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	/**
	 * @return the deliveryTime
	 */
	public int getDeliveryTime() {
		return deliveryTime;
	}

	/**
	 * @param deliveryTime the deliveryTime to set
	 */
	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	/**
	 * @return the isActive
	 */
	public String getIsActive() {
		return isActive;
	}

	/**
	 * @param isActive the isActive to set
	 */
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Restaurant [id=" + id + ", name=" + name + ", address=" + address + ", rating=" + rating + ", image="
				+ image + ", cuisineType=" + cuisineType + ", deliveryTime=" + deliveryTime + ", isActive=" + isActive
				+ "]";
	}
	
	
	
	
	
	
	
	

}
