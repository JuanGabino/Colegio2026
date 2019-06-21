package Util;

import java.io.OutputStream;
import java.sql.ResultSet;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class ReporteObservaciones_PDF {

	public boolean generarReporteObservaciones(String seccion, String docente, String mes, String anio, 
												String nomdocente, String nomseccion, String nommes, String nomano, OutputStream out) {
		Document documento = null;
		
		try
		{
			Conexion con = new Conexion();
			String sql = "select o.idObservaciones, o.observacion, a.nombre, a.apellidoPat, a.apellidoMat, s.grado, c.asignatura, o.fecha_Registro \r\n" + 
					"from observaciones o, alumnos a, secciones s, cursos c where o.idAlumno = a.idAlumno and  s.idSeccion = o.seccion and  \r\n" + 
					"o.curso = c.idCurso and o.seccion='"+seccion+"' and o.idDocente='"+docente+"' and month(o.fecha_Registro) =" +mes+ " and year(o.fecha_Registro) ="+anio+";";
			
			ResultSet rs = con.executeQuery(sql);

			System.out.println("El query  es : " + sql);
			
			if(con != null) 
			{
				documento = new Document();
				PdfWriter.getInstance(documento, out);

				documento.open();
				
				//IMAGEN DEL COLEGIO
				Paragraph par1 = new Paragraph();
				Paragraph par2 = new Paragraph();
				Image imagenes = Image.getInstance("https://i.ibb.co/qD03XVb/insignia-2026.jpg");
				imagenes.setAlignment(Element.ALIGN_CENTER);
				imagenes.scaleToFit(150,150);
				documento.add(imagenes);
				
				//TITULO DEL PDF
				Font fontitulo = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLACK);
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase("I.E COLEGIO 2026 SAN DIEGO", fontitulo));
				par1.setAlignment(Element.ALIGN_CENTER);
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase("OBSERVACIONES MENSUALES", fontitulo));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase("Periodo: " + nommes+"-"+nomano, fontitulo));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				documento.add(par1);
				
				par2.add(new Phrase("Docente: " + nomdocente, fontitulo));
				par2.setAlignment(Element.ALIGN_LEFT);
				par2.add(new Phrase(Chunk.NEWLINE));
				par2.add(new Phrase(Chunk.NEWLINE));
				par2.add(new Phrase("Sección: " + nomseccion, fontitulo));
				par2.setAlignment(Element.ALIGN_LEFT);
				par2.add(new Phrase(Chunk.NEWLINE));
				par2.add(new Phrase(Chunk.NEWLINE));
				par2.add(new Phrase(Chunk.NEWLINE));
				documento.add(par2);
				
				
				PdfPTable tabla = new PdfPTable(6);
				tabla.setWidths(new float[] { 4, 10, 6, 6, 5, 5 });
				
				tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
				PdfPCell celda5 = new PdfPCell(new Paragraph("Código", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda5.setBackgroundColor(BaseColor.BLUE);
				PdfPCell celda6 = new PdfPCell(new Paragraph("Observación", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda6.setBackgroundColor(BaseColor.BLUE);
				PdfPCell celda7 = new PdfPCell(new Paragraph("Alumno(a)", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda7.setBackgroundColor(BaseColor.BLUE);
				PdfPCell celda10 = new PdfPCell(new Paragraph("Grado", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda10.setBackgroundColor(BaseColor.BLUE);
				PdfPCell celda11 = new PdfPCell(new Paragraph("Curso", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda11.setBackgroundColor(BaseColor.BLUE);
				PdfPCell celda12 = new PdfPCell(new Paragraph("Fecha", FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
				celda12.setBackgroundColor(BaseColor.BLUE);
			
				Font fontcuerpo = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
				
				tabla.addCell(celda5).setHorizontalAlignment(Element.ALIGN_CENTER);
				tabla.addCell(celda6).setHorizontalAlignment(Element.ALIGN_CENTER);
				tabla.addCell(celda7).setHorizontalAlignment(Element.ALIGN_CENTER);
				tabla.addCell(celda10).setHorizontalAlignment(Element.ALIGN_CENTER);
				tabla.addCell(celda11).setHorizontalAlignment(Element.ALIGN_CENTER);
				tabla.addCell(celda12).setHorizontalAlignment(Element.ALIGN_CENTER);
				
				while(rs.next())
				{
					
					PdfPCell uno = new PdfPCell(new Phrase(rs.getString(1), fontcuerpo));
					PdfPCell dos = new PdfPCell(new Phrase(rs.getString(2), fontcuerpo));
					PdfPCell tres = new PdfPCell(new Phrase(rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(5), fontcuerpo));
					PdfPCell seis = new PdfPCell(new Phrase(rs.getString(6), fontcuerpo));
					PdfPCell siete = new PdfPCell(new Phrase(rs.getString(7), fontcuerpo));
					PdfPCell ocho = new PdfPCell(new Phrase(rs.getString(8), fontcuerpo));
					
					tabla.addCell(uno);
					tabla.addCell(dos).setHorizontalAlignment(Element.ALIGN_CENTER);
					tabla.addCell(tres);
					tabla.addCell(seis);
					tabla.addCell(siete);
					tabla.addCell(ocho);
					

				}
				
				documento.add(tabla);
				
				documento.close();
				System.out.println("Procesando PDF");
			}		
			
		} catch(Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}

		return documento == null ? false : true;
		
	}
}
