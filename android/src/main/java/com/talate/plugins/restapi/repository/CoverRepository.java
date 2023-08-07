package com.talate.plugins.restapi.repository;

import com.talate.plugins.restapi.RestAPI;
import com.talate.plugins.restapi.api.ApiService;
import com.talate.plugins.restapi.model.AudioResponse;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CoverRepository {
    private ApiService apiService;

    public CoverRepository(ApiService apiService) {
        this.apiService = apiService;
    }

    public void fetchCovers(final RestAPI.CoverCallback callback) {
        apiService.getLatestCover().enqueue(new Callback<AudioResponse>() {
            @Override
            public void onResponse(Call<AudioResponse> call, Response<AudioResponse> response) {
                if (response.isSuccessful() && response.body() != null) {
                    callback.onSuccess(response.body());
                } else {
                    callback.onError(new Exception("Failed to fetch covers."));
                }
            }

            @Override
            public void onFailure(Call<AudioResponse> call, Throwable t) {
                callback.onError(new Exception(t));
            }
        });
    }
}

