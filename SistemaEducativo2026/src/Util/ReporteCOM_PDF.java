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

public class ReporteCOM_PDF {
	
	public boolean generarReporteComunicado(String idcomunicado, OutputStream out) {
		Document documento = null;
		
		try
		{
			Conexion con = new Conexion();
			String sql = "select d.nombre, d.apellidoPat, s.grado, c.fecha_Registro, c.tipo, c.descripcion " + 
					"from comunicado c, docentes d, secciones s where c.idDocente = d.idDocente " + 
					"and s.idSeccion = c.seccion and c.idComunicado = '"+idcomunicado+"';";
			
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
				Image imagenes = Image.getInstance("C:\\Insignia Colegio2026\\2026.jpg");
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
				par1.add(new Phrase("COMUNICADO GENERADO ", fontitulo));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				par1.add(new Phrase(Chunk.NEWLINE));
				documento.add(par1);
				
				while(rs.next())
				{
					
					par2.add(new Phrase("Docente: " + rs.getString(1) + " " + rs.getString(2), fontitulo));
					par2.setAlignment(Element.ALIGN_LEFT);
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase("Sección: " + rs.getString(3), fontitulo));
					par2.setAlignment(Element.ALIGN_LEFT);
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
					par2.add(new Phrase(Chunk.NEWLINE));
					documento.add(par2);
					
					PdfPTable tabla = new PdfPTable(3);
					tabla.setWidths(new float[] { 5, 5, 18 });
					
					tabla.setHorizontalAlignment(Element.ALIGN_CENTER);
					PdfPCell celda4 = new PdfPCell(new Paragraph("Fecha", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
					celda4.setBackgroundColor(BaseColor.BLUE);
					PdfPCell celda5 = new PdfPCell(new Paragraph("Tipo", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
					celda5.setBackgroundColor(BaseColor.BLUE);
					PdfPCell celda6 = new PdfPCell(new Paragraph("Comunicado", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
					celda6.setBackgroundColor(BaseColor.BLUE);
				
					tabla.addCell(celda4).setHorizontalAlignment(Element.ALIGN_CENTER);;
					tabla.addCell(celda5).setHorizontalAlignment(Element.ALIGN_CENTER);;
					tabla.addCell(celda6).setHorizontalAlignment(Element.ALIGN_CENTER);;

					tabla.addCell(rs.getString(4));
					tabla.addCell(rs.getString(5));
					tabla.addCell(rs.getString(6));
					
					documento.add(tabla);
				}
				
				
				documento.close();

			}		
			
		} catch(Exception e)
		{
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}

		return documento == null ? false : true;
		
	}

}
