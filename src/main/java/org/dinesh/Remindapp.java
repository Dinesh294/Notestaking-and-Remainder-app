package org.dinesh;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Remindapp {  
	{
	
	Logininfo usi=new Logininfo(); 
	usi.setUsername("Reena"); 
	usi.setPass("Reena");
	usi.setMobileno("8956342312"); 
	
	Configuration con=new Configuration().configure();
	SessionFactory sf=con.buildSessionFactory();
	Session session= sf.openSession();
	session.save(usi);
	
	

} 

}
