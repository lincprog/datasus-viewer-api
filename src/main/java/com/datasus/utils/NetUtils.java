package com.datasus.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class NetUtils {

    public static File downloadUsingStream(String urlDownload, String pathFileOut) throws IOException {
        File out = new File(pathFileOut);
        InputStream in = new URL(urlDownload).openStream();
        Files.copy(in, Paths.get(pathFileOut), StandardCopyOption.REPLACE_EXISTING);
        return out;
    }
}
