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
import Beans.Padres;
import Jdbc.AsistenciaPadreJDBC;
import Jdbc.PadresJDBC;


@WebServlet({"/BuscarPadreFamilia", "/RegistrarPadre", "/BuscarPadre", "/ModificarPadre", "/EliminarPadre", "/ListarPadres", 
				"/ListarPadresxSeccion", "/RegistrarAsistenciaPadre", "/BuscarPadrexDNI", "/ReporteAsistencia", "/BuscarAlumnoPadre"})
public class ServletPadre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletPadre() {
        super();
       
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		try {
			switch (request.getServletPath()) {
			
			case "/BuscarPadreFamilia":
				buscarPadreFamilia(request, response);
				break;
			case "/RegistrarPadre":
				registrarPadreFamilia(request, response);
				break;
			case "/BuscarPadre":
				buscarPadre(request, response);
				break;
			case "/ModificarPadre":
				modificarPadre(request, response);
				break;
			case "/EliminarPadre":
				eliminarPadre(request, response);
				break;
			case "/ListarPadres":
				listarPadres(request, response);
				break;
			case "/ListarPadresxSeccion":
				listarPadresxSeccion(request, response);
				break;
			case "/RegistrarAsistenciaPadre":
				registrarAsistenciaPadre(request, response);
				break;
			case "/BuscarPadrexDNI":
				buscarpadrexDni(request, response);
				break;
			case "/ReporteAsistencia":
				reporteAsistencia(request, response);
				break;
			case "/BuscarAlumnoPadre":
				buscarAlumno(request, response);
				break;
		   } 
		}  catch (Exception e) {
			System.out.println("error :" + e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void buscarPadreFamilia(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			PadresJDBC dao = new PadresJDBC();
			sb = dao.buscarPadreFamilia();

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
	
	private void registrarPadreFamilia(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String nombre = "";
		String paternoPadre = "";
		String maternoPadre = "";
		int edad = 0;
		String correo = "";
		String dni = "";
		String direccion = "";
		int telefono = 0;
		String fechanacimiento = "";
		String trabaja = "";
		String ocupacion = "";
		int telefonoTrabajo = 0;
		String direccionTrabajo = "";
		String estado = "";
		String nombreMadre = "";
		String paternoMadre = "";
		String maternoMadre = "";
		String dniMadre = "";
		int edadMadre = 0;
		String fechaMadre = "";
		String correoMadre = "";
		String ocupacionMadre = "";
		int telefonoMadre = 0;
		int casaPropia = 0;
		int cantidadPersonas = 0;
		int cantidadHijos = 0;
		
		Padres bean = new Padres();
		
		try
		{
			PadresJDBC dao = new PadresJDBC();
			
			for (int i = 0; i < arr.length(); i++) {
				
				nombre = arr.getJSONObject(i).getString("nombre");
				paternoPadre = arr.getJSONObject(i).getString("paterno");
				maternoPadre = arr.getJSONObject(i).getString("materno");
				edad = Integer.parseInt(arr.getJSONObject(i).getString("edad"));
				correo = arr.getJSONObject(i).getString("correo");
				dni = arr.getJSONObject(i).getString("dni");
				direccion =  arr.getJSONObject(i).getString("direccion");
				telefono = Integer.parseInt(arr.getJSONObject(i).getString("telefono"));
				fechanacimiento = arr.getJSONObject(i).getString("fechanac");
				trabaja = arr.getJSONObject(i).getString("trabaja").equals("SI") ? "SI" : "NO";
				ocupacion = arr.getJSONObject(i).getString("ocupacion");
				telefonoTrabajo = Integer.parseInt(arr.getJSONObject(i).getString("telefonoTrabajo"));
				direccionTrabajo = arr.getJSONObject(i).getString("direccionTrabajo");
				estado = arr.getJSONObject(i).getString("estado");
				nombreMadre = arr.getJSONObject(i).getString("nombreMadre");
				paternoMadre = arr.getJSONObject(i).getString("paternoMadre");
				maternoMadre = arr.getJSONObject(i).getString("maternoMadre");
				dniMadre = arr.getJSONObject(i).getString("dniMadre");
				edadMadre = Integer.parseInt(arr.getJSONObject(i).getString("edadMadre"));
				fechaMadre = arr.getJSONObject(i).getString("fechaMadre");
				correoMadre = arr.getJSONObject(i).getString("correoMadre");
				ocupacionMadre = arr.getJSONObject(i).getString("ocupacionMadre");
				telefonoMadre = Integer.parseInt(arr.getJSONObject(i).getString("telefonoMadre"));
				casaPropia = arr.getJSONObject(i).getString("casa").equals("SI") ? 1 : 0;;
				cantidadPersonas = Integer.parseInt(arr.getJSONObject(i).getString("personas"));
				cantidadHijos = Integer.parseInt(arr.getJSONObject(i).getString("hijos"));
				
				bean.setNombre(nombre);
				bean.setApellidopaterno(paternoPadre);
				bean.setApellidomaterno(maternoPadre);
				bean.setEdad(edad);
				bean.setCorreo(correo);
				bean.setDni(dni);
				bean.setDireccion(direccion);
				bean.setTelefono(telefono);
				bean.setFechanacimiento(fechanacimiento);
				bean.setTrabaja(trabaja);
				bean.setOcupacion(ocupacion);
				bean.setTelefonoTrabajo(telefonoTrabajo);
				bean.setDireccionTrabajo(direccionTrabajo);
				bean.setEstadoCivil(estado);
				bean.setNombreMadre(nombreMadre);
				bean.setApepaternoMadre(paternoMadre);
				bean.setApematernoMadre(maternoMadre);
				bean.setDniMadre(dniMadre);
				bean.setEdadMadre(edadMadre);
				bean.setFechaMadre(fechaMadre);
				bean.setCorreoMadre(correoMadre);
				bean.setOcupacionMadre(ocupacionMadre);
				bean.setTelefonoMadre(telefonoMadre);
				bean.setCasaPropia(casaPropia);
				bean.setCantidadCasa(cantidadPersonas);
				bean.setCantidadHijos(cantidadHijos);

				prueba = dao.registrarPadres(bean);	
				
			}
			
			respuesta = prueba == true ?   "1" : "0";
			
			System.out.println("respuesta: " + respuesta);
			System.out.println("Se realizo el Servlet REGISTRO DE PADRES DE FAMILIA correctamente");
			response.setContentType("text/plain");
			response.getWriter().write(respuesta);
			
		} catch(Exception e) {
			
			System.out.println("Error : "+e.getMessage());
			e.printStackTrace();
		}
			
	}
	
	private void buscarPadre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dnipadre = request.getParameter("dnipat");
		if (dnipadre.length() <= 0) {
			dnipadre = "empty";
		} else {
			dnipadre = request.getParameter("dnipat");
		}
		String dnimadre = request.getParameter("dnimat");
		if (dnimadre.length() <= 0) {
			dnimadre = "empty";
		} else {
			dnimadre= request.getParameter("dnimat");
		}
		
		String respuesta = "";
		
		try {
			PadresJDBC dao = new PadresJDBC();
			Padres bean = dao.buscarPadre(dnipadre, dnimadre);
			
			if(bean.getNombre() == null)
			{
				respuesta = "vacio";
			}
			else
			{
				respuesta = bean.getNombre() + " -|" + bean.getApellidopaterno() + " -|" + bean.getApellidomaterno() + " -|" + bean.getEdad() + " -|" + bean.getCorreo() + " -|" + bean.getDni() + " -|" +
						 bean.getDireccion() + " -|" + bean.getTelefono() + " -|" + bean.getFechanacimiento() + " -|"+ bean.getTrabaja() + " -|" + bean.getOcupacion() + " -|" + bean.getTelefonoTrabajo() + " -|" +
						bean.getDireccionTrabajo() + " -|" + bean.getEstadoCivil() + " -|" + bean.getNombreMadre() + " -|" +bean.getApepaternoMadre() + " -|" + bean.getApematernoMadre() + " -|" + bean.getDniMadre() + " -|" +
						 bean.getEdadMadre() + " -|" + bean.getFechaMadre() + " -|" + bean.getCorreoMadre() + " -|" + bean.getOcupacionMadre() + " -|" + bean.getTelefonoMadre() + " -|" + bean.getCasaPropia() + " -|" + 
						bean.getCantidadCasa() + " -|" +bean.getCantidadHijos();
				
			}

		} catch(Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.getMessage();
		}
		
		System.out.println("respuesta: " + respuesta);
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
		
	}
	
	private void modificarPadre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nombre  = request.getParameter("nombre");
		System.out.println("nombre: " + nombre);
		String apepat  = request.getParameter("paterno");
		System.out.println("apepat: " + apepat);
		String apemat  = request.getParameter("materno");
		System.out.println("apemat: " + apemat);
		int  edad      = Integer.parseInt(request.getParameter("edad"));
		System.out.println("edad: " + edad);
		String correo   = request.getParameter("correo");
		System.out.println("correo: " + correo);
		String direccion  = request.getParameter("direccion");
		System.out.println("direccion: " + direccion);
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		System.out.println("telefono: " + telefono);
		String nacimiento = request.getParameter("nacimiento");
		System.out.println("nacimiento: " + nacimiento);
		
		String trabaja = request.getParameter("trabaja").equals("SI") ? "SI" : "NO";
		System.out.println("trabaja: " + trabaja);
		String ocupacion = request.getParameter("ocupacion");
		System.out.println("ocupacion: " + ocupacion);
		
		int telefonotrabajo = Integer.parseInt(request.getParameter("telefonotrabajo"));
		
		System.out.println("telefono-trabajo: " + telefonotrabajo);
		
		String lugar = request.getParameter("lugar");
		System.out.println("lugar: " + lugar);
		String estado = request.getParameter("estado");
		System.out.println("estado: " + estado);
		
		String nommadre = request.getParameter("nombremadre");
		System.out.println("nombre-madre: " + nommadre);
		String patmadre = request.getParameter("paternomadre");
		System.out.println("paterno-madre: " + patmadre);
		String matmadre = request.getParameter("maternomadre");
		System.out.println("materno-madre: " + matmadre);
		int edadmadre = Integer.parseInt(request.getParameter("edadmadre"));
		System.out.println("edad-madre: " + edadmadre);
		
		String nacimientomadre = request.getParameter("nacimientomadre");
		System.out.println("nacimiento-madre: " + nacimientomadre);
		
		String correomadre = request.getParameter("correomadre");
		System.out.println("correo-madre: " + correomadre);
		
		String ocupacionmadre = request.getParameter("ocupacionmadre");
		System.out.println("ocupacion-madre: " + ocupacionmadre);
		
		int telefonomadre = Integer.parseInt(request.getParameter("telefonomadre"));
		System.out.println("telefono-madre: " + telefonomadre);
		
		
		int casapropia   = request.getParameter("casapropia").equals("SI") ? 1 : 0;
		System.out.println("casa-propia: " + casapropia);
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		System.out.println("cantidad: " + cantidad);
		int hijos  = Integer.parseInt(request.getParameter("hijos"));
		System.out.println("hijos: " + hijos);

		String dnipadre = request.getParameter("dnipadre");
		System.out.println("dni-padre: " + dnipadre);
		
		String dnimadre = request.getParameter("dnimadre");
		System.out.println("dni-madre: " + dnimadre);
		
		Padres bean = new Padres();
		
		bean.setNombre(nombre);
		bean.setApellidopaterno(apepat);
		bean.setApellidomaterno(apemat);
		bean.setEdad(edad);
		bean.setCorreo(correo);
		bean.setDireccion(direccion);
		bean.setTelefono(telefono);
		bean.setFechanacimiento(nacimiento);
		bean.setTrabaja(trabaja);
		bean.setOcupacion(ocupacion);
		bean.setTelefonoTrabajo(telefonotrabajo);
		bean.setDireccionTrabajo(lugar);
		bean.setEstadoCivil(estado);
		
		bean.setNombreMadre(nommadre);
		bean.setApepaternoMadre(patmadre);
		bean.setApematernoMadre(matmadre);
		bean.setEdadMadre(edadmadre);
		bean.setFechaMadre(nacimientomadre);
		bean.setCorreoMadre(correomadre);
		bean.setOcupacionMadre(ocupacionmadre);
		bean.setTelefonoMadre(telefonomadre);
		bean.setCasaPropia(casapropia);
		bean.setCantidadCasa(cantidad);
		bean.setCantidadHijos(hijos);
		bean.setDni(dnipadre);
		bean.setDniMadre(dnimadre);
		
		int respuesta = 0;

		try {
			
			PadresJDBC dao = new PadresJDBC();
			respuesta = dao.modificarPadre(bean) == true ? 1 : 0;
		} catch(Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			System.out.println("Respuesta: " + respuesta);
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);
	}
	
	private void eliminarPadre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String codigo = request.getParameter("codigo");
		System.out.println("Codigo es: " + codigo);

		int respuesta = 0;
		
		try 
		{
			PadresJDBC dao = new PadresJDBC();
			respuesta = dao.eliminarPadre(codigo) == true ? 1 : 0;
			
		} catch (Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(respuesta);

	}
	
	private void listarPadres(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			PadresJDBC dao = new PadresJDBC();
			sb = dao.listarPadre();

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
	
	private void listarPadresxSeccion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String seccion = request.getParameter("seccion");
		System.out.println("seccion: " +seccion);
		String respuesta = "";
		
		try {

			PadresJDBC dao = new PadresJDBC();
			sb = dao.buscarPadreFamiliaSeccion(seccion);

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
	
	private void registrarAsistenciaPadre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, JSONException {
		
		boolean prueba = false;
		String respuesta = "0";
		
		String jsonData = request.getParameter("objetojson");
		JSONObject obj = new JSONObject(jsonData);
		JSONArray arr = obj.getJSONArray("linea");
		
		String fecha = "";
		String padre = "";
		String estado = "";
		String seccion = "";
		String docente = "";
		
		AsistenciaPadre bean = new AsistenciaPadre();
		
		try
		{
			AsistenciaPadreJDBC dao = new AsistenciaPadreJDBC();
			
			for (int i = 0; i < arr.length(); i++) 
			{
				fecha = arr.getJSONObject(i).getString("fecha");
				padre = arr.getJSONObject(i).getString("padre");
				estado = arr.getJSONObject(i).getString("estado");
				seccion = arr.getJSONObject(i).getString("seccion");
				docente = arr.getJSONObject(i).getString("docente");
				
				bean.setFecha(fecha);
				bean.setIdPadre(padre);
				bean.setEstado(estado);
				bean.setSeccion(seccion);
				bean.setDocente(docente);
				
				prueba = dao.registrarAsistenciaPadre(bean);
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
	
	private void buscarpadrexDni(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String dnipadre = request.getParameter("dni1");
		
		if (dnipadre.length() <= 0) {
			
			dnipadre = "empty";
			
		} else {
			
			dnipadre = request.getParameter("dni1");
		}
		
		String dnimadre = request.getParameter("dni2");
		
		if (dnimadre.length() <= 0) {
			
			dnimadre = "empty";
			
			
		} else {
			
			dnimadre= request.getParameter("dni2");
		}
		
		StringBuilder sb = new StringBuilder("");
		String respuesta = "";
		
		try {

			PadresJDBC dao = new PadresJDBC();
			sb = dao.buscarPadreFamiliaxDNI(dnipadre, dnimadre);

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
	
	private void reporteAsistencia(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String docente = request.getParameter("docente");
		int mes	   	   = Integer.parseInt(request.getParameter("mes"));
		String seccion = request.getParameter("seccion");
		String respuesta = "";
		
		try {

			AsistenciaPadreJDBC dao = new AsistenciaPadreJDBC();
			sb = dao.listarAsistenciaPadres(docente, seccion, mes);

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
	
	private void buscarAlumno(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StringBuilder sb = new StringBuilder("");
		String dni = request.getParameter("dni");
		String respuesta = "";
		
		try {

			PadresJDBC dao = new PadresJDBC();
			sb = dao.buscarAlumnos(dni);
			
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
