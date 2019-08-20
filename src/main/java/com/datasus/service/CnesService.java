package com.datasus.service;

import com.datasus.mappers.CnesMapper;
import com.datasus.model.Cnes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CnesService {

    @Autowired
    private CnesMapper cnesMapper;

    public List<Cnes> findByCnes(String cnes) {
        return cnesMapper.findByCnes(cnes);
    }

    public List<Cnes> findAll() {
        return cnesMapper.findAll();
    }

    public List<HashMap> groupingReport(String columns, String[] cities, String uf, String[] cbos, Boolean isSUS, Boolean notIsSus) {
        return cnesMapper.groupingReport(columns,cities, uf, cbos, isSUS, notIsSus);
    }
}
