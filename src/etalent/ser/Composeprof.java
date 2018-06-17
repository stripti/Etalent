package etalent.ser;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Composeprof
 */
@WebServlet("/Composeprof")
public class Composeprof extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement pssent,psinb,ps=null;
	ResultSet rs,rs1=null;


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Composeprof() {
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
		
	
		String recid=request.getParameter("txtrecid");
		String subject=request.getParameter("txtsub");
		String text=request.getParameter("txtarea");
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		HttpSession hs=request.getSession(false);
		String senderid=(String)hs.getAttribute("userinfo");
		
		con=CrudOperation.createConnection();
		String str="Select userid from logininfo where userid=? and usertype='professional'";
        String strsent="insert into sentitems(senderid,receiverid,msgtext,subject,date) values(?,?,?,?,?)";
	    String strinbox="insert into inbox(senderid,receiverid,msgtext,subject,date) values(?,?,?,?,?)";
	    
	    
	    try
	    {
	    	ResultSet rs1=CrudOperation.getData(str,recid);
	    	
	    	while(rs1.next())
	    	{
	    		String rid=rs1.getString("userid");
	    		 try{
	    				con.setAutoCommit(false);
	    				pssent=con.prepareStatement(strsent);
	    				pssent.setString(1, senderid);
	    				pssent.setString(2,rid);
	    				pssent.setString(3,text);
	    				pssent.setString(4,subject);
	    				pssent.setDate(5,sd);
	    		        System.out.println(strsent);
	    				int row=pssent.executeUpdate();
	    				
	    				psinb=con.prepareStatement(strinbox);
	    				psinb.setString(1, senderid);
	    				psinb.setString(2,rid);
	    				psinb.setString(3,text);
	    				psinb.setString(4,subject);
	    				psinb.setDate(5,sd);		
	    				System.out.println(strinbox);
	    				int row1=psinb.executeUpdate();
	    				
	    				if(row<=0 && row1<=0)
	    				{
	    					response.setContentType("text/html");
	    					PrintWriter out=response.getWriter();
	    					out.println("<h1>Sorry, the receiver is not a professional, so we can't send this message!!</h1>");
	    					

	    				}
	    				else if(row>0 && row1>0)
	    				{
	    					con.commit();
	    					System.out.println("row inserted");
	    					response.sendRedirect("/Etalent/jsp/adprofmessages.jsp");
	    					
	    					
	    				}
	    				
	    		 }
	    			catch(SQLException se)
	    			{
	    				System.out.println(se);
	    			}
	    			finally
	    			{
	    				try{
	    					if(psinb!=null)
	    					{
	    						psinb.close();
	    						
	    					}
	    					if(pssent!=null)
	    					{
	    						pssent.close();
	    						
	    					}
	    						    					
	    				}
	    				catch(SQLException se)
	    				{
	    					System.out.println(se);
	    				}
	    			}

	    	}
	    	
	    }
	    
	    catch(SQLException se)
	    {
	    	System.out.println(se);
	   	}
	    finally
		{
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
