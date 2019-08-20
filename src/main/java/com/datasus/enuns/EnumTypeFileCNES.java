package com.datasus.enuns;

public enum EnumTypeFileCNES {

    LT ("LT","Leitos - A partir de Out/2005"),
    ST ("ST","Estabelecimentos - A partir de Ago/2005"),
    DC ("DC","Dados Complementares - A partir de Ago/2005"),
    EQ ("EQ","Equipamentos - A partir de Ago/2005"),
    SR ("SR","Serviço Especializado - A partir de Ago/2005"),
    HB ("HB","Habilitação - A partir de Mar/2007"),
    PF ("PF","Profissional - A partir de Ago/2005"),
    EP ("EP","Equipes - A partir de Abr/2007"),
    RC ("RC","Regra Contratual - A partir de Mar/2007"),
    IN ("IN","Incentivos - A partir de Nov/2007"),
    EE ("EE","Estabelecimento de Ensino - A partir de Mar/2007"),
    EF ("EF","Estabelecimento Filantrópico - A partir de Mar/2007"),
    GM ("GM","Gestão e Metas - A partir de Jun/2007");



    private String initials;
    private String description;

    EnumTypeFileCNES(String initials, String description) {
        this.initials = initials;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public String getInitials() {
        return initials;
    }
}
