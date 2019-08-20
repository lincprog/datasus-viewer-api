package com.datasus.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class City implements Serializable {
    private Integer codigo;
    private String  descricao;
    private String  siglaEstado;
}
