.class final Lcom/unity3d/services/ads/api/AdUnit$1;
.super Ljava/lang/Object;
.source "AdUnit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/services/ads/api/AdUnit;->setViews(Lorg/json/JSONArray;Lcom/unity3d/services/core/webview/bridge/WebViewCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$views:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lorg/json/JSONArray;)V
    .registers 2

    .line 166
    iput-object p1, p0, Lcom/unity3d/services/ads/api/AdUnit$1;->val$views:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 169
    invoke-static {}, Lcom/unity3d/services/ads/api/AdUnit;->getAdUnitActivity()Lcom/unity3d/services/ads/adunit/AdUnitActivity;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 171
    :try_start_6
    invoke-static {}, Lcom/unity3d/services/ads/api/AdUnit;->getAdUnitActivity()Lcom/unity3d/services/ads/adunit/AdUnitActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/unity3d/services/ads/api/AdUnit$1;->val$views:Lorg/json/JSONArray;

    invoke-static {v1}, Lcom/unity3d/services/ads/api/AdUnit;->access$000(Lorg/json/JSONArray;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setViews([Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_13} :catch_14

    goto :goto_1a

    :catch_14
    move-exception v0

    const-string v1, "Corrupted viewlist"

    .line 173
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_1a
    :goto_1a
    return-void
.end method
