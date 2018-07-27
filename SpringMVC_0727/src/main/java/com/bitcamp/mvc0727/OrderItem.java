package com.bitcamp.mvc0727;

public class OrderItem {

	private String itemId;
	private String number;
	private String remark;

	public OrderItem(String itemId, String number, String remark) {
		this.itemId = itemId;
		this.number = number;
		this.remark = remark;
	}

	public OrderItem() {
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "OrderItem [itemId=" + itemId + ", number=" + number + ", remark=" + remark + "]";
	}

}
