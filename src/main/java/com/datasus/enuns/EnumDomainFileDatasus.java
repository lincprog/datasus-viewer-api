package com.datasus.enuns;

public enum EnumDomainFileDatasus {

    //TODO futuramente acrescentar os demais domínios que existe no DATASUS
    CNES("CNES", "ftp://ftp.datasus.gov.br/dissemin/publicos/CNES/200508_/Dados/");

    private String urlDownload;
    private String domain;

    EnumDomainFileDatasus(String domain, String urlDownload) {
        this.domain = domain;
        this.urlDownload = urlDownload;
    }

    public String getUrlDownload() {
        return urlDownload;
    }

    public String getDomain() {
        return domain;
    }
}
