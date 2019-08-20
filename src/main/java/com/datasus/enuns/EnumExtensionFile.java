package com.datasus.enuns;

public enum EnumExtensionFile {

    DBF(".DBF"),
    DBC(".DBC");

    private String description;

    EnumExtensionFile(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return getDescription();
    }

    public String getDescription() {
        return description;
    }
}
