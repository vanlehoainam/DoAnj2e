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
 * Servlet implementation class Deletesp
 */
@WebServlet("/deletesp")
public class Deletesp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletesp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ID_QAStr = request.getParameter("ID_QA");
		int ID_QA = Integer.parseInt(ID_QAStr);
		// Assuming you have a valid JDBC connection
		try {
			Quanaomodel model = new Quanaomodel();
			model.deleteQuanAo(ID_QA);
			response.sendRedirect(request.getContextPath() + "/quanaoservlet");
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().write("Lỗi xóa sản phẩm: " + e.getMessage());
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
