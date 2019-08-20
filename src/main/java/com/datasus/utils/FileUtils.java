package com.datasus.utils;

import com.datasus.enuns.EnumExtensionFile;

import java.io.File;
import java.io.IOException;

public class FileUtils {

    private static final File TEMP_DIRECTORY = new File(System.getProperty("java.io.tmpdir"));

    public static String createUrlDownload(String fileName, String tipoArquivo, String urlDownload) {
        String extensionFile = EnumExtensionFile.DBC.getDescription();
        return urlDownload + tipoArquivo.toUpperCase() + File.separator + fileName + extensionFile;
    }

    public static String createFileName(String ufState, String year, String month, String typeFile) {
        String fileName = typeFile.toUpperCase() + ufState.toUpperCase() + year + month;
        return fileName;
    }

    public static String createPathFileTemp(String fileName, EnumExtensionFile extensionFile) throws IOException {
        File tempFile = new File(TEMP_DIRECTORY + File.separator + fileName + extensionFile);
        return tempFile.getCanonicalPath();
    }
}
