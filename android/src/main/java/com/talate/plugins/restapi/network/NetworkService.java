package com.talate.plugins.restapi.network;

import com.talate.plugins.restapi.api.ApiService;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class NetworkService {
    private static Retrofit retrofit = new Retrofit.Builder()
            .baseUrl("https://public.softgames.com/")
            .addConverterFactory(GsonConverterFactory.create())
            .build();

    public static ApiService getApiService() {
        return retrofit.create(ApiService.class);
    }
}


