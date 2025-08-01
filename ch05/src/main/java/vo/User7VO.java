package vo;

public class User7VO {
	
	private int id;
	private String name;
	private int age;
	private int email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getEmail() {
		return email;
	}
	public void setEmail(int email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "User7VO [id=" + id + ", name=" + name + ", age=" + age + ", email=" + email + "]";
	}
	
	

}
