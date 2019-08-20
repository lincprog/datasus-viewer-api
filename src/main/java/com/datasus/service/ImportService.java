package com.datasus.service;

import com.datasus.config.JdbcConnection;
import com.datasus.enuns.EnumDomainFileDatasus;
import com.datasus.enuns.EnumExtensionFile;
import com.datasus.utils.DBFReaderUtils;
import com.datasus.utils.FileUtils;
import com.datasus.utils.NetUtils;
import com.datasus.utils.ProcessSqlUtils;
import com.dbctodbf.CBlastLibrary;
import com.dbctodbf.interfaces.CLibrary;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@Service
public class ImportService {

    @Autowired
    private JdbcConnection jdbcConnection;

    public void importDataToDatabase(String state, String month, String year, String subDomain) {

        final String filename = FileUtils.createFileName(state, year, month, subDomain);
        final EnumDomainFileDatasus domain = EnumDomainFileDatasus.CNES;
        final File fileDBC;
        final String pathFileDBF;
        final DBFReaderUtils dbfReaderUtils;

        try {

            //TODO teste para validar o caminho ftp
            fileDBC = downloadFileDBC(filename, subDomain, domain);

            pathFileDBF = decryptDbcToDbf(fileDBC);

            dbfReaderUtils = new DBFReaderUtils(pathFileDBF);

            createTableFromFile(domain, subDomain, dbfReaderUtils);

            insertDataIntoTable(domain, subDomain, dbfReaderUtils);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //TODO jogar em uma classe DAO
    private void createTableFromFile(EnumDomainFileDatasus domain, String typeFile, DBFReaderUtils dbfReaderUtils) {

        String headers = dbfReaderUtils.header();
        String comandSql = "CREATE TABLE IF NOT EXISTS public." + domain + "_" + typeFile + " ( " + headers + ")";
        jdbcConnection.executeSql(comandSql);
    }

    private void insertDataIntoTable(EnumDomainFileDatasus domain, String typeFile, DBFReaderUtils dbfReaderUtils) {

        ArrayList<String> linesData = dbfReaderUtils.lines();
        ArrayList<String> comandsSql = new ArrayList<>();

        for (String line : linesData) {
            String comandInsert = "INSERT INTO public." + domain + "_" + typeFile + " VALUES ( " + line + ")";
            String comandProcessed = ProcessSqlUtils.processBeforeInsert(comandInsert);
            comandsSql.add(comandProcessed);
        }
        jdbcConnection.executeListSql(comandsSql);
    }

    private String decryptDbcToDbf(final File fileDBC) throws IOException {

        final String fileName = FilenameUtils.removeExtension(fileDBC.getName());
        final String pathFileDBF = FileUtils.createPathFileTemp(fileName, EnumExtensionFile.DBF);
        CLibrary cLibrary = CBlastLibrary.createInstance();
        cLibrary.dbc2dbf(fileDBC.getCanonicalPath(), pathFileDBF);
        return pathFileDBF;
    }

    private File downloadFileDBC(final String filename, final String tipoArquivo, final EnumDomainFileDatasus domain) throws IOException {

        final String urlRootDownload = domain.getUrlDownload();
        final String urlDownload = FileUtils.createUrlDownload(filename, tipoArquivo, urlRootDownload);
        final String pathDBC = FileUtils.createPathFileTemp(filename, EnumExtensionFile.DBC);
        return NetUtils.downloadUsingStream(urlDownload, pathDBC);
    }
}
