package com.talate.plugins.restapi.model;

public class AudioItem {
    private String audio;
    private String cover;
    private String title;
    private int totalDurationMs;

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTotalDurationMs() {
        return totalDurationMs;
    }

    public void setTotalDurationMs(int totalDurationMs) {
        this.totalDurationMs = totalDurationMs;
    }
}



