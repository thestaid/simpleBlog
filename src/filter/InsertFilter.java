package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/board/board_op/insert.jsp", "/board/board_op/insertForm.jsp"})
public class InsertFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	//게시글  등록 시 id값을 불러서 없으면 필터 작용하도록 만드는 기능
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//ServletRequest, ServletResponse가 부모타입으로 getSession하기 위해서
		//원래 type으로 casting
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		
		//HttpSession 객체
		HttpSession session=request.getSession();
		
		//contextpath name 읽어오기
		String contextPath=request.getContextPath();
		
		//원래 요청 uri 정보 얻어오기
		String uri=request.getRequestURI();
		
		//세션에 로그인 정보가 있는지 여부를 확인해서
		if(session.getAttribute("id")==null){
			String path=contextPath+"/sign/signin_form.jsp?uri="+uri;
			//로그인 페이지로 이동 시킨다.
			System.out.println(path);
			response.sendRedirect(path);
		}else{
			//원래 하려던 작업 진행 시키기 
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
