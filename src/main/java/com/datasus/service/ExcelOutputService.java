package com.datasus.service;

import com.datasus.dto.GroupingDTO;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

@Service
public class ExcelOutputService {

    public ServletOutputStream downloadExcelManifestacaoPorTipo(HttpServletResponse response, GroupingDTO lista){
        XSSFWorkbook workbook = null;
        ServletOutputStream out = null;
        try {

            String fileName = "informacoes.xls";
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            Workbook wb = new HSSFWorkbook();
            Sheet sheet = wb.createSheet("Informações");
            CreationHelper createHelper = wb.getCreationHelper();

            // ROW TITULO
            Font font = wb.createFont();
            font.setFontHeightInPoints((short)14);
            font.setFontName("Arial");
            font.setBoldweight((short)700);

            CellStyle style = wb.createCellStyle();
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style.setFont(font);
            Row row = sheet.createRow((short)0);
            Cell cell = row.createCell(0);
            cell.setCellStyle(style);
            cell.setCellValue("INFORMAÇÕES");
            cell= row.createCell(1);
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0,1));

            // ROW SUBTITULO
            Row rowSubtitulo = sheet.createRow((short)1);
            cell = rowSubtitulo.createCell(0);
            cell.setCellValue("Agrupamento");

            cell = rowSubtitulo.createCell(1);
            cell.setCellValue("Quantidade");

            int numRow = 2;

            List<String> labels = lista.getLabels();
            List<String> values = lista.getValues();

            for(int i = 0 ; i < labels.size(); i++ ){
                Row rowData = sheet.createRow((short)numRow++);
                cell = rowData.createCell(0);
                cell.setCellValue(labels.get(i));
                cell = rowData.createCell(1);
                cell.setCellValue(values.get(i));
            }

            sheet.autoSizeColumn(0,true);
            sheet.autoSizeColumn(1,true);

            out = response.getOutputStream();
            wb.write(out);
            out.flush();
            out.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return out;
    }

//    private Long contar(EnumTipoManifestacao enumTipoManifestacao, List<ManifestacaoStatusPorTipoDTO> lista){
//        Long cont = 0L;
//        for(ManifestacaoStatusPorTipoDTO cur: lista){
//            if (enumTipoManifestacao.getCodigo() == cur.getIdTipoManifestacao()) {
//                cont += cur.getQtd();
//            }
//        }
//        return cont;
//    }

//    private Long contarAtendidas(EnumTipoManifestacao enumTipoManifestacao, List<ManifestacaoStatusPorTipoDTO> lista){
//        Long cont = 0L;
//
//        for(ManifestacaoStatusPorTipoDTO cur: lista){
//            if (enumTipoManifestacao.getCodigo() == cur.getIdTipoManifestacao()) {
//                if(EnumStatusManifestacao.ATENDIDA.getCodigo() == cur.getIdStatusManifestacao()){
//                    cont += cur.getQtd();
//                }
//            }
//        }
//        return cont;
//    }

}