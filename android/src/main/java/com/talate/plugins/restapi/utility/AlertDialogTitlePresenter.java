package com.talate.plugins.restapi.utility;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;

public class AlertDialogTitlePresenter implements TitleDisplayer {
    private Context context;

    public AlertDialogTitlePresenter(Context context) {
        this.context = context;
    }

    @Override
    public void display(String title) {
        new AlertDialog.Builder(context)
                .setTitle("Cover Title")
                .setMessage(title)
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .show();
    }
}

