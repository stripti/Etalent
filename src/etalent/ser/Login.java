package etalent.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalent.dbinfo.CrudOperation;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String ui=request.getParameter("txtuserid");
		String upass=request.getParameter("txtuserpass");
		
		HttpSession hs=null;
		con=CrudOperation.createConnection();
		
		String strsql="select * from logininfo where userid=? and userpass=? and status=?";
		
		try{
			ps=con.prepareStatement(strsql);
			ps.setString(1,ui);
			ps.setString(2, upass);
			ps.setString(3, "true");
			rs=ps.executeQuery();
			if(rs.next())
			{
				hs=request.getSession();
				hs.setAttribute("userinfo", ui);
				String usertype=rs.getString("usertype");
				hs.setAttribute("ut", usertype);

				if(usertype.equals("admin"))
				{
					response.sendRedirect("/Etalent/jsp/adminProfile.jsp");
				}
				if(usertype.equals("candidate"))
				{
					response.sendRedirect("/Etalent/jsp/candidateProfile.jsp");
				}
				if(usertype.equals("professional"))
				{
					response.sendRedirect("/Etalent/jsp/professionalProfile.jsp");
				}
			}
			else
			{

				request.setAttribute("msg","Invalid id or password");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
				rd.forward(request,response);
				
			}
			
		}
		
		/*if(chkarr!=null)
		{
			response.setContentType("text/html");
			Cookie c=new Cookie("logincookie",info);
			c.setMaxAge(7200);//to set the max age of cookie
			response.addCookie(c);//send to client machine
			System.out.println("cookie created");
			
			String data=null;
			Cookie[] c1=request.getCookies();
			for(int i=0;i<c1.length;i++)
			{
				Cookie co=c1[i];
				if(co.getName().equals("logincookie"))
				{
					data=co.getValue();
					break;
				}
			} 
			request.setAttribute("chk",data);
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request,response);
			}
			*/
			
	catch(SQLException se)
	{
		System.out.println(se);
	}

}
}