package etalent.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalent.dbinfo.CrudOperation;

/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement pssent,psinb=null;
	ResultSet rs=null;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
		String recid=request.getParameter("txtrecid");
		String subject=request.getParameter("txtsub");
		String text=request.getParameter("txtarea");
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		HttpSession hs=request.getSession(false);
		String senderid=(String)hs.getAttribute("userinfo");
		
		con=CrudOperation.createConnection();
        String strsent="insert into sentitems(senderid,receiverid,msgtext,subject,date) values(?,?,?,?,?)";
	    String strinbox="insert into inbox(senderid,receiverid,msgtext,subject,date) values(?,?,?,?,?)";
	    
	    try{
			con.setAutoCommit(false);
			pssent=con.prepareStatement(strsent);
			pssent.setString(1, senderid);
			pssent.setString(2,recid);
			pssent.setString(3,text);
			pssent.setString(4,subject);
			pssent.setDate(5,sd);
	
			int row=pssent.executeUpdate();
			
			psinb=con.prepareStatement(strinbox);
			psinb.setString(1, senderid);
			psinb.setString(2,recid);
			psinb.setString(3,text);
			psinb.setString(4,subject);
			psinb.setDate(5,sd);			
			int row1=psinb.executeUpdate();
			
			if(row>0 && row1>0)
			{
				con.commit();
				System.out.println("row inserted");
				response.sendRedirect("/Etalent/jsp/candmessages.jsp");
				
				
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally{
			try{
				if(psinb!=null)
				{
					psinb.close();
					
				}
				if(pssent!=null)
				{
					pssent.close();
					
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
