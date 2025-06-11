package com.mystudy.shop;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ProductDAO {

	public ProductDAO() {
		System.out.println(">> ProductDAO() 객체 생성");
	}
	
	public List<ProductVO> list(String category) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("shop.list", category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 제품번호로 데이터 조회
	public ProductVO selectOne(String pnum) {
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			return ss.selectOne("shop.one", pnum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
		return null;
	}
	
}














