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
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/DeleteMessage")
public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessage() {
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
		int flag=0;
		HttpSession hs=request.getSession(false);
		String utype=(String)hs.getAttribute("ut");
		String pagevar=request.getParameter("txthid");
		String []arr=request.getParameterValues("chkdel");
		String sql=null;
		String url=null;
		if(pagevar.equals("sent"))
		{
			url="/Etalent/jsp/sentitem.jsp";
			sql="delete from sentitem where msgid=?";
		}
		if(pagevar.equals("inbox"))
		{
			url="/Etalent/jsp/inbox.jsp";
			sql="delete from inbox where msgid=?";
		}
		con=CrudOperation.createConnection();
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(sql);
			for(int i=0;i<arr.length;i++)
			{
				ps.setInt(1, Integer.parseInt(arr[i]));
				ps.addBatch();
			}
			int []rw=ps.executeBatch();
			for(int j=0;j<rw.length;j++)
			{
				if(rw[j]<0)
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{
				con.commit();
				if(utype.equals("admin"))
				{
					response.sendRedirect("/Etalent/jsp/adminProfile.jsp");
				}
				if(utype.equals("professional"))
				{
					response.sendRedirect("/Etalent/jsp/candmessages.jsp");
				}

			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		
	}

}
