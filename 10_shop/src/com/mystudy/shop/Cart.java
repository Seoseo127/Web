package com.mystudy.shop;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<ProductVO> list; //카트에 담긴 제품 목록
	private int total; //카트에 담긴 제품 가격 합계
	
	public Cart() {
		list = new ArrayList<ProductVO>();
		System.out.println(":: 카트(장바구니) 생성~~~");
	}

	//(실습) 카트 제품이 있는지 확인(있으면: VO리턴, 없으면: null 리턴)
	public ProductVO findProduct(String pnum) {
		for (ProductVO pvo : list) {
			if (pvo.getPnum().equals(pnum)) {
				return pvo;
			}
		}
		return null;
	}
	
	/*(실습) 장바구니에 담기 요청 처리기능(카트에 제품 추가)
	 * list 에 없으면 제품 추가
	 * list에 동일한 제품이 있으면 수량 1개 증가 처리
	 * 장바구니 금액합계(total) 재계산 처리
	 */
	public void addProduct(String pnum, ProductDAO dao) {
		ProductVO pvo = findProduct(pnum);
		//System.out.println("찾은결과 : " + pvo);
		
		if (pvo == null) { //카트에 없음 : 제품을 카트에 등록
			pvo = dao.selectOne(pnum);
			pvo.setCount(1); //수량, 수량별금액 변경처리
			list.add(pvo);
			total += pvo.getSaleprice();
			//System.out.println("새로추가후 : " + list);
		} else { //카트에 있음 : 수량만 1 증가 처리
			pvo.setCount(pvo.getCount() + 1);
			total += pvo.getSaleprice();
			//System.out.println("1개증가후 : " + list);
		}
	}
	
	//(실습)장바구니 제품 수량 변경 처리기능
	public void editCount(String pnum, int count) {
		
	}
	
	//(실습)장바구니 제품 삭제 처리기능
	public void delProduct(String pnum) {
		
	}
	
	
	public List<ProductVO> getList() {
		return list;
	}

	public int getTotal() {
		return total;
	}
	
	
}
