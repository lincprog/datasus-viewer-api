package com.datasus.controller;

import com.datasus.service.ImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/importacao")
@CrossOrigin
public class ImportController {

    @Autowired
    private ImportService importService;

    @GetMapping
    public ResponseEntity importDataToDatabase(@RequestParam String estado, @RequestParam String mes,
                                               @RequestParam String ano, @RequestParam String tipoArquivo) {

        importService.importDataToDatabase(estado, mes, ano, tipoArquivo);
        return ResponseEntity.noContent().build();
    }
}
