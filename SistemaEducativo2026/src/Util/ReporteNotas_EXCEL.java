package Util;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import Util.Conexion;

public class ReporteNotas_EXCEL {
	
	public boolean generarExcelNotas(String seccion, String curso, String periodo, String anio) {
		
		boolean flag = false;
		
		File archivoXLS = null;
		try {
			Conexion con = new Conexion();
			String query = "select a.idAlumno, a.nombre, a.apellidoPat, a.apellidoMat, c.P1, c.P2, c.P3, c.PromedioPractica, c.T1, c.T2, c.T3, " + 
					"c.PromedioTarea, c.EX1, c.EX2, c.PromedioFinal from alumnos as a inner join calificaciones as c on a.idAlumno=c.idAlumno " + 
					"inner join cursos as cu on c.curso = cu.idCurso inner join periodo as p on c.periodo = p.idPeriodo inner join anioescolar as an " + 
					"on c.anio = an.idAnio " + 
					"where c.seccion ='"+seccion+"' and cu.asignatura='"+curso+"' and p.descripcion = '"+periodo+"' and an.Anio = '"+anio+"';";
			
			ResultSet rs = con.executeQuery(query);
			System.out.println("Query " + query);

			String rutaArchivo = System.getProperty("user.home") + "/Desktop/ReporteNotas.xls";		
			archivoXLS = new File(rutaArchivo);

			System.out.println("Entró al try, la ruta es " + rutaArchivo);

			if (archivoXLS.exists()) {
				archivoXLS.delete();
				archivoXLS.createNewFile();
			}

			Workbook libro = new HSSFWorkbook();
			FileOutputStream archivo = new FileOutputStream(archivoXLS);
			Sheet hoja = libro.createSheet("Reporte Notas -" + seccion);
			hoja.setDisplayGridlines(false);

			Row fila = hoja.createRow(1);

			System.out.println("Se están creando filas y columnas");

			HSSFFont fuente = (HSSFFont) libro.createFont();
			HSSFCellStyle estiloCelda = (HSSFCellStyle) libro.createCellStyle();
			HSSFCellStyle centrado = (HSSFCellStyle) libro.createCellStyle();
			HSSFCellStyle cabecera = (HSSFCellStyle) libro.createCellStyle();
			HSSFCellStyle titulo = (HSSFCellStyle) libro.createCellStyle();

			// Aunque no es necesario podemos establecer estil<s<sos a las celdas.
			// Primero, establecemos el tipo de fuente

			fuente.setFontHeightInPoints((short) 9);
			fuente.setFontName(fuente.FONT_ARIAL);
			fuente.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			cabecera.setFont(fuente);
			cabecera.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			cabecera.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			cabecera.setBottomBorderColor((short) 0);
			cabecera.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			cabecera.setLeftBorderColor((short) 0);
			cabecera.setBorderRight(HSSFCellStyle.BORDER_THIN);
			cabecera.setRightBorderColor((short) 0);
			cabecera.setBorderTop(HSSFCellStyle.BORDER_THIN);
			cabecera.setTopBorderColor((short) 0);

			// Estilo de titulo
			HSSFFont fuenteca = (HSSFFont) libro.createFont();
			fuenteca.setFontHeightInPoints((short) 11);
			fuenteca.setFontName(fuenteca.FONT_ARIAL);
			fuenteca.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

			titulo.setFont(fuenteca);
			titulo.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		
			//AGREGA COLUMNAS CTMRE
			
			hoja.setColumnWidth(1, 5000);
			hoja.setColumnWidth(2, 5000);
			hoja.setColumnWidth(3, 5000);
			hoja.setColumnWidth(4, 5000);
			hoja.setColumnWidth(5, 5000);		
			hoja.setColumnWidth(6, 5000);
			hoja.setColumnWidth(7, 5000);
			hoja.setColumnWidth(8, 5000);
			hoja.setColumnWidth(9, 5000);
			hoja.setColumnWidth(10, 5000);
			hoja.setColumnWidth(11, 5000);
			hoja.setColumnWidth(12, 5000);
			hoja.setColumnWidth(13, 5000);
			hoja.setColumnWidth(14, 5000);
			hoja.setColumnWidth(15, 5000);
		
			// También, podemos establecer bordes...

			centrado.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			centrado.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			centrado.setBottomBorderColor((short) 0);
			centrado.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			centrado.setLeftBorderColor((short) 0);
			centrado.setBorderRight(HSSFCellStyle.BORDER_THIN);
			centrado.setRightBorderColor((short) 0);
			centrado.setBorderTop(HSSFCellStyle.BORDER_THIN);
			centrado.setTopBorderColor((short) 0);

			estiloCelda.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			estiloCelda.setBottomBorderColor((short) 0);
			estiloCelda.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			estiloCelda.setLeftBorderColor((short) 0);
			estiloCelda.setBorderRight(HSSFCellStyle.BORDER_THIN);
			estiloCelda.setRightBorderColor((short) 0);
			estiloCelda.setBorderTop(HSSFCellStyle.BORDER_THIN);
			estiloCelda.setTopBorderColor((short) 0);

			// TItulo

			hoja.addMergedRegion(CellRangeAddress.valueOf("F2:I2"));
			hoja.addMergedRegion(CellRangeAddress.valueOf("F3:I3"));
			hoja.addMergedRegion(CellRangeAddress.valueOf("F4:I4"));
			
			Cell celda01 = fila.createCell(5);
			celda01.setCellStyle(titulo);
			celda01.setCellValue("REPORTE DE NOTAS SECCION: "  + seccion);
			fila = hoja.createRow(2);
			Cell celda02 = fila.createCell(5);
			celda02.setCellStyle(titulo);
			celda02.setCellValue("Periodo: " + periodo + "-" + anio);
			fila = hoja.createRow(3);
			Cell celda03 = fila.createCell(5);
			celda03.setCellStyle(titulo);
			celda03.setCellValue("Curso: "+curso);
			
			// Cabecera
			
			fila = hoja.createRow(6);
			Cell celda2 = fila.createCell(1);
			celda2.setCellStyle(cabecera);
			celda2.setCellValue("Id Alumno");

			Cell celda3 = fila.createCell(2);
			celda3.setCellStyle(cabecera);
			celda3.setCellValue("Nombre");

			Cell celda4 = fila.createCell(3);
			celda4.setCellStyle(cabecera);
			celda4.setCellValue("Apellido Paterno");

			Cell celda5 = fila.createCell(4);
			celda5.setCellStyle(cabecera);
			celda5.setCellValue("Apellido Materno");

			Cell celda6 = fila.createCell(5);
			celda6.setCellStyle(cabecera);
			celda6.setCellValue("Práctica 1");
			
			Cell celda7 = fila.createCell(6);
			celda7.setCellStyle(cabecera);
			celda7.setCellValue("Práctica 2");
			
			
			Cell celda8 = fila.createCell(7);
			celda8.setCellStyle(cabecera);
			celda8.setCellValue("Práctica 3");
			
			Cell celda9 = fila.createCell(8);
			celda9.setCellStyle(cabecera);
			celda9.setCellValue("Promedio Práctica");
			
			Cell celda11 = fila.createCell(9);
			celda11.setCellStyle(cabecera);
			celda11.setCellValue("Tarea 1");
			
			Cell celda12 = fila.createCell(10);
			celda12.setCellStyle(cabecera);
			celda12.setCellValue("Tarea 2");
			
			Cell celda13 = fila.createCell(11);
			celda13.setCellStyle(cabecera);
			celda13.setCellValue("Tarea 3");
			
			Cell celda14 = fila.createCell(12);
			celda14.setCellStyle(cabecera);
			celda14.setCellValue("Promedio de Tarea");
			
			Cell celda15 = fila.createCell(13);
			celda15.setCellStyle(cabecera);
			celda15.setCellValue("Examen 1");
			
			Cell celda16= fila.createCell(14);
			celda16.setCellStyle(cabecera);
			celda16.setCellValue("Examen 2");
			
			Cell celda18= fila.createCell(15);
			celda18.setCellStyle(cabecera);
			celda18.setCellValue("Promedio Final");
			
			int i = 7;
			while (rs.next()) {

				
				fila = (HSSFRow) hoja.createRow(i);
				
				
				Cell celda1_1 = fila.createCell(1);
				celda1_1.setCellStyle(estiloCelda);
				celda1_1.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_1.setCellValue(rs.getString(1));

				Cell celda1_2 = fila.createCell(2);
				celda1_2.setCellStyle(estiloCelda);
				celda1_2.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_2.setCellValue(rs.getString(2));
				
				Cell celda1_3 = fila.createCell(3);
				celda1_3.setCellStyle(estiloCelda);
				celda1_3.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_3.setCellValue(rs.getString(3));
				
				Cell celda1_4 = fila.createCell(4);
				celda1_4.setCellStyle(estiloCelda);
				celda1_4.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_4.setCellValue(rs.getString(4));
				
				Cell celda1_5 = fila.createCell(5);
				celda1_5.setCellStyle(estiloCelda);
				celda1_5.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_5.setCellValue(rs.getString(5));
				
				Cell celda1_6 = fila.createCell(6);
				celda1_6.setCellStyle(estiloCelda);
				celda1_6.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_6.setCellValue(rs.getString(6));
				
				Cell celda1_7 = fila.createCell(7);
				celda1_7.setCellStyle(estiloCelda);
				celda1_7.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_7.setCellValue(rs.getString(7));
//				
//				Cell celda1_7 = fila.createCell(7);
//				celda1_7.setCellStyle(estiloCelda);
//				celda1_7.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_7.setCellValue(rs.getString(7));
					
				
//				if(rs.getInt(8) == 1) {
//					Cell celda1_8 = fila.createCell(8);
//					celda1_8.setCellStyle(estiloCelda);
//					celda1_8.setCellType(HSSFCell.CELL_TYPE_STRING);
//					celda1_8.setCellValue("Sí");
////				}
////				else {
////					Cell celda1_8 = fila.createCell(8);
////					celda1_8.setCellStyle(estiloCelda);
////					celda1_8.setCellType(HSSFCell.CELL_TYPE_STRING);
////					celda1_8.setCellValue("No");
////				}
				
				Cell celda1_8 = fila.createCell(8);
				celda1_8.setCellStyle(estiloCelda);
				celda1_8.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_8.setCellValue(rs.getString(8));
				
			
				
				Cell celda1_9 = fila.createCell(9);
				celda1_9.setCellStyle(estiloCelda);
				celda1_9.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_9.setCellValue(rs.getString(9));
				
				Cell celda1_10 = fila.createCell(10);
				celda1_10.setCellStyle(estiloCelda);
				celda1_10.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_10.setCellValue(rs.getString(10));

				Cell celda1_11 = fila.createCell(11);
				celda1_11.setCellStyle(estiloCelda);
				celda1_11.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_11.setCellValue(rs.getString(11));
				
		
				Cell celda1_12 = fila.createCell(12);
				celda1_12.setCellStyle(estiloCelda);
				celda1_12.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_12.setCellValue(rs.getString(12));
			
//				Cell celda1_12 = fila.createCell(12);
//				celda1_12.setCellStyle(estiloCelda);
//				celda1_12.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_12.setCellValue(rs.getString(12));
				
				Cell celda1_13 = fila.createCell(13);
				celda1_13.setCellStyle(estiloCelda);
				celda1_13.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_13.setCellValue(rs.getString(13));

//				
//				Cell celda1_13 = fila.createCell(13);
//				celda1_13.setCellStyle(estiloCelda);
//				celda1_13.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_13.setCellValue(rs.getString(13));
				

				Cell celda1_14 = fila.createCell(14);
				celda1_14.setCellStyle(estiloCelda);
				celda1_14.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_14.setCellValue(rs.getString(14));

//				Cell celda1_14 = fila.createCell(14);
//				celda1_14.setCellStyle(estiloCelda);
//				celda1_14.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_14.setCellValue(rs.getString(14));
				
//				if(rs.getInt(15) == 1 ) {
//					Cell celda1_15 = fila.createCell(15);
//					celda1_15.setCellStyle(estiloCelda);
//					celda1_15.setCellType(HSSFCell.CELL_TYPE_STRING);
//					celda1_15.setCellValue("Sí");
//				}
//				else {
//					Cell celda1_15 = fila.createCell(15);
//					celda1_15.setCellStyle(estiloCelda);
//					celda1_15.setCellType(HSSFCell.CELL_TYPE_STRING);
//					celda1_15.setCellValue("No");
//					
//				}
				Cell celda1_15 = fila.createCell(15);
				celda1_15.setCellStyle(estiloCelda);
				celda1_15.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_15.setCellValue(rs.getString(15));
				
				
				
//				Cell celda1_28 = fila.createCell(28);
//				celda1_28.setCellStyle(estiloCelda);
//				celda1_28.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_28.setCellValue(rs.getString(28));
				
//				Cell celda1_29 = fila.createCell(29);
//				celda1_29.setCellStyle(estiloCelda);
//				celda1_29.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_29.setCellValue(rs.getString(29));

//				Cell celda1_30 = fila.createCell(30);
//				celda1_30.setCellStyle(estiloCelda);
//				celda1_30.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_30.setCellValue(rs.getString(30));
////				
//				
//				Cell celda1_24 = fila.createCell(24);
//				celda1_24.setCellStyle(estiloCelda);
//				celda1_24.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_24.setCellValue(rs.getString(24));
				
	
				
				i++;
			}

			

			libro.write(archivo);
			archivo.close();
			Desktop.getDesktop().open(archivoXLS);

		} catch (Exception e) {
			System.out.println("Error : " + e.getMessage());
			e.printStackTrace();
		}
		return archivoXLS == null ? false : true;
	}

}
