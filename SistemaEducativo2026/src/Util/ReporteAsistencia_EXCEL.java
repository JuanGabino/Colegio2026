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
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import Util.Conexion;

public class ReporteAsistencia_EXCEL {
	
	public boolean generarExcelAsistencia(String seccion, String docente, int mes, String docentenombre, String seccionnombre, String mesnombre, String anio) {
		
		boolean flag = false;
		
		File archivoXLS = null;
		try {
			Conexion con = new Conexion();
			String query = "select a.id_Padre, p.nomPadre, p.apePat_Padre, p.apeMat_Madre, p.dni_Padre, sum(case when a.estado = 'Asistio' then 1 else 0 end) as Asistencia, " + 
					"sum(case when a.estado = 'Falto' then 1 else 0 end) as Faltas, " + 
					"(sum(case when a.estado = 'Asistio' then 1 else 0 end) + sum(case when a.estado = 'Falto' then 1 else 0 end)) as Total, " + 
					"(case when (sum(case when a.estado = 'Asistio' then 1 else 0 end)) > (sum(case when a.estado = 'Falto' then 1 else 0 end)) then 'Activo' else 'Inactivo' end) as Estado " + 
					"from asistencia_padres a join padres p on a.id_Padre=p.codPadre and month(a.fecha) = "+mes+" "+ 
					"and a.id_docente = '"+docente+"' and a.seccion = '"+seccion+"' " + 
					"group by id_Padre";
			
			ResultSet rs = con.executeQuery(query);
			System.out.println("Query " + query);

			String rutaArchivo = System.getProperty("user.home") + "\\"+seccion+".xls";		
			archivoXLS = new File(rutaArchivo);

			System.out.println("Entró al try, la ruta es " + rutaArchivo);

			if (archivoXLS.exists()) {
				archivoXLS.delete();
				archivoXLS.createNewFile();
			}

			Workbook libro = new HSSFWorkbook();
			FileOutputStream archivo = new FileOutputStream(archivoXLS);
			Sheet hoja = libro.createSheet("Reporte Asistencia Padres");
			hoja.setDisplayGridlines(false);

			Row fila = hoja.createRow(1);

			System.out.println("Se están creando filas y columnas");

			HSSFFont fuente = (HSSFFont) libro.createFont();
			HSSFCellStyle estiloCelda = (HSSFCellStyle) libro.createCellStyle();
			HSSFCellStyle style = (HSSFCellStyle) libro.createCellStyle();
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

		
			//AGREGA COLUMNAS  
			
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
			estiloCelda.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			
			
			// TItulo

			hoja.addMergedRegion(CellRangeAddress.valueOf("E2:H2"));
			hoja.addMergedRegion(CellRangeAddress.valueOf("D4:E4"));
			hoja.addMergedRegion(CellRangeAddress.valueOf("H4:I4"));
			hoja.addMergedRegion(CellRangeAddress.valueOf("D6:E6"));
			
			
			fila = hoja.createRow(1);			
			Cell celda01 = fila.createCell(4);
			celda01.setCellStyle(titulo);
			celda01.setCellValue("REPORTE MENSUAL ASISTENCIA DE PADRES DE FAMILIA");
			fila = hoja.createRow(3);
			Cell celda02 = fila.createCell(3);
			celda02.setCellStyle(titulo);
			celda02.setCellValue("Periodo: " + mesnombre + "-" + anio);
			Cell celda04 = fila.createCell(7);
			celda04.setCellStyle(titulo);
			celda04.setCellValue("Sección: " + seccionnombre);
			fila = hoja.createRow(5);
			Cell celda03 = fila.createCell(3);
			celda03.setCellStyle(titulo);
			celda03.setCellValue("Docente: " + docentenombre);
			
			// Cabecera
			
			fila = hoja.createRow(8);
			Cell celda2 = fila.createCell(1);
			celda2.setCellStyle(cabecera);
			celda2.setCellValue("Nro");

			Cell celda3 = fila.createCell(2);
			celda3.setCellStyle(cabecera);
			celda3.setCellValue("Código Padre");

			Cell celda4 = fila.createCell(3);
			celda4.setCellStyle(cabecera);
			celda4.setCellValue("Nombre");

			Cell celda5 = fila.createCell(4);
			celda5.setCellStyle(cabecera);
			celda5.setCellValue("Apellido Paterno");

			Cell celda6 = fila.createCell(5);
			celda6.setCellStyle(cabecera);
			celda6.setCellValue("Apellido Materno");
			
			Cell celda7 = fila.createCell(6);
			celda7.setCellStyle(cabecera);
			celda7.setCellValue("DNI");
			
			
			Cell celda8 = fila.createCell(7);
			celda8.setCellStyle(cabecera);
			celda8.setCellValue("Asistencia");
			
			Cell celda9 = fila.createCell(8);
			celda9.setCellStyle(cabecera);
			celda9.setCellValue("Faltas");
			
			Cell celda11 = fila.createCell(9);
			celda11.setCellStyle(cabecera);
			celda11.setCellValue("Total De Aviso");
			
			Cell celda12 = fila.createCell(10);
			celda12.setCellStyle(cabecera);
			celda12.setCellValue("Estado");

			
			int i = 9;
			int j = 1;
			while (rs.next()) {

				
				fila = (HSSFRow) hoja.createRow(i);
				
				
				Cell celda1_1 = fila.createCell(1);
				celda1_1.setCellStyle(estiloCelda);
				celda1_1.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_1.setCellValue(j);

				Cell celda1_2 = fila.createCell(2);
				celda1_2.setCellStyle(estiloCelda);
				celda1_2.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_2.setCellValue(rs.getString(1));
				
				Cell celda1_3 = fila.createCell(3);
				celda1_3.setCellStyle(estiloCelda);
				celda1_3.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_3.setCellValue(rs.getString(2));
				
				Cell celda1_4 = fila.createCell(4);
				celda1_4.setCellStyle(estiloCelda);
				celda1_4.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_4.setCellValue(rs.getString(3));
				
				Cell celda1_5 = fila.createCell(5);
				celda1_5.setCellStyle(estiloCelda);
				celda1_5.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_5.setCellValue(rs.getString(4));
				
				Cell celda1_6 = fila.createCell(6);
				celda1_6.setCellStyle(estiloCelda);
				celda1_6.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_6.setCellValue(rs.getString(5));
				
				Cell celda1_7 = fila.createCell(7);
				celda1_7.setCellStyle(estiloCelda);
				celda1_7.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_7.setCellValue(rs.getString(6));
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
				celda1_8.setCellValue(rs.getString(7));
				
			
				
				Cell celda1_9 = fila.createCell(9);
				celda1_9.setCellStyle(estiloCelda);
				celda1_9.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_9.setCellValue(rs.getString(8));
				
				Cell celda1_10 = fila.createCell(10);
				celda1_10.setCellStyle(estiloCelda);
				celda1_10.setCellType(HSSFCell.CELL_TYPE_STRING);
				celda1_10.setCellValue(rs.getString(9));

//				Cell celda1_11 = fila.createCell(11);
//				celda1_11.setCellStyle(estiloCelda);
//				celda1_11.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_11.setCellValue(rs.getString(11));
				
		
//				Cell celda1_12 = fila.createCell(12);
//				celda1_12.setCellStyle(estiloCelda);
//				celda1_12.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_12.setCellValue(rs.getString(12));
			
//				Cell celda1_12 = fila.createCell(12);
//				celda1_12.setCellStyle(estiloCelda);
//				celda1_12.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_12.setCellValue(rs.getString(12));
				
//				Cell celda1_13 = fila.createCell(13);
//				celda1_13.setCellStyle(estiloCelda);
//				celda1_13.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_13.setCellValue(rs.getString(13));

//				
//				Cell celda1_13 = fila.createCell(13);
//				celda1_13.setCellStyle(estiloCelda);
//				celda1_13.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_13.setCellValue(rs.getString(13));
				

//				Cell celda1_14 = fila.createCell(14);
//				celda1_14.setCellStyle(estiloCelda);
//				celda1_14.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_14.setCellValue(rs.getString(14));

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
//				Cell celda1_15 = fila.createCell(15);
//				celda1_15.setCellStyle(estiloCelda);
//				celda1_15.setCellType(HSSFCell.CELL_TYPE_STRING);
//				celda1_15.setCellValue(rs.getString(15));
//				
				
				
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
				
				j++;
				
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
