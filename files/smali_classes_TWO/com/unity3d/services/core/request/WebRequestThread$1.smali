.class final Lcom/unity3d/services/core/request/WebRequestThread$1;
.super Ljava/lang/Object;
.source "WebRequestThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/services/core/request/WebRequestThread;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const/4 v0, 0x1

    .line 32
    invoke-static {v0}, Lcom/unity3d/services/core/request/WebRequestThread;->access$002(Z)Z

    .line 34
    invoke-static {}, Lcom/unity3d/services/core/request/WebRequestThread;->access$100()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 35
    :try_start_9
    invoke-static {}, Lcom/unity3d/services/core/request/WebRequestThread;->access$100()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 36
    monitor-exit v0

    return-void

    :catchall_12
    move-exception v1

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_9 .. :try_end_14} :catchall_12

    throw v1
.end method
