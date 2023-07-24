package com.talate.plugins.restapi;

import android.util.Log;

public class RestAPI {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }
}
