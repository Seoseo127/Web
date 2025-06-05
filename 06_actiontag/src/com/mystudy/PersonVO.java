package com.mystudy;

public class PersonVO {
	private String name;
	private String age;
	
	// 액션태그 useBean 사용시에는 기본 생성자 작성 필수
	public PersonVO() {
		System.out.println(":: PersonVO() 실행-------");
	}

	public PersonVO(String name, String age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "PersonVO [name=" + name + ", age=" + age + "]";
	}
	
	
}
