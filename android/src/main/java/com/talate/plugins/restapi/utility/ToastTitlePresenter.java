package com.talate.plugins.restapi.utility;

import android.content.Context;
import android.widget.Toast;

public class ToastTitlePresenter implements TitleDisplayer {
    private Context context;

    public ToastTitlePresenter(Context context) {
        this.context = context;
    }

    @Override
    public void display(String title) {
        Toast.makeText(context, title, Toast.LENGTH_LONG).show();
    }
}

