package com.datasus.controller;

import com.datasus.dto.GroupingDTO;
import com.datasus.service.ExcelOutputService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@RestController
@RequestMapping(value="/exceloutput")
@CrossOrigin
public class ExcelServiceController {

    @Autowired
    private ExcelOutputService excelOutputService;

    @RequestMapping(value="/downloadExcelManifestacaoPorTipo", method= RequestMethod.POST)
    public ResponseEntity downloadExcelManifestacaoPorTipo(HttpServletResponse response, @RequestBody GroupingDTO manifestacoes){

        ServletOutputStream out = excelOutputService.downloadExcelManifestacaoPorTipo(response, manifestacoes);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            bos.writeTo( out );
            return new ResponseEntity( bos.toByteArray(),HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new ResponseEntity( bos.toByteArray(),HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
