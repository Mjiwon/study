package handler;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionHandler implements HttpSessionListener {
//	@Override
//	public void sessionCreated(HttpSessionEvent se) {
//		HttpSession session = se.getSession();
//		session.setAttribute("auth", false);
//	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session  = se.getSession();
		ServletContext application =session.getServletContext();
		Set<String> set =(Set)application.getAttribute("users");
		String id = (String)session.getAttribute("id");
		set.remove(id);
		session.removeAttribute("auth");		
		application.setAttribute("users", set);	// ¾È½ÃÄÑµµ µÊ?
	}
	

}
