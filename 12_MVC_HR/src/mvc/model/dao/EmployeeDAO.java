package mvc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mvc.model.vo.EmployeeVO;
import mvc.mybatis.DBService;

public class EmployeeDAO {

	//전체 직원 목록 조회
	public static List<EmployeeVO> getList() {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("hr.list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//부서코드로 검색
	public static List<EmployeeVO> getDeptList(int deptno) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("hr.deptList", deptno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//이름으로 검색
	public static List<EmployeeVO> getFullnameList(String fullname) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			return ss.selectList("hr.fullnameList", fullname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 동적검색
	public static List<EmployeeVO> search(String idx, String keyword) {
		try (SqlSession ss = DBService.getFactory().openSession()) {
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			
			return ss.selectList("hr.search", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//사번으로 검색
	
	//직종으로 검색
	
	
}










