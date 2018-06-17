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

import etalent.dbinfo.CrudOperation;

/**
 * Servlet implementation class RegisterCandidate
 */
@WebServlet("/RegisterCandidate")
public class RegisterCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement pslogin,psuser=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCandidate() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String userid=request.getParameter("txtuserid");
		String userpass=request.getParameter("txtuserpass");
		String name=request.getParameter("txtname");
		String address=request.getParameter("txtaddress");
		String phone=request.getParameter("txtphoneno");
		String skill=request.getParameter("txtskills");
		String email=request.getParameter("txtemail");
		String file=request.getParameter("fl");
		String gender=request.getParameter("gender");				
		con=CrudOperation.createConnection();
		String strlogin="insert into logininfo values(?,?,?,?)";
		String struser="insert into candidatesinfo values(?,?,?,?,?,?,?,?)";
		
		try{
			con.setAutoCommit(false);
			pslogin=con.prepareStatement(strlogin);
			pslogin.setString(1, userid);
			pslogin.setString(2,userpass);
			pslogin.setString(3,"candidate");
			pslogin.setString(4, "true");
			System.out.println(pslogin);
			int row=pslogin.executeUpdate();
			
			
			psuser=con.prepareStatement(struser);
			psuser.setString(1, userid);
			psuser.setString(2,name);
			psuser.setString(3, address);
			psuser.setLong(4, Long.parseLong(phone));
			psuser.setString(5,skill);
			psuser.setString(6, email);
			psuser.setString(7, file);
			psuser.setString(8,gender );
			System.out.println(psuser);
			int row1=psuser.executeUpdate();
			
			if(row>0 && row1>0)
			{
				con.commit();
				System.out.println("row inserted");
				response.sendRedirect("/Etalent/html/msg.html");
				
				
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally{
			try{
				if(pslogin!=null)
				{
					pslogin.close();
					
				}
				if(psuser!=null)
				{
					psuser.close();
					
				}
				if(con!=null)
				{
					con.close();
					
				}
				
			}
			catch(SQLException se)
			{
				System.out.println(se);
			}
		}		
	}

	

}
