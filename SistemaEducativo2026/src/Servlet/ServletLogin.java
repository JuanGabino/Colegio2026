package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Alumno; 
import Beans.Usuario;
import Jdbc.LoginJDBC;


@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
	
		String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        LoginJDBC dao = new LoginJDBC(); 
        Usuario bean = new Usuario();
        
        bean = dao.validarUsuario(usuario, contrasena);
        
        String username = "";
        String idUsername = "";
        String dni = "";
        int perfil = -1;
       
    		
        if(bean.getPerfil() == 1) 
        {

        	username = bean.getNombre();
        	idUsername = bean.getIdUsuario();
        	perfil = bean.getPerfil();
        	dni = bean.getNombreUsuario();
        	
        	HttpSession session = request.getSession();
        	session.setAttribute("username", username);
        	session.setAttribute("idUsername", idUsername);
        	session.setAttribute("profile", "Director");
        	session.setAttribute("perfil", perfil);
        	session.setAttribute("dni", dni);
        	System.out.println("Conectado al Sistema");
        	response.sendRedirect("index.jsp");
        	
        }
        if(bean.getPerfil() == 2) 
        {

        	username = bean.getNombre();
        	idUsername = bean.getIdUsuario();
        	perfil = bean.getPerfil();
        	dni = bean.getNombreUsuario();
        	
        	HttpSession session = request.getSession();
        	session.setAttribute("username", username);
        	session.setAttribute("idUsername", idUsername);
        	session.setAttribute("profile", "Docente");
        	session.setAttribute("perfil", perfil);
        	session.setAttribute("dni", dni);
        	System.out.println("Conectado al Sistema");
        	response.sendRedirect("index.jsp");
        	
        }
        if(bean.getPerfil() == 3) 
        {

        	username = bean.getNombre();
        	idUsername = bean.getIdUsuario();
        	perfil = bean.getPerfil();
        	dni = bean.getNombreUsuario();
        	
        	HttpSession session = request.getSession();
        	session.setAttribute("username", username);
        	session.setAttribute("idUsername", idUsername);
        	session.setAttribute("profile", "Padre de Familia/Tutor");
        	session.setAttribute("perfil", perfil);
        	session.setAttribute("dni", dni);
        	System.out.println("Conectado al Sistema");
     
        	response.sendRedirect("index.jsp");
        }
        else
        {
        	request.setAttribute("message", "Usuario invalido, intentelo de Nuevo");
        	request.getRequestDispatcher("login.jsp").include(request, response);
        }
	}
	
}
