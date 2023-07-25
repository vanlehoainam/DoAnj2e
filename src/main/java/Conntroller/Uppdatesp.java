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
 * Servlet implementation class Uppdatesp
 */
@WebServlet("/uppdatesp")
public class Uppdatesp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uppdatesp() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String ID_QAStr = request.getParameter("ID_QAStr");
		int ID_QA = Integer.parseInt(ID_QAStr);
		
		
		String tensp = request.getParameter("tensp"+ ID_QAStr);
		String size = request.getParameter("size"+ ID_QAStr);
		Double giaban= Double.parseDouble( request.getParameter("giaban")+ ID_QAStr);
		int soluong = Integer.parseInt( request.getParameter("soluong")+ ID_QAStr);
		String mota = request.getParameter("mota"+ ID_QAStr);

		// Assuming you have a valid JDBC connection
		try {
			Quanaomodel model = new Quanaomodel();
			model.updateQuanAo(ID_QA, tensp, size, giaban, soluong,mota);
			response.sendRedirect(request.getContextPath() + "/quanaoservlet");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp"); // Redirect to error page
		}
	}

}
