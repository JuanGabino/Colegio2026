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

import Beans.AsistenciaPadre;
import Beans.Docentes;
import Beans.TareaDocente;
import Jdbc.AsistenciaPadreJDBC;
import Jdbc.CursoJDBC;
import Jdbc.DocentesJDBC;



@WebServlet({"/RegistrarDocente", "/BuscarDocente", "/BuscarDocentexDni", "/ListarDocentes", "/ModificarDocente", "/EliminarDocente", 
				"/ListarDocentexCodigo", "/ListarDocenteSeccion", "/ListarDocenteComunicado", "/RegistrarTareaDocente", "/ListarTarea"})
public class ServletDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletDocente() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		try {
			switch (request.getServletPath()) { //jala el nombre del ervlet
			case "/RegistrarDocente":
				registrarDocente(request, response);
				break;
			case "/BuscarDocente":
				buscarDocente(request, response);
				break;
			case "/ActualizarDocente":
				registrarDocente(request, response);
				break;
			case "/EliminarDocente":
				eliminarDocente(request, response);
				break;
			case "/BuscarDocentexDni":
				buscarDocentexDni(request, response);
				break;
			case "/ListarDocentes":
				listarDocentes(request, response);
				break;
			case "/ModificarDocente":
				modificarDocente(request, response);
				break;
			case "/ListarDocentexCodigo":
				listarDocentexcodigo(request, response);
				break;
			case "/ListarDocenteSeccion":
				listarDocenteSeccion(request, response);
				break;
			case "/ListarDocenteComunicado":
				listarDocenteComunicado(request, response);
				break;
			case "/RegistrarTareaDocente":
				registrarTareaDocente(request, response);
				break;
			case "/ListarTarea":
				listarTarea(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
	
	}
	
	private void registrarDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String numdoc = "";
		String nombre = "";
		String apellidopat = "";
		String apellidomat = "";
		int edad = 0;
		String turno = "";
		String correo = "";
		String contrato = "";
		String nacimiento = "";
		String publica = "";
		int titulado = 0;
		int magister = 0;
		int doctorado = 0;
		int telefono = 0;
		String nivel = "";
		
		Docentes bean = new Docentes();
		
		try
		{
			DocentesJDBC dao = new DocentesJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				numdoc = arr.getJSONObject(i).getString("dni");
				nombre = arr.getJSONObject(i).getString("nombre");
				apellidopat = arr.getJSONObject(i).getString("paterno");
				apellidomat = arr.getJSONObject(i).getString("materno");
				edad = Integer.parseInt(arr.getJSONObject(i).getString("edad"));
				turno = arr.getJSONObject(i).getString("turno");
				correo = arr.getJSONObject(i).getString("correo");
				contrato = arr.getJSONObject(i).getString("contrato");
				nacimiento = arr.getJSONObject(i).getString("nacimiento");
				publica = arr.getJSONObject(i).getString("publica").equals("SI") ? "SI" : "NO";
				titulado = arr.getJSONObject(i).getString("titulado").equals("SI") ? 1 : 0;
				magister = arr.getJSONObject(i).getString("magister").equals("SI") ? 1 : 0;
				doctorado = arr.getJSONObject(i).getString("doctorado").equals("SI") ? 1 : 0;
				telefono = Integer.parseInt(arr.getJSONObject(i).getString("telefono"));
				nivel = arr.getJSONObject(i).getString("nivel");
				
				
				bean.setDni(numdoc);
				bean.setNombre(nombre);
				bean.setApellidopat(apellidopat);
				bean.setApellidomat(apellidomat);
				bean.setEdad(edad);
				bean.setTurno(turno);
				bean.setCorreo(correo);
				bean.setFechaContrato(contrato);
				bean.setFechaNacimiento(nacimiento);
				bean.setCarreraPublica(publica);
				bean.setTitulado(titulado);
				bean.setMagister(magister);
				bean.setDoctorado(doctorado);
				bean.setTelefono(telefono);
				bean.setNivel(nivel);
				
				prueba = dao.registrarDocente(bean);
				
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE DOCENTES correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void buscarDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nombre = request.getParameter("nombre");
		if (nombre.length() <= 0) {
			nombre = "empty";
		} else {
			nombre = request.getParameter("nombre");
		}
		String apellidopat = request.getParameter("apepat");
		if (apellidopat.length() <= 0) {
			apellidopat = "empty";
		} else {
			apellidopat = request.getParameter("apepat");
		}
		String apellidomat = request.getParameter("apemat");
		if (apellidomat.length() <= 0) {
			apellidomat = "empty";
		} else {
			apellidomat = request.getParameter("apemat");
		}
		String dni = request.getParameter("dni");
		if (dni.length() <= 0) {
			dni = "0";
		} else {
			dni = request.getParameter("dni");
		}
		String respuesta = "";
		try {
			DocentesJDBC dao = new DocentesJDBC();
			Docentes bean = dao.buscarDocente(nombre, apellidopat, apellidomat, dni);
			
			if (bean.getNombre() == null) 
			{
				respuesta = "vacio";
			} 
			else 
			{
				respuesta = bean.getDni()+ " -|" + bean.getNombre()+ " -|" + bean.getApellidopat() + " -|"
						+ bean.getApellidomat() + " -|" + bean.getEdad() + "-|" + bean.getTurno() + "-|"
						+ bean.getCorreo() + "-|" + bean.getFechaContrato() + "-|" + bean.getFechaNacimiento() + "-|"
						+ bean.getCarreraPublica() + "-|" + bean.getTitulado() + "-|" + bean.getMagister()+ "-|"
						+ bean.getDoctorado() + "-|" + bean.getTelefono() + "-|" + bean.getNivel();

			}
		} catch (Exception e) {
			System.out.println("Error : " + e.getMessage());
			e.getMessage();
		}
		System.out.println("respuesta: " + respuesta);
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void buscarDocentexDni(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dni = request.getParameter("dni");
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.buscarDocentexDni(dni);

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
	
	private void listarDocentes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.listarDocente();

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
	
	private void modificarDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dni     = request.getParameter("dni");
		System.out.println("dni: " + dni);
		String nombre  = request.getParameter("nombre");
		System.out.println("nombre: " + nombre);
		String apepat  = request.getParameter("paterno");
		System.out.println("apepat: " + apepat);
		String apemat  = request.getParameter("materno");
		System.out.println("apemat: " + apemat);
		int  edad      = Integer.parseInt(request.getParameter("edad"));
		System.out.println("edad: " + edad);
		String turno   = request.getParameter("turno");
		System.out.println("turno: " + turno);
		String correo  = request.getParameter("correo");
		System.out.println("correo: " + correo);
		String fechaContrato = request.getParameter("contrato");
		System.out.println("contrato: " + fechaContrato);
		String nacimiento = request.getParameter("nacimiento");
		System.out.println("nacimiento: " + nacimiento);
		String carrera = request.getParameter("carrera");
		System.out.println("carrera: " + carrera);
		int titulado   = request.getParameter("titu").equals("SI") ? 1 : 0;
		System.out.println("titulado: " + titulado);
		int magister   = request.getParameter("maes").equals("SI") ? 1 : 0;
		System.out.println("magister: " + magister);
		int doctorado  = request.getParameter("doct").equals("SI") ? 1 : 0;
		System.out.println("doctorado: " + doctorado);
		
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String nivel  = request.getParameter("nivel");

		Docentes bean = new Docentes();

		bean.setDni(dni);
		bean.setNombre(nombre);
		bean.setApellidopat(apepat);
		bean.setApellidomat(apemat);
		bean.setEdad(edad);
		bean.setTurno(turno);
		bean.setCorreo(correo);
		bean.setFechaContrato(fechaContrato);
		bean.setFechaNacimiento(nacimiento);
		bean.setCarreraPublica(carrera);
		bean.setTitulado(titulado);
		bean.setMagister(magister);
		bean.setDoctorado(doctorado);
		bean.setTelefono(telefono);
		bean.setNivel(nivel);
		
		int respuesta = 0;

		try {
			DocentesJDBC dao = new DocentesJDBC();

			respuesta = dao.actualizarDocente(bean) == true ? 1 : 0;

		} catch (Exception e) {
			System.out.println("Error : " + e.getMessage());
			System.out.println("Respuesta: " + respuesta);
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void eliminarDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codigo");
		System.out.println("Codigo es: " + codigo);

		int respuesta = 0;
		
		try 
		{
			DocentesJDBC dao = new DocentesJDBC();
			respuesta = dao.eliminarDocente(codigo) == true ? 1 : 0;
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}
	
	private void listarDocentexcodigo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.buscarDocentexcodigo();

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
	
	private void listarDocenteSeccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo = request.getParameter("codigo");
		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.buscarDocenteSeccion(codigo);

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
	
	private void listarDocenteComunicado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo  = request.getParameter("codigo");
		String seccion = request.getParameter("seccion");
		int fecha      = Integer.parseInt(request.getParameter("fecha"));
		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.listarComunicadoDocente(codigo, seccion, fecha);

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
	
	private void registrarTareaDocente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String area   = "";
		String dni    = "";
		String nombre = "";
		String paterno = "";
		String materno = "";
		String nivel = "";
		String curso = "";
		String tarea = "";
		String inicio = "";
		String fin = "";
		
		TareaDocente bean = new TareaDocente();
		
		try
		{
			DocentesJDBC dao = new DocentesJDBC();
			
			for (int i = 0; i < arr.length(); i++) 
			{
				area    = arr.getJSONObject(i).getString("area");
				dni     = arr.getJSONObject(i).getString("dni");
				nombre  = arr.getJSONObject(i).getString("nombre");
				paterno = arr.getJSONObject(i).getString("paterno");
				materno = arr.getJSONObject(i).getString("materno");
				nivel   = arr.getJSONObject(i).getString("nivel");
				curso   = arr.getJSONObject(i).getString("curso");
				tarea   = arr.getJSONObject(i).getString("tarea");
				inicio  = arr.getJSONObject(i).getString("fechainicio");
				fin     = arr.getJSONObject(i).getString("fechafin");
				
				
				bean.setArea(area);
				bean.setDni(dni);
				bean.setNombre(nombre);
				bean.setPaterno(paterno);
				bean.setMaterno(materno);
				bean.setNivel(nivel);
				bean.setCurso(curso);
				bean.setTarea(tarea);
				bean.setInicio(inicio);
				bean.setFin(fin);
	
				prueba = dao.registrarTareaDocente(bean);
			}
			
			respuesta = prueba == true ? "1" : "0";
			System.out.println("respuesta: " + respuesta);
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void listarTarea(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String codigo  = request.getParameter("area");

		String respuesta = "";
		
		try {

			DocentesJDBC dao = new DocentesJDBC();
			sb = dao.listarTarea(codigo);

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
	

}
