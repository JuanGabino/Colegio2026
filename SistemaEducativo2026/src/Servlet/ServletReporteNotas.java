package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Jdbc.CalificacionesJDBC;
import Util.ReporteNotas_EXCEL;


@WebServlet({"/ReporteDestacados", "/ReporteMenosDestacados", "/ReportePorCurso", "/ReporteNotasExcel"})
public class ServletReporteNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    //public ServletReporteNotas() {
    //    super();
        
    //}

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			
				switch (request.getServletPath()) 
				{
				
					case "/ReporteDestacados":
						listarCalificacionesMaximas(request, response);
						break;
					case "/ReporteMenosDestacados":
						listarCalificacionesMinimas(request, response);
						break;
					case "/ReportePorCurso":
						listarLogroCurso(request, response);
						break;
					case "/ReporteNotasExcel":
						reporteNotasExcel(request, response);		
						break;
						
				}
		
			} catch (Exception e) {
		
				System.out.println("error :" + e.getMessage());
				e.printStackTrace();
		
			}
	}
	
	private void listarCalificacionesMaximas(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso= request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int periodo = Integer.parseInt(request.getParameter("periodo"));
		int anio    = Integer.parseInt(request.getParameter("anio"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			sb = dao.listarCalificacionesMaximas(seccion, curso, periodo, anio);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void listarCalificacionesMinimas(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso= request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int periodo = Integer.parseInt(request.getParameter("periodo"));
		int anio    = Integer.parseInt(request.getParameter("anio"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			sb = dao.listarCalificacionesMinimas(seccion, curso, periodo, anio);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void listarLogroCurso(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso= request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int periodo = Integer.parseInt(request.getParameter("periodo"));
		int anio    = Integer.parseInt(request.getParameter("anio"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			CalificacionesJDBC dao = new CalificacionesJDBC();
			sb = dao.graficoRendimientoCurso(seccion, curso, periodo, anio);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void reporteNotasExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String seccion = request.getParameter("seccion");
		String curso = request.getParameter("curso");
		String periodo = request.getParameter("periodo");
		String anio    = request.getParameter("anio");
		
		String flag = "-1";
		
		try {
			
			ReporteNotas_EXCEL reporteExcel = new ReporteNotas_EXCEL();

			flag = reporteExcel.generarExcelNotas(seccion, curso, periodo, anio) == true ? "1" : "0";

		} catch (Exception e) {
			System.out.println("Eror : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(flag);
//		response.sendRedirect(request.getContextPath()+"/Docentes/Main/DocenteC9.jsp");
	}
}
