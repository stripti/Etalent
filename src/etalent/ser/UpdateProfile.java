package etalent.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalent.dbinfo.CrudOperation;
/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ph=request.getParameter("txtphone");
		long phoneno=Long.parseLong(ph);
		String email=request.getParameter("txtemail");
		String address=request.getParameter("txtaddress");
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userinfo");
		String strupdate="Update candidatesinfo set phoneno=?,email=?,address=? where userid=?";
		con=CrudOperation.createConnection();
		try{
			ps=con.prepareStatement(strupdate);
			ps.setLong(1,phoneno);
			ps.setString(2,email);
			ps.setString(3,address);
			ps.setString(4, uid);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				response.sendRedirect("/Etalent/jsp/candidateProfile.jsp");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
	}

}
