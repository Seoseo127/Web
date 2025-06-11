package com.mystudy.shop;

import java.sql.Date;

public class ProductVO {
	//DB에 있는 데이터 저장
	private int num;
	private String category;
	private String pnum;
	private String name;
	private String company;
	private int price;
	private int saleprice;
	private String imageSmall;
	private String imageLarge;
	private String content;
	private Date regdate;
	
	//수량, 수량별 합계금액(판매가 * 수량)
	private int count; //장바구니에 담긴 수량
	private int totalPrice; //수량별 금액(판매가 * 수량)
	
	//할인율 조회 메소드
	public int getPercent() {
		return (price - saleprice) * 100 / price;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		//수량이 변경되면 수량별 금액(totalPrice) 계산 후 변경처리
		totalPrice = saleprice * count;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	//getters, setters --------------
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getImageSmall() {
		return imageSmall;
	}
	public void setImageSmall(String imageSmall) {
		this.imageSmall = imageSmall;
	}
	public String getImageLarge() {
		return imageLarge;
	}
	public void setImageLarge(String imageLarge) {
		this.imageLarge = imageLarge;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

//	@Override
//	public String toString() {
//		return "ProductVO [num=" + num + ", category=" + category + ", pnum=" + pnum + ", name=" + name + ", company="
//				+ company + ", price=" + price + ", saleprice=" + saleprice + ", imageSmall=" + imageSmall
//				+ ", imageLarge=" + imageLarge + ", content=" + content + ", regdate=" + regdate + ", count=" + count
//				+ ", totalPrice=" + totalPrice + "]";
//	}
	
	@Override
	public String toString() {
		return "ProductVO [pnum=" + pnum + ", count=" + count+ ", totalPrice=" + totalPrice + "]";
	}
	
	
}
