package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirstFilter extends HttpFilter{
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();	
		
		HttpSession session = request.getSession();
		session.setAttribute("uri",uri);
		//		boolean check = (Boolean)session.getAttribute("auth");

		if(session.getAttribute("auth")!=null) {
			chain.doFilter(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
		
		//request.getContextPath()+uri
	}

}
