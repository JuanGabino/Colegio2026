package Servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.ReporteObservaciones_PDF; 


@WebServlet("/ConsultaObservacion")
public class ServletConsultas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletConsultas() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String seccion = request.getParameter("seccion");
		String docente = request.getParameter("docente");
		String mes     = request.getParameter("mes");
		String anio    = request.getParameter("ano");
		String nomdocente = request.getParameter("nomdocente");
		String nomseccion = request.getParameter("nomseccion");
		String nommes     = request.getParameter("nommes");
		String nomano     = request.getParameter("nomano");
		
		String flag = "-1";

		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();

		try {
			ReporteObservaciones_PDF reportePDF = new ReporteObservaciones_PDF();

			flag = reportePDF.generarReporteObservaciones(seccion, docente, mes, anio, nomdocente, nomseccion, nommes, nomano, out) == true ? "1" : "0";

			if (flag == "1") {
				System.out.println("Correcto");
			}

		} catch (Exception e) {
			System.out.println("Error :" + e.getMessage());
			e.printStackTrace();
		}
	}

}
