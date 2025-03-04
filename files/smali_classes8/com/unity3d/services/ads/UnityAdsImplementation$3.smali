.class final Lcom/unity3d/services/ads/UnityAdsImplementation$3;
.super Ljava/lang/Object;
.source "UnityAdsImplementation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/services/ads/UnityAdsImplementation;->handleShowError(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$UnityAdsError;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$error:Lcom/unity3d/ads/UnityAds$UnityAdsError;

.field final synthetic val$errorMessage:Ljava/lang/String;

.field final synthetic val$placementId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/unity3d/ads/UnityAds$UnityAdsError;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 294
    iput-object p1, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$error:Lcom/unity3d/ads/UnityAds$UnityAdsError;

    iput-object p2, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$errorMessage:Ljava/lang/String;

    iput-object p3, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$placementId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 297
    invoke-static {}, Lcom/unity3d/ads/properties/AdsProperties;->getListeners()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/ads/IUnityAdsListener;

    .line 298
    iget-object v2, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$error:Lcom/unity3d/ads/UnityAds$UnityAdsError;

    iget-object v3, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$errorMessage:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Lcom/unity3d/ads/IUnityAdsListener;->onUnityAdsError(Lcom/unity3d/ads/UnityAds$UnityAdsError;Ljava/lang/String;)V

    .line 299
    iget-object v2, p0, Lcom/unity3d/services/ads/UnityAdsImplementation$3;->val$placementId:Ljava/lang/String;

    if-eqz v2, :cond_25

    .line 300
    sget-object v3, Lcom/unity3d/ads/UnityAds$FinishState;->ERROR:Lcom/unity3d/ads/UnityAds$FinishState;

    invoke-interface {v1, v2, v3}, Lcom/unity3d/ads/IUnityAdsListener;->onUnityAdsFinish(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$FinishState;)V

    goto :goto_8

    .line 302
    :cond_25
    sget-object v2, Lcom/unity3d/ads/UnityAds$FinishState;->ERROR:Lcom/unity3d/ads/UnityAds$FinishState;

    const-string v3, ""

    invoke-interface {v1, v3, v2}, Lcom/unity3d/ads/IUnityAdsListener;->onUnityAdsFinish(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$FinishState;)V

    goto :goto_8

    :cond_2d
    return-void
.end method
