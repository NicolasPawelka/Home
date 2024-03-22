package de.hma.soe;

public class Person {
	
	private String name;
	private String nachname;
	private int alter;
	private String gender;
	
	public Person (String s, String g) {
		name = s;
		gender = g;
	}
	
	public void SetName(String s) {
		name = s;
	}
	
	public void SetNachname(String s) {
		nachname = s;
	}
	
	public void SetAlter(int age) {
		alter = age;
	}
	
	public void Gruesst(Person p) {
		
		
		if(p.alter > 18) {
			System.out.println(name + " grüßt Sie ganz herzlich " + p.gender +" " + p.nachname);
		}else {
			System.out.println(name + " grüßt dich ganz herzlich " + p.name);
		}
		
	}
	

}
