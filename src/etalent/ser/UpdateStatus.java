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
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatus() {
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
		int flag=0;
		String[] arr=request.getParameterValues("chkupd");
		String strupdate="update logininfo set status=? where userid=?";
		con=CrudOperation.createConnection();
		try{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strupdate);
			for(int i=0;i<arr.length;i++)
			{
				ps.setString(1, "true");
				ps.setString(2, arr[i]);
				ps.addBatch();
			}
			int[] rows=ps.executeBatch();
			for(int j=0;j<rows.length;j++)
			{
				if(rows[j]<0)
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{
				con.commit();
				response.sendRedirect("/Etalent/jsp/adminProfile.jsp");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}

	}

}
