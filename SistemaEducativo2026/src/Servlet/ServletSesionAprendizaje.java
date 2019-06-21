package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.Sesion_Aprendizaje;
import Jdbc.Sesion_AprendizajeJDBC;


@WebServlet("/ListarSesion")

public class ServletSesionAprendizaje extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletSesionAprendizaje() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		StringBuilder sb = new StringBuilder("");
		List<Sesion_Aprendizaje> lista = new ArrayList<Sesion_Aprendizaje>();
		String docente = request.getParameter("docente");
		String nivelacion = request.getParameter("nivelacion");
		
		try {
			
			Sesion_AprendizajeJDBC dao = new Sesion_AprendizajeJDBC();
			lista = dao.listarArchivosPdf(docente, nivelacion);
			
			for(Sesion_Aprendizaje bean : lista) 
			{
				sb.append(bean.getIdsesion() + "|" + bean.getTitulo() + "|" + bean.getNivelacion() + "|" +  bean.getSeccion() + "|" +
							bean.getCurso() + "|" + bean.getDocente() + "|" + bean.getArchivo2() + "|" + bean.getFechaCreacion() + "|" + 
							bean.getEstado() + "|" + "$");
			}
		} catch (Exception e) {
			
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}

}
