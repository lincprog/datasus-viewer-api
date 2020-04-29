package com.datasus.utils;

public class ProcessSqlUtils {

  public static String processBeforeInsert(String comandSql) {

    //corrigindo bug das virgulas
    comandSql = comandSql.replaceAll("([a-zA-Z]|[0-9])(')([a-zA-Z]|[0-9])", "$1$3");
    comandSql = comandSql.replaceAll("([A-Z])('')", "$1'");

    comandSql = comandSql.replaceAll("''''", "''");
    comandSql = comandSql.replaceAll("'''", "''");
    comandSql = comandSql.replaceAll("([0-9])('')", "$1'");
    comandSql = comandSql.replaceAll("('')([0-9])", "'$2");
    comandSql = comandSql.replaceAll("'='", "'");
    comandSql = comandSql.replaceAll("([0-9])(')([A-Z])(')", "$1$3$4");

    return comandSql;
  }
}
