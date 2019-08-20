package com.datasus.utils;

import com.linuxense.javadbf.DBFException;
import com.linuxense.javadbf.DBFField;
import com.linuxense.javadbf.DBFReader;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;


public class DBFReaderUtils {

    private DBFReader reader;
    private static String SEPARADOR = ",";

    public DBFReaderUtils(String pathDBF) {

        reader = null;

        try {

            reader = new DBFReader(new FileInputStream(pathDBF));

        } catch (DBFException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public String header() {

        String cabecalhos = "";

        if (reader == null) {
            return cabecalhos;
        }

        int numberOfFields = reader.getFieldCount();

        for (int i = 0; i < numberOfFields; i++) {
            DBFField field = reader.getField(i);
//			System.out.println(field.getName());
            cabecalhos += field.getName() + " text" + (i != numberOfFields - 1 ? SEPARADOR : "");
        }
//		System.out.println(cabecalhos);
        return cabecalhos;
    }

    public ArrayList<String> lines() {
        ArrayList<String> linhas = new ArrayList<String>();
        Object[] rowObjects;

        if (reader == null) {
            return linhas;
        }

        while ((rowObjects = reader.nextRecord()) != null) {
            StringBuilder linha = new StringBuilder();
            for (int i = 0; i < rowObjects.length; i++) {

                linha.append("'" + rowObjects[i] + "'" + (i != rowObjects.length - 1 ? SEPARADOR : ""));
            }
//			System.out.println(linha);
            linhas.add(linha.toString());
        }
        return linhas;
    }

    public void close() {
        reader.close();
    }
}
