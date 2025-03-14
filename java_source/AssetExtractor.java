// package com.arizona.test;
package com.arizona.launcher;

import static androidx.core.app.ActivityCompat.finishAffinity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.AssetManager;
import android.os.Build;
import android.os.Environment;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.app.Activity;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.unity3d.ads.IUnityAdsListener;
import com.unity3d.ads.UnityAds;

import android.os.Handler;
import android.os.Looper;

import androidx.appcompat.app.AlertDialog;

public class AssetExtractor {

    public static String placementRewardedVideo = "Interstitial_Android";

    private static class UnityAdsListener implements IUnityAdsListener {
        private Context context;

        public UnityAdsListener(Context context) {
            this.context = context;
        }

        public void onUnityAdsReady(String placementRewardedVideo) {
            // Toast.makeText(context, "[MTG MODS]\nℹ️️ ADS 1 ℹ️", Toast.LENGTH_LONG).show();
        }
        @Override
        public void onUnityAdsStart(String placementRewardedVideo) {
            Toast.makeText(context, "[MTG MODS]\nℹ️️ VIP убирает рекламу ℹ️", Toast.LENGTH_LONG).show();
        }
        @Override
        public void onUnityAdsFinish(String placementRewardedVideo, UnityAds.FinishState finishState) {
            if (finishState.equals(UnityAds.FinishState.COMPLETED)) {
                Toast.makeText(context, "[MTG MODS]\nℹ️️ Спасибо за просмотр ℹ️", Toast.LENGTH_LONG).show();
            } else if (finishState.equals(UnityAds.FinishState.SKIPPED)) {
                    Toast.makeText(context, "[MTG MODS]\n😭 Вы пропустили 😭️", Toast.LENGTH_LONG).show();
            } else if (finishState.equals(UnityAds.FinishState.ERROR)) {
                // Toast.makeText(context, "[MTG MODS]\n❗️️ Ошибка сети ❗", Toast.LENGTH_LONG).show();
            }
        }
        @Override
        public void onUnityAdsError(UnityAds.UnityAdsError error, String message) {
            // Toast.makeText(context, "[MTG MODS]\n❗️️ Ошибка сети ❗", Toast.LENGTH_LONG).show();
        }
    }
    public static void initializeAds(Activity activity, Context context, Runnable onAdFinished) {
        final UnityAdsListener UnityAdsListener = new UnityAdsListener(context);
        UnityAds.addListener(UnityAdsListener);
        UnityAds.initialize(activity, "4595401", false);
        new Thread(() -> {
            while (!UnityAds.isReady(placementRewardedVideo)) {
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            new Handler(Looper.getMainLooper()).post(() -> {
                UnityAds.show(activity, placementRewardedVideo);
                onAdFinished.run();
            });
        }).start();
    }
    public static void unpackAssets(Activity activity, Context context) {

        unpackDataFilesAssets(context);

        String folderName = "monetloader";
        String outputFolderPath = Environment.getExternalStorageDirectory() + "/Android/media/com.arizona.game/" + folderName;
        File outputFolder = new File(outputFolderPath);
        File importantFile = new File(outputFolderPath + "/logs/monetloader.log");
        File vipFile = new File(outputFolderPath + "/compat/VIP");

        unpackAssetsDirectly(activity, context, outputFolder, folderName);

        if (importantFile.exists() && !vipFile.exists()) {
            initializeAds(activity, context, () -> {});
        }
    }
    private static void unpackAssetsDirectly(Activity activity, Context context, File outputFolder, String folderName) {
        if (!outputFolder.exists()) {
            Toast.makeText(context, "[MTG MODS]\n⚙️ Install MonetLoader ⚙️", Toast.LENGTH_SHORT).show();
            if (!outputFolder.mkdirs()) {
                MaterialAlertDialogBuilder alertDialog = new MaterialAlertDialogBuilder(context)
                        .setTitle("❗ MonetLoader Error №1 ❗")
                        .setMessage("Не удалось автоматически создать папку /Android/media/com.arizona.game/monetloader\n\nПопробуйте перезапустить лаунчер\n\nЕсли перезапуск не помог, то в проводнике (файловом менеджере) самостоятельно создайте эту папку для продолжения!")
                        .setPositiveButton("Ок", (dialogInterface, i) -> {
                            if (context instanceof Activity) {
                                ((Activity) context).finishAffinity();
                            }
                        })
                        .setCancelable(false);
                AlertDialog dialog = alertDialog.create();
                dialog.setCanceledOnTouchOutside(false);
                dialog.setCancelable(false);

                File[] mediaDirs = context.getExternalMediaDirs();
                if (mediaDirs.length > 0 && mediaDirs[0] != null) {
                    File monetLoaderFolder = new File(mediaDirs[0], "monetloader");
                    if (!(monetLoaderFolder.exists() || monetLoaderFolder.mkdirs())) {
                        dialog.show();
                        return;
                    }
                } else {
                    dialog.show();
                    return;
                }
            }
        }
        try {
            AssetManager assetManager = context.getAssets();
            String[] files = assetManager.list(folderName);
            if (files == null || files.length == 0) {
                MaterialAlertDialogBuilder alertDialog2 = new MaterialAlertDialogBuilder(context)
                        .setTitle("❗ MonetLoader Error №2 ❗")
                        .setMessage("Не удалось распаковать файлы из apk\n\nПереустановите данный лаунчер из DS/TG MTG MODS")
                        .setPositiveButton("Ок", (dialogInterface, i) -> {
                            if (context instanceof Activity) {
                                ((Activity) context).finishAffinity();
                            }
                        })
                        .setCancelable(false);
                AlertDialog dialog2 = alertDialog2.create();
                dialog2.setCanceledOnTouchOutside(false);
                dialog2.setCancelable(false);
                dialog2.show();
                return;
            }
            for (String fileName : files) {
                File outFile = new File(outputFolder, fileName);
                if (isDirectory(assetManager, folderName + "/" + fileName)) {
                    outFile.mkdirs();
                    unpackAssetsRecursive(assetManager, folderName + "/" + fileName, outFile);
                } else {
                    copyFile(assetManager, folderName + "/" + fileName, outFile);
                }
            }
            new Handler(Looper.getMainLooper()).post(() ->
                Toast.makeText(context, "[MTG MODS]\n☑️ ️MonetLoader работает ☑️", Toast.LENGTH_LONG).show()
            );
        } catch (IOException e) {
            File fixFile = new File(Environment.getExternalStorageDirectory() + "/Android/media/com.arizona.game/monetloader/compat/lib_fix");
            if (!fixFile.exists()) {
                MaterialAlertDialogBuilder alertDialog3 = new MaterialAlertDialogBuilder(context)
                        .setTitle("❗MonetLoader Error №3❗")
                        .setMessage("Не удалось автоматически установить нужные библиотеки для работоспособности!\n\nПопробуйте перезапустить лаунчер\n\nЕсли это не помогло, то вам нужно установить библиотеки вручную, скачать архив с ними можно по ссылке:\nhttps://t.me/mtgmods/1359 , там кликабельный текст \"Ошибка №3 при запуске (FIX)\"")
                        .setPositiveButton("Ок", (dialogInterface, i) -> {
                            if (context instanceof Activity) {
                                ((Activity) context).finishAffinity();
                            }
                        })
                        .setCancelable(false);
                AlertDialog dialog3 = alertDialog3.create();
                dialog3.setCanceledOnTouchOutside(false);
                dialog3.setCancelable(false);
                dialog3.show();
            };
        }
    }
    private static boolean isDirectory(AssetManager assetManager, String path) {
        try {
            String[] list = assetManager.list(path);
            return list != null && list.length > 0;
        } catch (IOException e) {
            return false;
        }
    }
    private static void unpackAssetsRecursive(AssetManager assetManager, String path, File destination) throws IOException {
        String[] files = assetManager.list(path);
        if (files == null || files.length == 0) {
            return;
        }

        for (String fileName : files) {
            File outFile = new File(destination, fileName);
            String newPath = path + "/" + fileName;
            if (isDirectory(assetManager, newPath)) {
                outFile.mkdirs();
                unpackAssetsRecursive(assetManager, newPath, outFile);
            } else {
                copyFile(assetManager, newPath, outFile);
            }
        }
    }
    private static void copyFile(AssetManager assetManager, String assetPath, File outFile) throws IOException {
        InputStream in = assetManager.open(assetPath);
        FileOutputStream out = new FileOutputStream(outFile);

        byte[] buffer = new byte[1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }

        in.close();
        out.flush();
        out.close();
    }
    public static void unpackDataFilesAssets(Context context) {
        String folderName = "data_files";
        String outputFolderPath = Environment.getExternalStorageDirectory() + "/Android/data/com.arizona.game/files/";
        File outputFolder = new File(outputFolderPath);
        if (!outputFolder.exists()) {
            if (!outputFolder.mkdirs()) {
                return;
            }
        }
        AssetManager assetManager = context.getAssets();
        try {
            String[] files = assetManager.list(folderName);
            if (files == null || files.length == 0) {
                return;
            }
            for (String fileName : files) {
                File outFile = new File(outputFolder, fileName);
                if (isDirectory(assetManager, folderName + "/" + fileName)) {
                    outFile.mkdirs();
                    unpackAssetsRecursive(assetManager, folderName + "/" + fileName, outFile);
                } else {
                    copyFile(assetManager, folderName + "/" + fileName, outFile);
                }
            }
        } catch (IOException e) {
            // e.printStackTrace();
        }
    }

}
