.class public Lcom/unity3d/services/ads/token/TokenStorage;
.super Ljava/lang/Object;
.source "TokenStorage.java"


# static fields
.field private static _accessCounter:I = 0x0

.field private static _peekMode:Z = false

.field private static _queue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized appendTokens(Lorg/json/JSONArray;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/unity3d/services/ads/token/TokenStorage;

    monitor-enter v0

    .line 26
    :try_start_3
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const/4 v2, 0x0

    if-nez v1, :cond_11

    .line 27
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 28
    sput v2, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    .line 31
    :cond_11
    :goto_11
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_23

    .line 32
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_25

    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 34
    :cond_23
    monitor-exit v0

    return-void

    :catchall_25
    move-exception p0

    monitor-exit v0

    goto :goto_29

    :goto_28
    throw p0

    :goto_29
    goto :goto_28
.end method

.method public static declared-synchronized createTokens(Lorg/json/JSONArray;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-class v0, Lcom/unity3d/services/ads/token/TokenStorage;

    monitor-enter v0

    .line 17
    :try_start_3
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const/4 v1, 0x0

    .line 18
    sput v1, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    .line 20
    :goto_d
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1f

    .line 21
    sget-object v2, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_21

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 23
    :cond_1f
    monitor-exit v0

    return-void

    :catchall_21
    move-exception p0

    monitor-exit v0

    goto :goto_25

    :goto_24
    throw p0

    :goto_25
    goto :goto_24
.end method

.method public static declared-synchronized deleteTokens()V
    .registers 2

    const-class v0, Lcom/unity3d/services/ads/token/TokenStorage;

    monitor-enter v0

    const/4 v1, 0x0

    .line 37
    :try_start_4
    sput-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const/4 v1, 0x0

    .line 38
    sput v1, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_b

    .line 39
    monitor-exit v0

    return-void

    :catchall_b
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized getToken()Ljava/lang/String;
    .registers 8

    const-class v0, Lcom/unity3d/services/ads/token/TokenStorage;

    monitor-enter v0

    .line 42
    :try_start_3
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_6d

    const/4 v2, 0x0

    if-nez v1, :cond_a

    .line 43
    monitor-exit v0

    return-object v2

    .line 46
    :cond_a
    :try_start_a
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_22

    .line 47
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v1

    sget-object v4, Lcom/unity3d/services/core/webview/WebViewEventCategory;->TOKEN:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v5, Lcom/unity3d/services/ads/token/TokenEvent;->QUEUE_EMPTY:Lcom/unity3d/services/ads/token/TokenEvent;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v4, v5, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z
    :try_end_20
    .catchall {:try_start_a .. :try_end_20} :catchall_6d

    .line 48
    monitor-exit v0

    return-object v2

    .line 49
    :cond_22
    :try_start_22
    sget-boolean v1, Lcom/unity3d/services/ads/token/TokenStorage;->_peekMode:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_4a

    .line 50
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v1

    sget-object v4, Lcom/unity3d/services/core/webview/WebViewEventCategory;->TOKEN:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v5, Lcom/unity3d/services/ads/token/TokenEvent;->TOKEN_ACCESS:Lcom/unity3d/services/ads/token/TokenEvent;

    new-array v2, v2, [Ljava/lang/Object;

    sget v6, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-virtual {v1, v4, v5, v2}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    .line 51
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_48
    .catchall {:try_start_22 .. :try_end_48} :catchall_6d

    monitor-exit v0

    return-object v1

    .line 53
    :cond_4a
    :try_start_4a
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v1

    sget-object v4, Lcom/unity3d/services/core/webview/WebViewEventCategory;->TOKEN:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v5, Lcom/unity3d/services/ads/token/TokenEvent;->TOKEN_ACCESS:Lcom/unity3d/services/ads/token/TokenEvent;

    new-array v2, v2, [Ljava/lang/Object;

    sget v6, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    add-int/lit8 v7, v6, 0x1

    sput v7, Lcom/unity3d/services/ads/token/TokenStorage;->_accessCounter:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-virtual {v1, v4, v5, v2}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    .line 54
    sget-object v1, Lcom/unity3d/services/ads/token/TokenStorage;->_queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_6b
    .catchall {:try_start_4a .. :try_end_6b} :catchall_6d

    monitor-exit v0

    return-object v1

    :catchall_6d
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized setPeekMode(Z)V
    .registers 2

    const-class v0, Lcom/unity3d/services/ads/token/TokenStorage;

    monitor-enter v0

    .line 59
    :try_start_3
    sput-boolean p0, Lcom/unity3d/services/ads/token/TokenStorage;->_peekMode:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    .line 60
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p0

    monitor-exit v0

    throw p0
.end method
