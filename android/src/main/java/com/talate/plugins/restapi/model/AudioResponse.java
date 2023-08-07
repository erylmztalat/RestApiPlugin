package com.talate.plugins.restapi.model;

import java.util.List;

public class AudioResponse {
    private List<AudioItem> data;

    public List<AudioItem> getData() {
        return data;
    }

    public void setData(List<AudioItem> data) {
        this.data = data;
    }
}

