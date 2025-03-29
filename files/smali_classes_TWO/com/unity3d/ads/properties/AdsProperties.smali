.class public Lcom/unity3d/ads/properties/AdsProperties;
.super Ljava/lang/Object;
.source "AdsProperties.java"


# static fields
.field private static _listener:Lcom/unity3d/ads/IUnityAdsListener;

.field private static _listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/unity3d/ads/IUnityAdsListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addListener(Lcom/unity3d/ads/IUnityAdsListener;)V
    .registers 2

    .line 27
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    if-nez v0, :cond_6

    .line 29
    sput-object p0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    :cond_6
    if-eqz p0, :cond_15

    .line 32
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 33
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_15
    return-void
.end method

.method public static getListener()Lcom/unity3d/ads/IUnityAdsListener;
    .registers 1

    .line 23
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    return-object v0
.end method

.method public static getListeners()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/unity3d/ads/IUnityAdsListener;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/LinkedHashSet;

    sget-object v1, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 40
    sget-object v1, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    if-eqz v1, :cond_e

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_e
    return-object v0
.end method

.method public static removeListener(Lcom/unity3d/ads/IUnityAdsListener;)V
    .registers 2

    .line 48
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    if-eqz v0, :cond_d

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x0

    .line 49
    sput-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    .line 51
    :cond_d
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public static setListener(Lcom/unity3d/ads/IUnityAdsListener;)V
    .registers 3

    .line 16
    sget-object v0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    if-eqz v0, :cond_9

    .line 17
    sget-object v1, Lcom/unity3d/ads/properties/AdsProperties;->_listeners:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 19
    :cond_9
    sput-object p0, Lcom/unity3d/ads/properties/AdsProperties;->_listener:Lcom/unity3d/ads/IUnityAdsListener;

    return-void
.end method
