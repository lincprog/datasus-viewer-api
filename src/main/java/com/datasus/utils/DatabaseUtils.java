//package com.datasus.utils;
//
//import com.datasus.config.JdbcConnection;
//
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//public class DatabaseUtils {
//
//
//    public static void insertDatabase(String domain, String typeFile, DBFReaderUtils dbf, JdbcConnection db) throws SQLException {
//
//        if (dbf == null) {
//            return;
//        }
//
//        createTable(domain, typeFile, dbf, db);
//
//        ArrayList<String> lines = dbf.lines();
//        System.out.println("QUANTIDADE DE REGISTROS PARA INSERIR" + lines.size());
//
//        for (String line : lines) {
//            String comandInsert = "INSERT INTO public." + domain + "_" + typeFile + " VALUES ( " + line + ")";
//            String comandProcessed = ProcessSqlUtils.processBeforeInsert(comandInsert);
//            db.getStmt().execute(comandProcessed);
//        }
//    }
//}
