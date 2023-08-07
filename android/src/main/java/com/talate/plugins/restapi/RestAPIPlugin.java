package com.talate.plugins.restapi;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.talate.plugins.restapi.model.AudioItem;
import com.talate.plugins.restapi.model.AudioResponse;
import com.talate.plugins.restapi.utility.TitleDisplayer;
import com.talate.plugins.restapi.utility.ToastTitlePresenter;

import org.json.JSONArray;

import java.util.List;

@CapacitorPlugin(name = "RestAPI")
public class RestAPIPlugin extends Plugin {

    private RestAPI implementation;
    private TitleDisplayer titleDisplayer;

    @Override
    public void load() {
        super.load();
        implementation = new RestAPI();
        titleDisplayer = new ToastTitlePresenter(getContext()); // Or new AlertDialogTitlePresenter(getContext());
    }


    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");
        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void getLatestCover(PluginCall call) {
        implementation.fetchCovers(new RestAPI.CoverCallback() {
            @Override
            public void onSuccess(AudioResponse response) {
                JSObject ret = new JSObject();
                JSONArray coverUrls = new JSONArray();

                List<AudioItem> items = response.getData();
                if (!items.isEmpty()) {
                    titleDisplayer.display(items.get(0).getTitle());

                    for (AudioItem item : items) {
                        coverUrls.put(item.getCover());
                    }
                }

                ret.put("covers", coverUrls);
                call.resolve(ret);
            }

            @Override
            public void onError(Throwable throwable) {
                call.reject("Failed to fetch covers", throwable.getMessage());
            }
        });
    }

}
