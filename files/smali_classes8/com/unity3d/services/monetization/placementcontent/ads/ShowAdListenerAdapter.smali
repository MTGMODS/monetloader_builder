.class public abstract Lcom/unity3d/services/monetization/placementcontent/ads/ShowAdListenerAdapter;
.super Ljava/lang/Object;
.source "ShowAdListenerAdapter.java"

# interfaces
.implements Lcom/unity3d/services/monetization/placementcontent/ads/IShowAdListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdFinished(Ljava/lang/String;Lcom/unity3d/ads/UnityAds$FinishState;)V
    .registers 3

    return-void
.end method

.method public onAdStarted(Ljava/lang/String;)V
    .registers 2

    return-void
.end method
