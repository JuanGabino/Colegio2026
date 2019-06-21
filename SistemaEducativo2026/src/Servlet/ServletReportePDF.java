package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.ReporteAsistencia_EXCEL;


@WebServlet("/ReporteAsistenciaExcel")
public class ServletReportePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletReportePDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String seccion 		 = request.getParameter("seccion");
		String docente 		 = request.getParameter("docente");
		int    mes     		 = Integer.parseInt(request.getParameter("mes"));
		String docentenombre = request.getParameter("docnom");
		String seccionnombre = request.getParameter("secnom");
		String mesnombre      = request.getParameter("mesnom");
		String anio           = request.getParameter("anio");

		
		String flag = "-1";
		
		try {
			
			ReporteAsistencia_EXCEL reporteExcel = new ReporteAsistencia_EXCEL();

			flag = reporteExcel.generarExcelAsistencia(seccion,  docente, mes, docentenombre, seccionnombre, mesnombre, anio) == true ? "1" : "0";

		} catch (Exception e) {
			System.out.println("Eror : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(flag);
//		response.sendRedirect(request.getContextPath()+"/Docentes/Main/DocenteC9.jsp");
	}

}
