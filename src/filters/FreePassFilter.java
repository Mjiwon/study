package filters;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FreePassFilter extends HttpFilter{
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Cookie[] ar	= request.getCookies();
		String value = null;
		if(ar!=null) {
			for(int i = 0; i<ar.length;i++) {
				if(ar[i].getName().equals("freepass")) {
					value = URLDecoder.decode(ar[i].getValue(), "UTF-8");
					session.setAttribute("auth", true);
					chain.doFilter(request, response);
				}
			}
		}
		
	}
}
