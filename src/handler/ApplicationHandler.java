package handler;

import java.util.LinkedHashSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event�� Listener 2��
 *  - ServletContextListener : init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 *  
 *  �� EventListener�� ����� �ʿ��մϴ�. (�˾Ƽ� �������� �ʴ´�)
 *  
 */
public class ApplicationHandler implements ServletContextListener{
	long begin;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		// ����̹� �ε�
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}

		ServletContext ctx = sce.getServletContext();

		int r = (int)(Math.random()*10);
		ctx.setAttribute("r", r);
		ctx.setRequestCharacterEncoding("UTF-8");
		ctx.setAttribute("users", new LinkedHashSet<>());
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}
}
