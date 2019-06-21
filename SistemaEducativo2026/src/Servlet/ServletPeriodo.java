package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.AnioEscolar;
import Beans.Perfil;
import Beans.Periodo;
import Jdbc.PerfilJDBC;
import Jdbc.PeriodoJDBC;


@WebServlet({"/ListarPeriodo", "/ListarAnio", "/ListarBimestre", "/ListarPerfil"})
public class ServletPeriodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			switch (request.getServletPath()) {
				case "/ListarPeriodo":
					listarPeriodo(request, response);
					break;
				case "/ListarAnio":
					listarAnio(request, response);
					break;
				case "/ListarBimestre":
					listarBimestre(request, response);
					break;
				case "/ListarPerfil":
					listarPerfil(request, response);
		
			}
			
		} catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
		
		
		
	}
	
	private void listarPerfil(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		List<Perfil> lista = new ArrayList<Perfil>();
		StringBuilder sb = new StringBuilder("");

		try {
			PerfilJDBC dao = new PerfilJDBC();
			lista = dao.listarPerfil();

			for (Perfil bean : lista) {
				sb.append(bean.getIdperfil() + "/" + bean.getNombre() +  ":");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());

	}
	
	private void listarPeriodo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		List<Periodo> lista = new ArrayList<Periodo>();
		StringBuilder sb = new StringBuilder("");

		try {
			PeriodoJDBC dao = new PeriodoJDBC();
			lista = dao.listarPeriodo();

			for (Periodo bean : lista) {
				sb.append(bean.getIdPeriodo() + "/" + bean.getDescripcion() +  ":");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());

	}
	
	private void listarAnio(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		List<AnioEscolar> lista = new ArrayList<AnioEscolar>();
		StringBuilder sb = new StringBuilder("");

		try {
			PeriodoJDBC dao = new PeriodoJDBC();
			lista = dao.listarAnio();

			for (AnioEscolar bean : lista) {
				sb.append(bean.getIdAnio() + "/" + bean.getAnio() +  ":");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());

	}
	
	private void listarBimestre(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int bimestre= Integer.parseInt(request.getParameter("bimestre"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			PeriodoJDBC dao = new PeriodoJDBC();
			sb = dao.semanasBimestre(bimestre);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
}
