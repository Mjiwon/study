package handler;

import java.util.LinkedHashSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event용 Listener 2개
 *  - ServletContextListener : init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 *  
 *  ※ EventListener는 등록이 필요합니다. (알아서 감지되지 않는다)
 *  
 */
public class ApplicationHandler implements ServletContextListener{
	long begin;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		// 드라이버 로딩
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
