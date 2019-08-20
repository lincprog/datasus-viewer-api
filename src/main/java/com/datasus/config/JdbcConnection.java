package com.datasus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;

@Component
public class JdbcConnection {

    @Autowired
    private PlatformTransactionManager platformTransactionManager;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private TransactionStatus getTransaction() {

        DefaultTransactionDefinition paramTransactionDefinition = new DefaultTransactionDefinition();
        TransactionStatus status = platformTransactionManager.getTransaction(paramTransactionDefinition);
        return status;
    }

    private void commit(TransactionStatus transactionStatus) {

        platformTransactionManager.commit(transactionStatus);
    }

    private void rollback(TransactionStatus transactionStatus) {

        platformTransactionManager.rollback(transactionStatus);
    }

    public void executeSql(String comandSql) {

        TransactionStatus status = getTransaction();
        try {
            this.jdbcTemplate.execute(comandSql.toLowerCase());
            platformTransactionManager.commit(status);
        } catch (Exception e) {
            platformTransactionManager.rollback(status);
        }
    }

    public void executeListSql(ArrayList<String> comandsSql) {

        TransactionStatus status = getTransaction();
        long tempoInicio = System.currentTimeMillis();
        try {
            comandsSql.stream().forEach(sql -> {
                this.jdbcTemplate.execute(sql);
            });
            platformTransactionManager.commit(status);
        } catch (Exception e) {
            platformTransactionManager.rollback(status);
        }
        System.out.println("Tempo Total: " + (System.currentTimeMillis() - tempoInicio) / 1000);
    }

}
