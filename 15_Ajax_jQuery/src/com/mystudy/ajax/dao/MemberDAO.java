package com.mystudy.ajax.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.ajax.vo.MemberVO;
import com.mystudy.mybatis.DBService;


public class MemberDAO {

	//전체 직원 목록 조회
	public static List<MemberVO> getList() {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("members.all");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
