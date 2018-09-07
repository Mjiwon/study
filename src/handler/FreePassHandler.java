package handler;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import beans.LoginLogDAO;

public class FreePassHandler implements ServletRequestListener {

	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		ServletRequest req = sre.getServletRequest();
		HttpServletRequest request = (HttpServletRequest) req;
		if (request.getSession().isNew()) {
			Cookie[] ar = request.getCookies();
			String value = null;
			if (ar != null) {
				for (int i = 0; i < ar.length; i++) {
					if (ar[i].getName().equals("freepass")) {
						value = ar[i].getValue();
					}
				}
			}

			if (value != null) {
				System.out.println("[CookieHandler] Client");
				request.getSession().setAttribute("auth", true);
				LoginLogDAO ldao = new LoginLogDAO();
				Map log = ldao.pastlog(value);
				if(log!=null) {
					request.setAttribute("time", log.get("time"));
				}
				ldao.loglist(value);
				
			} else {
				System.out.println("인증안한사람");
			}
		}
	}

	@Override
	public void requestDestroyed(ServletRequestEvent sre) {

	}

}
