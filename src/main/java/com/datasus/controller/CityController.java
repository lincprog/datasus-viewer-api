package com.datasus.controller;

import com.datasus.mappers.CityMapper;
import com.datasus.model.City;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/municipios")
@CrossOrigin
public class CityController {

    private static final Logger log = LoggerFactory.getLogger(CityController.class);

    @Autowired
    private CityMapper municipioMapper;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/findByUf", method = RequestMethod.GET)
    public ResponseEntity findByUf(@RequestParam(value = "uf")String uf) {
        List<City> lista=new ArrayList<City>();
        try {
            lista = municipioMapper.findByUf(uf);
            if (lista.isEmpty()) {
                return new ResponseEntity(new ArrayList<City>(), HttpStatus.OK);
            } else {
                return new ResponseEntity(lista, HttpStatus.OK);
            }
        } catch (Throwable e) {
            log.error(e.getMessage());
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}

