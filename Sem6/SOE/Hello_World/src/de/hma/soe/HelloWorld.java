package de.hma.soe;

public class HelloWorld {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("Hello World");
		
		Person p1 = new Person("Peter","Herr");
		Person p2 = new Person("Hans", "Herr");
		Person p3 = new Person("Lukas", "Herr");
		Person p4 = new Person("Alina", "Frau");
		
		p1.SetNachname("Müller");
		p2.SetNachname("Schmidt");
		p3.SetNachname("Usenbenz");
		p4.SetNachname("Meier");
		
		p1.SetAlter(55);
		p2.SetAlter(62);
		p3.SetAlter(14);
		p4.SetAlter(17);
		
		p1.Gruesst(p2);
		p2.Gruesst(p4);
		p3.Gruesst(p1);
		p4.Gruesst(p3);
		
	}

}
