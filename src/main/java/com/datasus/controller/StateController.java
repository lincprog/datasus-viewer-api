package com.datasus.controller;

import com.datasus.mappers.StateMapper;
import com.datasus.model.State;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
@CrossOrigin
public class StateController {

    private static final Logger log = LoggerFactory.getLogger(StateController.class);

    @Autowired
    private StateMapper stateMapper;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/estados", method = RequestMethod.GET)
    public ResponseEntity findAll() {
        List<State> estates;
        try {
            estates = stateMapper.findAll();
            if (estates.isEmpty()) {
                return new ResponseEntity(HttpStatus.NOT_FOUND);
            } else {
                return new ResponseEntity(estates, HttpStatus.OK);
            }
        } catch (Throwable e) {
            log.error(e.getMessage());
            return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}

