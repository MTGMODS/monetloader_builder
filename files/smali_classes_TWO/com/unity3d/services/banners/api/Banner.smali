.class public Lcom/unity3d/services/banners/api/Banner;
.super Ljava/lang/Object;
.source "Banner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unity3d/services/banners/api/Banner$BannerViewType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static load(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lcom/unity3d/services/core/webview/bridge/WebViewCallback;)V
    .registers 6
    .annotation runtime Lcom/unity3d/services/core/webview/bridge/WebViewExposed;
    .end annotation

    .line 29
    invoke-static {p0}, Lcom/unity3d/services/banners/api/Banner$BannerViewType;->fromString(Ljava/lang/String;)Lcom/unity3d/services/banners/api/Banner$BannerViewType;

    move-result-object p0

    .line 30
    sget-object v0, Lcom/unity3d/services/banners/api/Banner$1;->$SwitchMap$com$unity3d$services$banners$api$Banner$BannerViewType:[I

    invoke-virtual {p0}, Lcom/unity3d/services/banners/api/Banner$BannerViewType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_10

    goto :goto_2a

    .line 32
    :cond_10
    invoke-static {}, Lcom/unity3d/services/banners/BannerViewCache;->getInstance()Lcom/unity3d/services/banners/BannerViewCache;

    move-result-object p0

    new-instance v0, Lcom/unity3d/services/banners/UnityBannerSize;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-direct {v0, p1, p2}, Lcom/unity3d/services/banners/UnityBannerSize;-><init>(II)V

    invoke-virtual {p0, p3, v0}, Lcom/unity3d/services/banners/BannerViewCache;->loadWebPlayer(Ljava/lang/String;Lcom/unity3d/services/banners/UnityBannerSize;)Z

    move-result p0

    if-eqz p0, :cond_2a

    .line 34
    invoke-static {p3}, Lcom/unity3d/services/banners/bridge/BannerBridge;->didLoad(Ljava/lang/String;)V

    :cond_2a
    :goto_2a
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    .line 42
    invoke-virtual {p4, p0}, Lcom/unity3d/services/core/webview/bridge/WebViewCallback;->invoke([Ljava/lang/Object;)V

    return-void
.end method

.method public static setRefreshRate(Ljava/lang/String;Ljava/lang/Integer;Lcom/unity3d/services/core/webview/bridge/WebViewCallback;)V
    .registers 4
    .annotation runtime Lcom/unity3d/services/core/webview/bridge/WebViewExposed;
    .end annotation

    if-eqz p0, :cond_b

    if-eqz p1, :cond_b

    .line 48
    invoke-static {}, Lcom/unity3d/services/banners/properties/BannerRefreshInfo;->getInstance()Lcom/unity3d/services/banners/properties/BannerRefreshInfo;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/unity3d/services/banners/properties/BannerRefreshInfo;->setRefreshRate(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_b
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    .line 50
    invoke-virtual {p2, p0}, Lcom/unity3d/services/core/webview/bridge/WebViewCallback;->invoke([Ljava/lang/Object;)V

    return-void
.end method
