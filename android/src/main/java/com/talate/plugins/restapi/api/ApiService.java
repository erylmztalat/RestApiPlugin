package com.talate.plugins.restapi.api;

import com.talate.plugins.restapi.model.AudioResponse;

import retrofit2.Call;
import retrofit2.http.GET;

public interface ApiService {
    @GET("/code-challenge/manifest.json")
    Call<AudioResponse> getLatestCover();
}


