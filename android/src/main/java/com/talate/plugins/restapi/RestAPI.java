package com.talate.plugins.restapi;

import android.util.Log;

import com.talate.plugins.restapi.api.ApiService;
import com.talate.plugins.restapi.model.AudioResponse;
import com.talate.plugins.restapi.network.NetworkService;
import com.talate.plugins.restapi.repository.CoverRepository;

public class RestAPI {
    private final CoverRepository coverRepository;

    public RestAPI() {
        ApiService apiService = NetworkService.getApiService();
        this.coverRepository = new CoverRepository(apiService);
    }
    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }

    public void fetchCovers(CoverCallback callback) {
        coverRepository.fetchCovers(callback);
    }

    public interface CoverCallback {
        void onSuccess(AudioResponse response);
        void onError(Throwable throwable);
    }
}
