package etalent.ser;

import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etalent.dbinfo.CrudOperation;

/**
 * Servlet implementation class AdminPost
 */
@WebServlet("/AdminPost")
public class AdminPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPost() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eventname=request.getParameter("txteventname");
		String city=request.getParameter("txtcity");
		String venue=request.getParameter("txtvenue").trim();
		String ur=request.getParameter("txturl");
		String url="/Etalent/jsp/events/"+ur+".jsp";
		String rem=request.getParameter("txtrem");
		String date=request.getParameter("txtdate");
		
		java.util.Date dt=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try{
			dt=sdf.parse(date);
		}
		catch(ParseException pe){
			System.out.println(pe);
		}
		java.sql.Date sd=new java.sql.Date(dt.getTime());
				
		con=CrudOperation.createConnection();
        String str="insert into events(eventname,date,city,venueaddress,urlpage,remarks) values(?,?,?,?,?,?)";
        try
        {  
        	con.setAutoCommit(false);
        ps=con.prepareStatement(str);
		ps.setString(1, eventname);
		ps.setDate(2,sd);		
		ps.setString(3,city);
		ps.setString(4,venue);
		ps.setString(5,url);
		ps.setString(6,rem);
		System.out.println(ps);
		int rw=ps.executeUpdate();
		if(rw>0)
		{
			con.commit();
			System.out.println("row inserted");
			response.sendRedirect("/Etalent/jsp/adminpost.jsp");
				
		}
	      }
	catch(SQLException se)
	{
		System.out.println(se);
	}
	finally{
		try{
			if(ps!=null)
			{
				ps.close();
				
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
