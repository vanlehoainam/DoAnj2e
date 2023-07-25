package Conntroller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Quanaomodel;

/**
 * Servlet implementation class Addsp
 */
@WebServlet("/addsp")
public class Addsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addsp() {
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
			
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			String tensp = request.getParameter("tensp");
			String size = request.getParameter("size");
			Double giaban= Double.parseDouble( request.getParameter("giaban"));
			int soluong = Integer.parseInt( request.getParameter("soluong"));
			String mota = request.getParameter("mota");

			// Assuming you have a valid JDBC connection
			try {
				Quanaomodel model = new Quanaomodel();
				model.insertQuanAo(tensp, size,giaban,soluong, mota);
//	            insertNhaSanXuat(name, address, phone, email);
				response.sendRedirect(request.getContextPath() + "/quanaoservlet");
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/error.jsp"); // Redirect to error page
			}
		}

}
