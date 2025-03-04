.class public Lcom/arizona/launcher/AssetExtractor;
.super Ljava/lang/Object;
.source "AssetExtractor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;
    }
.end annotation


# static fields
.field public static placementRewardedVideo:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    const-string v0, "Interstitial_Android"

    sput-object v0, Lcom/arizona/launcher/AssetExtractor;->placementRewardedVideo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    .locals 6
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "assetPath"    # Ljava/lang/String;
    .param p2, "outFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 203
    .local v0, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 205
    .local v1, "out":Ljava/io/FileOutputStream;
    const/16 v2, 0x400

    new-array v2, v2, [B

    .line 207
    .local v2, "buffer":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "read":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_0

    .line 208
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 211
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 212
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 213
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 214
    return-void
.end method

.method public static initializeAds(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "onAdFinished"    # Ljava/lang/Runnable;

    .line 63
    new-instance v0, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;

    invoke-direct {v0, p1}, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;-><init>(Landroid/content/Context;)V

    .line 64
    .local v0, "UnityAdsListener":Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;
    invoke-static {v0}, Lcom/unity3d/ads/UnityAds;->addListener(Lcom/unity3d/ads/IUnityAdsListener;)V

    .line 65
    const-string v1, "4595401"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/unity3d/ads/UnityAds;->initialize(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 66
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p2}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 78
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 79
    return-void
.end method

.method private static isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z
    .locals 3
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;

    .line 178
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "list":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v2, v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 180
    .end local v1    # "list":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 181
    .local v1, "e":Ljava/io/IOException;
    return v0
.end method

.method static synthetic lambda$initializeAds$0(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "onAdFinished"    # Ljava/lang/Runnable;

    .line 75
    sget-object v0, Lcom/arizona/launcher/AssetExtractor;->placementRewardedVideo:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/unity3d/ads/UnityAds;->show(Landroid/app/Activity;Ljava/lang/String;)V

    .line 76
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 77
    return-void
.end method

.method static synthetic lambda$initializeAds$1(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "onAdFinished"    # Ljava/lang/Runnable;

    .line 67
    nop

    :goto_0
    sget-object v0, Lcom/arizona/launcher/AssetExtractor;->placementRewardedVideo:Ljava/lang/String;

    invoke-static {v0}, Lcom/unity3d/ads/UnityAds;->isReady(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    const-wide/16 v0, 0x1f4

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :goto_1
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .end local v0    # "e":Ljava/lang/InterruptedException;
    goto :goto_1

    .line 74
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 78
    return-void
.end method

.method static synthetic lambda$unpackAssets$2()V
    .locals 0

    .line 93
    return-void
.end method

.method static synthetic lambda$unpackAssetsDirectly$3(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .line 104
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 105
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finishAffinity()V

    .line 107
    :cond_0
    return-void
.end method

.method static synthetic lambda$unpackAssetsDirectly$4(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .line 134
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 135
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finishAffinity()V

    .line 137
    :cond_0
    return-void
.end method

.method static synthetic lambda$unpackAssetsDirectly$5(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 155
    const-string v0, "[MTG MODS]\n\u2611\ufe0f \ufe0fMonetLoader \u0440\u0430\u0431\u043e\u0442\u0430\u0435\u0442 \u2611\ufe0f"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$unpackAssetsDirectly$6(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .line 164
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 165
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finishAffinity()V

    .line 167
    :cond_0
    return-void
.end method

.method public static unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;

    .line 82
    invoke-static {p1}, Lcom/arizona/launcher/AssetExtractor;->unpackCrashFixAssets(Landroid/content/Context;)V

    .line 84
    const-string v0, "monetloader"

    .line 85
    .local v0, "folderName":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/Android/media/com.arizona.game/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "outputFolderPath":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    .local v2, "outputFolder":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/logs/monetloader.log"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 88
    .local v3, "importantFile":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/compat/VIP"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 90
    .local v4, "vipFile":Ljava/io/File;
    invoke-static {p0, p1, v2, v0}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsDirectly(Landroid/app/Activity;Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V

    .line 92
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 93
    new-instance v5, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda6;

    invoke-direct {v5}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda6;-><init>()V

    invoke-static {p0, p1, v5}, Lcom/arizona/launcher/AssetExtractor;->initializeAds(Landroid/app/Activity;Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 95
    :cond_0
    return-void
.end method

.method private static unpackAssetsDirectly(Landroid/app/Activity;Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V
    .locals 10
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "outputFolder"    # Ljava/io/File;
    .param p3, "folderName"    # Ljava/lang/String;

    .line 97
    const-string v0, "/"

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    const-string v2, "\u041e\u043a"

    const/4 v3, 0x0

    if-nez v1, :cond_2

    .line 98
    const-string v1, "[MTG MODS]\n\u2699\ufe0f Install MonetLoader \u2699\ufe0f"

    invoke-static {p1, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 99
    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_2

    .line 100
    new-instance v1, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v1, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 101
    const-string v4, "\u2757 MonetLoader Error \u21161 \u2757"

    invoke-virtual {v1, v4}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 102
    const-string v4, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u043f\u0430\u043f\u043a\u0443 /Android/media/com.arizona.game/monetloader\n\n\u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u043b\u0430\u0443\u043d\u0447\u0435\u0440\n\n\u0415\u0441\u043b\u0438 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u043a \u043d\u0435 \u043f\u043e\u043c\u043e\u0433, \u0442\u043e \u0432 \u043f\u0440\u043e\u0432\u043e\u0434\u043d\u0438\u043a\u0435 (\u0444\u0430\u0439\u043b\u043e\u0432\u043e\u043c \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440\u0435) \u0441\u0430\u043c\u043e\u0441\u0442\u043e\u044f\u0442\u0435\u043b\u044c\u043d\u043e \u0441\u043e\u0437\u0434\u0430\u0439\u0442\u0435 \u044d\u0442\u0443 \u043f\u0430\u043f\u043a\u0443 \u0434\u043b\u044f \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0435\u043d\u0438\u044f!"

    invoke-virtual {v1, v4}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    new-instance v4, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda0;

    invoke-direct {v4, p1}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    .line 103
    invoke-virtual {v1, v2, v4}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 108
    invoke-virtual {v1, v3}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v1

    .line 109
    .local v1, "alertDialog":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    invoke-virtual {v1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v4

    .line 110
    .local v4, "dialog":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v4, v3}, Landroidx/appcompat/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 111
    invoke-virtual {v4, v3}, Landroidx/appcompat/app/AlertDialog;->setCancelable(Z)V

    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->getExternalMediaDirs()[Ljava/io/File;

    move-result-object v5

    .line 114
    .local v5, "mediaDirs":[Ljava/io/File;
    array-length v6, v5

    if-lez v6, :cond_1

    aget-object v6, v5, v3

    if-eqz v6, :cond_1

    .line 115
    new-instance v6, Ljava/io/File;

    aget-object v7, v5, v3

    const-string v8, "monetloader"

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 116
    .local v6, "monetLoaderFolder":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_0

    .line 117
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 118
    return-void

    .line 120
    .end local v6    # "monetLoaderFolder":Ljava/io/File;
    :cond_0
    goto :goto_0

    .line 121
    :cond_1
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 122
    return-void

    .line 127
    .end local v1    # "alertDialog":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    .end local v4    # "dialog":Landroidx/appcompat/app/AlertDialog;
    .end local v5    # "mediaDirs":[Ljava/io/File;
    :cond_2
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 128
    .local v1, "assetManager":Landroid/content/res/AssetManager;
    invoke-virtual {v1, p3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 129
    .local v4, "files":[Ljava/lang/String;
    if-eqz v4, :cond_6

    array-length v5, v4

    if-nez v5, :cond_3

    goto :goto_3

    .line 145
    :cond_3
    array-length v5, v4

    move v6, v3

    :goto_1
    if-ge v6, v5, :cond_5

    aget-object v7, v4, v6

    .line 146
    .local v7, "fileName":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, p2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 147
    .local v8, "outFile":Ljava/io/File;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v9}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 148
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 149
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v9, v8}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_2

    .line 151
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v9, v8}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 145
    .end local v7    # "fileName":Ljava/lang/String;
    .end local v8    # "outFile":Ljava/io/File;
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 154
    :cond_5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v5, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda2;

    invoke-direct {v5, p1}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 174
    nop

    .end local v1    # "assetManager":Landroid/content/res/AssetManager;
    .end local v4    # "files":[Ljava/lang/String;
    goto :goto_4

    .line 130
    .restart local v1    # "assetManager":Landroid/content/res/AssetManager;
    .restart local v4    # "files":[Ljava/lang/String;
    :cond_6
    :goto_3
    new-instance v0, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v0, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u2757 MonetLoader Error \u21162 \u2757"

    .line 131
    invoke-virtual {v0, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    const-string v5, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0440\u0430\u0441\u043f\u0430\u043a\u043e\u0432\u0430\u0442\u044c \u0444\u0430\u0439\u043b\u044b \u0438\u0437 apk\n\n\u041f\u0435\u0440\u0435\u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0435 \u0434\u0430\u043d\u043d\u044b\u0439 \u043b\u0430\u0443\u043d\u0447\u0435\u0440 \u0438\u0437 DS/TG MTG MODS"

    .line 132
    invoke-virtual {v0, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    new-instance v5, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda1;

    invoke-direct {v5, p1}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    .line 133
    invoke-virtual {v0, v2, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 138
    invoke-virtual {v0, v3}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v0

    .line 139
    .local v0, "alertDialog2":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    invoke-virtual {v0}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v5

    .line 140
    .local v5, "dialog2":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v5, v3}, Landroidx/appcompat/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 141
    invoke-virtual {v5, v3}, Landroidx/appcompat/app/AlertDialog;->setCancelable(Z)V

    .line 142
    invoke-virtual {v5}, Landroidx/appcompat/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    return-void

    .line 157
    .end local v0    # "alertDialog2":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    .end local v1    # "assetManager":Landroid/content/res/AssetManager;
    .end local v4    # "files":[Ljava/lang/String;
    .end local v5    # "dialog2":Landroidx/appcompat/app/AlertDialog;
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/Android/media/com.arizona.game/monetloader/compat/lib_fix"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .local v1, "fixFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_7

    .line 160
    new-instance v4, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    invoke-direct {v4, p1}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;-><init>(Landroid/content/Context;)V

    .line 161
    const-string v5, "\u2757MonetLoader Error \u21163\u2757"

    invoke-virtual {v4, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setTitle(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v4

    .line 162
    const-string v5, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u0432\u0441\u0435 \u043d\u0443\u0436\u043d\u044b\u0435 \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0438 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u043e\u0441\u043f\u043e\u0441\u043e\u0431\u043d\u043e\u0441\u0442\u0438!\n\n\u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u043b\u0430\u0443\u043d\u0447\u0435\u0440\n\n\u0415\u0441\u043b\u0438 \u044d\u0442\u043e \u043d\u0435 \u043f\u043e\u043c\u043e\u0433\u043b\u043e, \u0442\u043e \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0435 \u043d\u0443\u0436\u043d\u044b\u0435 \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0438 \u0432\u0440\u0443\u0447\u043d\u0443\u044e, \u043e\u043d\u0438 \u0432 \u0442\u043e\u043c \u0436\u0435 \u043f\u043e\u0441\u0442\u0435, \u0433\u0434\u0435 \u0438 \u0434\u0430\u043d\u043d\u044b\u0439 \u043b\u0430\u0443\u043d\u0447\u0435\u0440\nhttps://t.me/mtgmods/1359"

    invoke-virtual {v4, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setMessage(Ljava/lang/CharSequence;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v4

    new-instance v5, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda3;

    invoke-direct {v5, p1}, Lcom/arizona/launcher/AssetExtractor$$ExternalSyntheticLambda3;-><init>(Landroid/content/Context;)V

    .line 163
    invoke-virtual {v4, v2, v5}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v2

    .line 168
    invoke-virtual {v2, v3}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setCancelable(Z)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;

    move-result-object v2

    .line 169
    .local v2, "alertDialog3":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    invoke-virtual {v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v4

    .line 170
    .local v4, "dialog3":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v4, v3}, Landroidx/appcompat/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 171
    invoke-virtual {v4, v3}, Landroidx/appcompat/app/AlertDialog;->setCancelable(Z)V

    .line 172
    invoke-virtual {v4}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 175
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fixFile":Ljava/io/File;
    .end local v2    # "alertDialog3":Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;
    .end local v4    # "dialog3":Landroidx/appcompat/app/AlertDialog;
    :cond_7
    :goto_4
    return-void
.end method

.method private static unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    .locals 7
    .param p0, "assetManager"    # Landroid/content/res/AssetManager;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "destination"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "files":[Ljava/lang/String;
    if-eqz v0, :cond_3

    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_2

    .line 190
    :cond_0
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 191
    .local v3, "fileName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 192
    .local v4, "outFile":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 193
    .local v5, "newPath":Ljava/lang/String;
    invoke-static {p0, v5}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 194
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 195
    invoke-static {p0, v5, v4}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_1

    .line 197
    :cond_1
    invoke-static {p0, v5, v4}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    .line 190
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "outFile":Ljava/io/File;
    .end local v5    # "newPath":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 200
    :cond_2
    return-void

    .line 187
    :cond_3
    :goto_2
    return-void
.end method

.method public static unpackCrashFixAssets(Landroid/content/Context;)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;

    .line 216
    const-string v0, "/"

    const-string v1, "data_files"

    .line 217
    .local v1, "folderName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/Android/data/com.arizona.game/files/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 218
    .local v2, "outputFolderPath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    .local v3, "outputFolder":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 220
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_0

    .line 221
    return-void

    .line 224
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    .line 226
    .local v4, "assetManager":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v4, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 227
    .local v5, "files":[Ljava/lang/String;
    if-eqz v5, :cond_4

    array-length v6, v5

    if-nez v6, :cond_1

    goto :goto_2

    .line 230
    :cond_1
    array-length v6, v5

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v6, :cond_3

    aget-object v8, v5, v7

    .line 231
    .local v8, "fileName":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v3, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 232
    .local v9, "outFile":Ljava/io/File;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Lcom/arizona/launcher/AssetExtractor;->isDirectory(Landroid/content/res/AssetManager;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 233
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 234
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10, v9}, Lcom/arizona/launcher/AssetExtractor;->unpackAssetsRecursive(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_1

    .line 236
    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10, v9}, Lcom/arizona/launcher/AssetExtractor;->copyFile(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    .end local v8    # "fileName":Ljava/lang/String;
    .end local v9    # "outFile":Ljava/io/File;
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 241
    .end local v5    # "files":[Ljava/lang/String;
    :cond_3
    goto :goto_3

    .line 228
    .restart local v5    # "files":[Ljava/lang/String;
    :cond_4
    :goto_2
    return-void

    .line 239
    .end local v5    # "files":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 242
    .end local v0    # "e":Ljava/io/IOException;
    :goto_3
    return-void
.end method
