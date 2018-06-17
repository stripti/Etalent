package etalent.ser;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import etalent.dbinfo.CrudOperation;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		HttpSession hs=null;
		hs=request.getSession();
		String ui=(String)hs.getAttribute("userinfo");
		String rem=request.getParameter("txtdesc");
		java.util.Date d=new java.util.Date();
		java.sql.Date sd=new java.sql.Date(d.getTime());
		ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		System.out.println(path);
		String newpath=path+ui;
		
		File f=new File(newpath);
		if(!f.exists())
		{
			f.mkdir();
		}
		
		System.out.println("dir created");
		MultipartRequest mpt= new MultipartRequest(request, newpath,6*1024*1024,new DefaultFileRenamePolicy());
		String desc=mpt.getParameter("txtdesc");
		Enumeration<String> e=mpt.getFileNames();
		File actualfileobject=null;
		String picname=null;
		if(mpt!=null)
		{
			while(e.hasMoreElements())
		
		{
			String controlname=e.nextElement();
			actualfileobject=mpt.getFile(controlname);
			picname=actualfileobject.getName();
			
		}
		System.out.println(picname);
	    }
		String strins="insert into uploaddetails(userid,filename,date,remarks) values(?,?,?,?)";
		con=CrudOperation.createConnection();
		try{
			ps=con.prepareStatement(strins);
			ps.setString(1, ui);
			ps.setString(2, picname);
			ps.setDate(3, sd);
			ps.setString(4, rem);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("Uploaded details");
				response.sendRedirect("/Etalent/jsp/candidatepost.jsp");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
	}

}

