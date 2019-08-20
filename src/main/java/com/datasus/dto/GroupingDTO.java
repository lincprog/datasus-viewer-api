package com.datasus.dto;

import java.util.List;

public class GroupingDTO {

    private List<String> labels;
    private List<String> values;

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<String> getValues() {
        return values;
    }

    public void setValues(List<String> values) {
        this.values = values;
    }
}
