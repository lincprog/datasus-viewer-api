package com.datasus.controller;

import com.datasus.model.Cnes;
import com.datasus.service.CnesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/")
@CrossOrigin
public class CnesController {

    private static final Logger log = LoggerFactory.getLogger(CnesController.class);

    @Autowired
    private CnesService cnesService;

    @RequestMapping(value = "/cnes", method = RequestMethod.GET)
    public ResponseEntity findAll(@RequestParam(value = "cnes")String cnes) {
        List<Cnes> listCnes;
        try {
            listCnes = cnesService.findByCnes(cnes);
            if (listCnes.isEmpty()) {
                return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
            } else {
                return new ResponseEntity(listCnes, HttpStatus.OK);
            }
        } catch (Throwable e) {
            log.error(e.getMessage());
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//    @RequestMapping(value = "/cnes/all", method = RequestMethod.GET)
//    public ResponseEntity findAll() {
//        List<Cnes> listCnes;
//        try {
//            listCnes = cnesService.findAll();
//            if (listCnes.isEmpty()) {
//                return new ResponseEntity(HttpStatus.NOT_FOUND);
//            } else {
//                return new ResponseEntity(listCnes, HttpStatus.OK);
//            }
//        } catch (Throwable e) {
//            log.error(e.getMessage());
//            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/groupingReport", method = RequestMethod.GET)
    public ResponseEntity groupingReport(@RequestParam(value = "colunas")String columns,
                                         @RequestParam(value = "municipios", required = false) String cities,
                                         @RequestParam(value = "uf", required = false) String uf,
                                         @RequestParam(value = "cbos", required = false) String cbos,
                                         @RequestParam(value = "isSUS", required = false) Boolean isSUS,
                                         @RequestParam(value = "notIsSUS", required = false) Boolean notIsSUS) {
        String listCities[] = null ;
        String listCbos[] = null ;
        List<HashMap> groupReport;

        if(cities != null){
            listCities = cities.split(",");
        }

        if(cbos != null){
            listCbos = cbos.split(",");
        }

        try {
            groupReport = cnesService.groupingReport(columns,listCities, uf, listCbos, isSUS, notIsSUS);
            if (groupReport.isEmpty()) {
                return new ResponseEntity(new ArrayList<HashMap>(), HttpStatus.OK);
            } else {
                return new ResponseEntity(groupReport, HttpStatus.OK);
            }
        } catch (Throwable e) {
            log.error(e.getMessage());
            e.printStackTrace();
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}


