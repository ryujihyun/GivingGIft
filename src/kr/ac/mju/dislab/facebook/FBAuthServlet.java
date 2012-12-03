package kr.ac.mju.dislab.facebook;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.restfb.types.User;

@WebServlet("/FBAuthServlet") 
public class FBAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code"); 

		request.setCharacterEncoding("UTF-8");

		// facebook�먯꽌 �꾨떖諛쏆� �몄쬆 code媛��놁쓣 寃쎌슦
		if( code == null){			
			String oauthURL = Facebook.getOAuthURL();
			response.sendRedirect (oauthURL);
		}
		else{			
			Facebook facebook = Facebook.getInstance(code); 
			
			// �꾩옱 �섏씠�ㅻ턿 �좎���移쒓뎄���뺣낫瑜�媛�졇�⑤떎.
			User me = facebook.getCurrentUser();
			List<User> friends = facebook.getFriends();

			// request��attribute濡��대뒗��
			request.setAttribute("me", me);
			request.setAttribute("friends", friends);
			request.setAttribute("facebook", facebook);

			// View page �ㅼ젙
			RequestDispatcher view = request.getRequestDispatcher("myFacebook.jsp");
			view.forward(request, response);
		}
	}	
}
