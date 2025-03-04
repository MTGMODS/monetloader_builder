.class Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;
.super Ljava/lang/Object;
.source "AssetExtractor.java"

# interfaces
.implements Lcom/unity3d/ads/IUnityAdsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arizona/launcher/AssetExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UnityAdsListener"
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;->context:Landroid/content/Context;

    .line 38
    return-void
.end method


# virtual methods
.method public onUnityAdsError(Lcom/unity3d/ads/UnityAds$UnityAdsError;Ljava/lang/String;)V
    .locals 0
    .param p1, "error"    # Lcom/unity3d/ads/UnityAds$UnityAdsError;
    .param p2, "message"    # Ljava/lang/String;

    .line 60
    return-void
.end method

.method public onUnityAdsFinish(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$FinishState;)V
    .locals 3
    .param p1, "placementRewardedVideo"    # Ljava/lang/String;
    .param p2, "finishState"    # Lcom/unity3d/ads/UnityAds$FinishState;

    .line 49
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->COMPLETED:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;->context:Landroid/content/Context;

    const-string v2, "[MTG MODS]\n\u2139\ufe0f\ufe0f \u0421\u043f\u0430\u0441\u0438\u0431\u043e \u0437\u0430 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u2139\ufe0f"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 51
    :cond_0
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->SKIPPED:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    iget-object v0, p0, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;->context:Landroid/content/Context;

    const-string v2, "[MTG MODS]\n\ud83d\ude2d \u0412\u044b \u043f\u0440\u043e\u043f\u0443\u0441\u0442\u0438\u043b\u0438 \ud83d\ude2d\ufe0f"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 53
    :cond_1
    sget-object v0, Lcom/unity3d/ads/UnityAds$FinishState;->ERROR:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-virtual {p2, v0}, Lcom/unity3d/ads/UnityAds$FinishState;->equals(Ljava/lang/Object;)Z

    .line 56
    :goto_0
    return-void
.end method

.method public onUnityAdsReady(Ljava/lang/String;)V
    .locals 0
    .param p1, "placementRewardedVideo"    # Ljava/lang/String;

    .line 42
    return-void
.end method

.method public onUnityAdsStart(Ljava/lang/String;)V
    .locals 3
    .param p1, "placementRewardedVideo"    # Ljava/lang/String;

    .line 45
    iget-object v0, p0, Lcom/arizona/launcher/AssetExtractor$UnityAdsListener;->context:Landroid/content/Context;

    const-string v1, "[MTG MODS]\n\u2139\ufe0f\ufe0f VIP \u0443\u0431\u0438\u0440\u0430\u0435\u0442 \u0440\u0435\u043a\u043b\u0430\u043c\u0443 \u2139\ufe0f"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 46
    return-void
.end method
