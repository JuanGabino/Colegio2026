package Servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.ReporteCOM_PDF;


@WebServlet("/ReportePDF")
public class ServletReportes extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletReportes() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idcomunicado= request.getParameter("idcomunicado");
		
		String flag = "-1";

		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();

		try {
			ReporteCOM_PDF reportePDF = new ReporteCOM_PDF();

			flag = reportePDF.generarReporteComunicado(idcomunicado, out) == true ? "1" : "0";

			if (flag == "1") {
				System.out.println("Correcto");
			}

		} catch (Exception e) {
			System.out.println("Error :" + e.getMessage());
			e.printStackTrace();
		}
	}

}
