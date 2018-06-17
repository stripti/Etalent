package etalent.dbinfo;

import java.sql.*;

public class CrudOperation 
{
   private static Connection cn=null;
   static PreparedStatement ps=null;
   static ResultSet rs=null;
   public static Connection createConnection()
   {
	   try{
		   Class.forName("com.mysql.jdbc.Driver");
		   cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talent","root","root");
		   
	   }
	   catch(ClassNotFoundException|SQLException cse)
	   {
		   System.out.println(cse);
	   }
	   return cn;
   }
	
   public static ResultSet getData(String sql,String info)
	{
		cn=createConnection();
		try{
			ps=cn.prepareStatement(sql);
			ps.setString(1, info);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	} 
   public static ResultSet getData(String sql,String info,String info1)
	{
		cn=createConnection();
		try{
			ps=cn.prepareStatement(sql);
			ps.setString(1, info);
			ps.setString(2, info1);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
   public static ResultSet getData(String sql,int info)
	{
		cn=createConnection();
		try{
			ps=cn.prepareStatement(sql);
			ps.setInt(1, info);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
   public static ResultSet getData(String sql,Date info)
	{
		cn=createConnection();
		try{
			ps=cn.prepareStatement(sql);
			ps.setDate(1, info);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}


   public static ResultSet getData(String str)
	{
		cn=createConnection();
		try{
			ps=cn.prepareStatement(str);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
}
