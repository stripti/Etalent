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
 * Servlet implementation class EndFeedbackinsert
 */
@WebServlet("/EndFeedbackinsert")
public class EndFeedbackinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndFeedbackinsert() {
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
		String feedback=request.getParameter("txtarea");
        String id=request.getParameter("txtname");
        con=CrudOperation.createConnection();
        String str="insert into feedback(userid,contents) values(?,?)";
        try
        {  
        	con.setAutoCommit(false);
        ps=con.prepareStatement(str);
		ps.setString(1,id);
		ps.setString(2,feedback);		
		System.out.println(ps);
		int rw=ps.executeUpdate();
		if(rw>0)
		{
			con.commit();
			System.out.println("row inserted");
			response.sendRedirect("/Etalent/html/endmsgfeedback.html");
				
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
