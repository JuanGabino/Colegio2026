package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import Beans.Usuario;
import Jdbc.DocentesJDBC;
import Jdbc.UsuarioJDBC;

@WebServlet({"/RegistrarUsuario", "/ListarUsuarioDocente", "/ListarUsuarioPadres", "/CambiarContrasena"})
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletUsuario() {
        super();
       
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
			switch (request.getServletPath()) { 
			case "/RegistrarUsuario":
				registrarUsuario(request, response);
				break;
			case "/ListarUsuarioDocente":
				listarUsuarioDocente(request, response);
				break;
			case "/ListarUsuarioPadres":
				listarUsuarioPadres(request, response);
				break;
			case "/CambiarContrasena":
				cambiarContrasena(request, response);
				
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String dni = "";
		String password = "";
		String nombre = "";
		String paterno = "";
		String materno = "";
		String correo = "";
		int perfil = 0;
		
		
		Usuario bean = new Usuario();
		
		try
		{
			UsuarioJDBC dao = new UsuarioJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				dni      = arr.getJSONObject(i).getString("dni");
				password = arr.getJSONObject(i).getString("password");
				nombre   = arr.getJSONObject(i).getString("nombre");
				paterno  = arr.getJSONObject(i).getString("paterno");
				materno  = arr.getJSONObject(i).getString("materno");
				correo   = arr.getJSONObject(i).getString("correo");
				perfil   =  Integer.parseInt(arr.getJSONObject(i).getString("perfil"));
				
				
				bean.setNombreUsuario(dni);
				bean.setPassword(password);
				bean.setNombre(nombre);
				bean.setApe_Pat(paterno);
				bean.setApe_Mat(materno);
				bean.setCorreo(correo);
				bean.setPerfil(perfil);
				
				
				prueba = dao.registrarUsuario(bean);
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE USUARIO correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void listarUsuarioDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			UsuarioJDBC dao = new UsuarioJDBC();
			sb = dao.listarUsuarioDocente();

			if(sb.toString().equals(""))
			{
				respuesta = "vacio";
			}
			else
			{
				respuesta = sb.toString();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		System.out.println("respuesta: " + respuesta);
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void listarUsuarioPadres(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			UsuarioJDBC dao = new UsuarioJDBC();
			sb = dao.listarUsuarioPadres();

			if(sb.toString().equals(""))
			{
				respuesta = "vacio";
			}
			else
			{
				respuesta = sb.toString();
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		System.out.println("respuesta: " + respuesta);
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void cambiarContrasena(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String antigua = request.getParameter("contrasena");
		String nueva   = request.getParameter("nueva");
		System.out.println("Contraseña Antigua: " + antigua);
		int respuesta = 0;

		try {
			UsuarioJDBC dao = new UsuarioJDBC();

			respuesta = dao.cambiarContrasena(antigua, nueva) == true ? 1 : 0;
			
			System.out.println("Respuesta Servlet: " + respuesta);

		} catch (Exception e) {
			
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
		
		
	}

}
