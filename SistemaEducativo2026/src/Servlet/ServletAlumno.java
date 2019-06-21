package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Beans.Alumno;
import Jdbc.AlumnoJDBC;



@WebServlet({"/ListarAlumnoxSeccion", "/BuscarAlumno", "/ListarProgresoAlumno", "/RegistrarAlumno", "/ListarAlumnos", "/ModificarAlumno",
			"/EliminarAlumno"})
public class ServletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ServletAlumno() {
        super();
  
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		try {
			switch (request.getServletPath()) {
			case "/ListarAlumnoxSeccion":
				listarAlumnoxSeccion(request, response);
				break;
			case "/BuscarAlumno":
				buscarAlumno(request, response);
				break;
			case "/ListarProgresoAlumno":
				listarprogreso(request, response);
				break;
			case "/RegistrarAlumno":
				registrarAlumno(request, response);
				break;
			case "/ListarAlumnos":
				listarAlumnos(request, response);
				break;
			case "/ModificarAlumno":
				modificarAlumno(request, response);
				break;
			case "/EliminarAlumno":
				eliminarAlumno(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}

	}
	
	private void listarAlumnoxSeccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String seccion = request.getParameter("seccion");

		

		try {
			 	AlumnoJDBC dao = new AlumnoJDBC();
			 	List<Alumno> lista = dao.alumnoxseccion(seccion);
			 	
			 	if (lista != null) {
			 		for (Alumno bean : lista) {
			 			sb.append(bean.getIdAlumno() + "=" + bean.getNombre() + "=" + bean.getApellidoPat() + "=" + bean.getApellidoMat() + "$");
			 		}
			 	} else {
			 			sb.append("_");
			 		}
			}catch(Exception e){
					System.out.println("Error : "+e.getMessage());
					e.printStackTrace();
			}
		
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
		
	}
	
	private void buscarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String id = request.getParameter("idAlumno");
		
		Alumno bean = new Alumno();
		AlumnoJDBC dao = new AlumnoJDBC();
		
		bean = dao.buscarAlumnoId(id);
		
		String idAlumno = bean.getIdAlumno();
		String nombres = bean.getNombre();
		String apellidopat = bean.getApellidoPat();
		String apellidoMat = bean.getApellidoMat();
		String seccion = bean.getSeccion();
		
		request.setAttribute("idAlumno", idAlumno);
		request.setAttribute("nombres", nombres);
		request.setAttribute("apellidopat", apellidopat);
		request.setAttribute("apellidoMat", apellidoMat);
		request.setAttribute("seccion", seccion);
		
		System.out.println("Se realizo la busqueda del alumno" + "-" + idAlumno + "-" + nombres + "-" + apellidopat + "-" + apellidoMat + "-" + seccion);
		RequestDispatcher rd = request.getRequestDispatcher("comentarioObservaciones.jsp");
    	rd.forward(request, response);
		
		
	}
	
	private void listarprogreso(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String curso= request.getParameter("curso");
		String seccion = request.getParameter("seccion");
		int periodo = Integer.parseInt(request.getParameter("periodo"));
		int anio    = Integer.parseInt(request.getParameter("anio"));
		
		StringBuilder sb = new StringBuilder("");
		
		try {
			
			AlumnoJDBC dao = new AlumnoJDBC();
			sb = dao.listarProgresoAlumno(seccion, curso, periodo, anio);
			System.out.println("Se encontro los progresos de los alumnos");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(sb.toString());
	
	}
	
	private void registrarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
	
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String nombre = "";
		String paterno = "";
		String materno = "";
		String dni = "";
		int edad = 0;
		String fechanac = "";
		String correo = "";
		String seccion = "";
		String codPadre = "";
		
		
		Alumno bean = new Alumno();
		
		try
		{
			AlumnoJDBC dao = new AlumnoJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				nombre   = arr.getJSONObject(i).getString("nombre");
				paterno  = arr.getJSONObject(i).getString("paterno");
				materno  = arr.getJSONObject(i).getString("materno");
				dni      = arr.getJSONObject(i).getString("dni");
				edad     = Integer.parseInt(arr.getJSONObject(i).getString("edad"));
				fechanac = arr.getJSONObject(i).getString("nacimiento");
				correo   = arr.getJSONObject(i).getString("correo");
				seccion  = arr.getJSONObject(i).getString("seccion");
				codPadre = arr.getJSONObject(i).getString("padre");

				
				bean.setNombre(nombre);
				bean.setApellidoPat(paterno);
				bean.setApellidoMat(materno);
				bean.setDni(dni);
				bean.setEdad(edad);
				bean.setFechaNac(fechanac);
				bean.setCorreo(correo);
				bean.setSeccion(seccion);
				bean.setCodPadre(codPadre);

				
				prueba = dao.registrarAlumnos(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	private void listarAlumnos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			AlumnoJDBC dao = new AlumnoJDBC();
			sb = dao.listarAlumnos(); 

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
	
	private void modificarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nombre  = request.getParameter("nombre");
		System.out.println("nombre: " + nombre);
		String paterno  = request.getParameter("paterno");
		System.out.println("apepat: " + paterno);
		String materno  = request.getParameter("materno");
		System.out.println("apemat: " + materno);
		String fecha  = request.getParameter("fecha");
		System.out.println("fecha nac: " + fecha);
		String dni  = request.getParameter("dni");
		System.out.println("dni: " + dni);
		int  edad      = Integer.parseInt(request.getParameter("edad"));
		System.out.println("edad: " + edad);
		String correo   = request.getParameter("correo");
		System.out.println("correo: " + correo);
		String seccion = request.getParameter("seccion");
		System.out.println("Seccion: " + seccion);
		String codigo = request.getParameter("codigo");
		System.out.println("Codigo: " + codigo);
		
		Alumno bean = new Alumno();
		
		bean.setNombre(nombre);
		bean.setApellidoPat(paterno);
		bean.setApellidoMat(materno);
		bean.setFechaNac(fecha);
		bean.setCorreo(correo);
		bean.setDni(dni);
		bean.setEdad(edad);
		bean.setSeccion(seccion);
		bean.setIdAlumno(codigo);

		int respuesta = 0;

		try {
			
			AlumnoJDBC dao = new AlumnoJDBC();
			respuesta = dao.modificarAlumno(bean) == true ? 1 : 0;
		} catch(Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			System.out.println("Respuesta: " + respuesta);
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void eliminarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codigo");
		System.out.println("Codigo Alumno es: " + codigo);

		int respuesta = 0;
		
		try 
		{
			AlumnoJDBC dao = new AlumnoJDBC();
			respuesta = dao.eliminarAlumno(codigo) == true ? 1 : 0;
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}

}
