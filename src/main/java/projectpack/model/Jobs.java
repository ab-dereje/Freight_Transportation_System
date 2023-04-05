package main.java.projectpack.model;


public class Jobs {

	int id;
	String title;
	String jobOwner;
	String truckType;
	String description;
	String price;

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJobOwner() {
		return this.jobOwner;
	}

	public void setJobOwner(String jobOwner) {
		this.jobOwner = jobOwner;
	}

	public String getTruckType() {
		return this.truckType;
	}

	public void setTruckType(String truckType) {
		this.truckType = truckType;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

}
