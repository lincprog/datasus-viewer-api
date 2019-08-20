package com.datasus.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class State implements Serializable {
    private Integer codigo;
    private String  sigla;
}
