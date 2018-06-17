package etalent.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etalent.dbinfo.CrudOperation;

import java.sql.*;
/**
 * Servlet implementation class RegisterProfessional
 */
@WebServlet("/RegisterProfessional")
public class RegisterProfessional extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement pslogin,psuser=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterProfessional() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("txtuserid");
		String userpass=request.getParameter("txtuserpass");
		String regno=request.getParameter("txtregno");
		String cname=request.getParameter("txtcname");
		String address=request.getParameter("txtaddress");
		String email=request.getParameter("txtemail");
		String phone=request.getParameter("txtphoneno");
		String owner=request.getParameter("txtowner");
		String work=request.getParameter("txtworkarea");
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());


		con=CrudOperation.createConnection();
		String strlogin="insert into logininfo values(?,?,?,?)";
		String struser="insert into companyprofessionals values(?,?,?,?,?,?,?,?,?)";
		
		try{
			con.setAutoCommit(false);
			pslogin=con.prepareStatement(strlogin);
			pslogin.setString(1, userid);
			pslogin.setString(2,userpass);
			pslogin.setString(3,"professional");
			pslogin.setString(4,"false");
			System.out.println(pslogin);
			int row=pslogin.executeUpdate();
			
			
			psuser=con.prepareStatement(struser);
			psuser.setString(1, userid);
			psuser.setString(2, cname);
			psuser.setString(3,address);
			psuser.setString(4, email);
			psuser.setLong(5, Long.parseLong(phone));
		    psuser.setDate(6, sd);
			psuser.setString(7,owner );
			psuser.setString(8,work );
			psuser.setString(9, regno);

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
