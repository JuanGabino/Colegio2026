package Jdbc;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.Perfil;
import Util.Conexion;

public class PerfilJDBC {

	public List<Perfil> listarPerfil(){
		
		List<Perfil> lista = new ArrayList<Perfil>();
		
		try{
			Conexion con = new Conexion();
			String sql = "select idPerfil, nombre from perfil;";
			System.out.println("consulta :"+sql);
			
			ResultSet rs = con.executeQuery(sql);
			
			while(rs.next()){

				Perfil bean = new Perfil();
				bean.setIdperfil(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				lista.add(bean);
			}
			
			System.out.println("lista:"+lista);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return lista;
	}
}
