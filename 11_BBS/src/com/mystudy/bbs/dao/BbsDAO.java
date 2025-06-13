package com.mystudy.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;

public class BbsDAO {

	//게시글(BBS)의 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = -1;
		try (SqlSession ss = DBService.getFactory().openSession();) {
			totalCount = ss.selectOne("BBS.totalCount");
		} catch (Exception e) {
			//totalCount = -1;
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 조회
	public static List<BbsVO> getList(int begin, int end) {
		try (SqlSession ss = DBService.getFactory().openSession();) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			
			return ss.selectList("BBS.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//(실습)게시글 1개 조회 기능
	
	//게시글 입력 기능
	public static int insert(BbsVO bvo) {
		//openSession(true) : 오토커밋(자동커밋) 사용
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			return ss.insert("BBS.insert", bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글 수정 기능
	
	//(실습)게시글 조회수 1 증가 기능(수정)
	
	//게시글 삭제 기능
	
	//========== 댓글관련 =========
	//(실습)댓글목록 조회 기능(게시글에 딸린)
	
	//댓글 1개 조회 기능
	
	//댓글 입력 기능
	
	//댓글 수정 기능
	
	//댓글 삭제 기능
	
}












