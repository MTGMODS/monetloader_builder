.class public Lcom/unity3d/services/core/request/WebRequestThread;
.super Ljava/lang/Object;
.source "WebRequestThread.java"


# static fields
.field private static _corePoolSize:I = 0x1

.field private static _keepAliveTime:J = 0x3e8L

.field private static _maximumPoolSize:I = 0x1

.field private static _pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor; = null

.field private static _queue:Ljava/util/concurrent/LinkedBlockingQueue; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static _ready:Z = false

.field private static final _readyLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 22
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/unity3d/services/core/request/WebRequestThread;->_readyLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .registers 1

    .line 14
    sput-boolean p0, Lcom/unity3d/services/core/request/WebRequestThread;->_ready:Z

    return p0
.end method

.method static synthetic access$100()Ljava/lang/Object;
    .registers 1

    .line 14
    sget-object v0, Lcom/unity3d/services/core/request/WebRequestThread;->_readyLock:Ljava/lang/Object;

    return-object v0
.end method

.method public static declared-synchronized cancel()V
    .registers 4

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 69
    :try_start_3
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    if-eqz v1, :cond_33

    .line 70
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    invoke-virtual {v1}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->cancel()V

    .line 71
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    .line 72
    instance-of v3, v2, Lcom/unity3d/services/core/request/WebRequestRunnable;

    if-eqz v3, :cond_12

    .line 73
    check-cast v2, Lcom/unity3d/services/core/request/WebRequestRunnable;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/unity3d/services/core/request/WebRequestRunnable;->setCancelStatus(Z)V

    goto :goto_12

    .line 75
    :cond_29
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 76
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    invoke-virtual {v1}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->purge()V
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_35

    .line 78
    :cond_33
    monitor-exit v0

    return-void

    :catchall_35
    move-exception v1

    monitor-exit v0

    goto :goto_39

    :goto_38
    throw v1

    :goto_39
    goto :goto_38
.end method

.method private static declared-synchronized init()V
    .registers 9

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 25
    :try_start_3
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    sput-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 26
    new-instance v1, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    sget v3, Lcom/unity3d/services/core/request/WebRequestThread;->_corePoolSize:I

    sget v4, Lcom/unity3d/services/core/request/WebRequestThread;->_maximumPoolSize:I

    sget-wide v5, Lcom/unity3d/services/core/request/WebRequestThread;->_keepAliveTime:J

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v8, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/LinkedBlockingQueue;)V

    sput-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    .line 27
    invoke-virtual {v1}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->prestartAllCoreThreads()I

    .line 29
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v2, Lcom/unity3d/services/core/request/WebRequestThread$1;

    invoke-direct {v2}, Lcom/unity3d/services/core/request/WebRequestThread$1;-><init>()V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 40
    :goto_29
    sget-boolean v1, Lcom/unity3d/services/core/request/WebRequestThread;->_ready:Z
    :try_end_2b
    .catchall {:try_start_3 .. :try_end_2b} :catchall_43

    if-nez v1, :cond_41

    .line 42
    :try_start_2d
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_readyLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_30
    .catch Ljava/lang/InterruptedException; {:try_start_2d .. :try_end_30} :catch_3a
    .catchall {:try_start_2d .. :try_end_30} :catchall_43

    .line 43
    :try_start_30
    sget-object v2, Lcom/unity3d/services/core/request/WebRequestThread;->_readyLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    .line 44
    monitor-exit v1

    goto :goto_29

    :catchall_37
    move-exception v2

    monitor-exit v1
    :try_end_39
    .catchall {:try_start_30 .. :try_end_39} :catchall_37

    :try_start_39
    throw v2
    :try_end_3a
    .catch Ljava/lang/InterruptedException; {:try_start_39 .. :try_end_3a} :catch_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_43

    :catch_3a
    :try_start_3a
    const-string v1, "Couldn\'t synchronize thread"

    .line 46
    invoke-static {v1}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V
    :try_end_3f
    .catchall {:try_start_3a .. :try_end_3f} :catchall_43

    .line 47
    monitor-exit v0

    return-void

    .line 50
    :cond_41
    monitor-exit v0

    return-void

    :catchall_43
    move-exception v1

    monitor-exit v0

    goto :goto_47

    :goto_46
    throw v1

    :goto_47
    goto :goto_46
.end method

.method public static declared-synchronized request(Ljava/lang/String;Lcom/unity3d/services/core/request/WebRequest$RequestType;Ljava/util/Map;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/unity3d/services/core/request/IWebRequestListener;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/unity3d/services/core/request/WebRequest$RequestType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Lcom/unity3d/services/core/request/IWebRequestListener;",
            ")V"
        }
    .end annotation

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .line 81
    :try_start_a
    invoke-static/range {v1 .. v7}, Lcom/unity3d/services/core/request/WebRequestThread;->request(Ljava/lang/String;Lcom/unity3d/services/core/request/WebRequest$RequestType;Ljava/util/Map;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/unity3d/services/core/request/IWebRequestListener;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_f

    .line 82
    monitor-exit v0

    return-void

    :catchall_f
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized request(Ljava/lang/String;Lcom/unity3d/services/core/request/WebRequest$RequestType;Ljava/util/Map;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/unity3d/services/core/request/IWebRequestListener;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/unity3d/services/core/request/WebRequest$RequestType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Lcom/unity3d/services/core/request/IWebRequestListener;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    const-class v9, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v9

    .line 85
    :try_start_4
    sget-boolean v1, Lcom/unity3d/services/core/request/WebRequestThread;->_ready:Z

    if-nez v1, :cond_b

    .line 86
    invoke-static {}, Lcom/unity3d/services/core/request/WebRequestThread;->init()V

    :cond_b
    if-eqz v0, :cond_33

    .line 89
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_15

    goto :goto_33

    .line 94
    :cond_15
    sget-object v10, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v11, Lcom/unity3d/services/core/request/WebRequestRunnable;

    invoke-virtual {p1}, Lcom/unity3d/services/core/request/WebRequest$RequestType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    move-object v1, v11

    move-object v2, p0

    move-object v4, p3

    move-object v7, p2

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/unity3d/services/core/request/WebRequestRunnable;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/util/Map;Lcom/unity3d/services/core/request/IWebRequestListener;)V

    invoke-virtual {v10, v11}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_31
    .catchall {:try_start_4 .. :try_end_31} :catchall_3c

    .line 95
    monitor-exit v9

    return-void

    :cond_33
    :goto_33
    :try_start_33
    const-string v1, "Request is NULL or too short"

    move-object/from16 v2, p6

    .line 90
    invoke-interface {v2, p0, v1}, Lcom/unity3d/services/core/request/IWebRequestListener;->onFailed(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3a
    .catchall {:try_start_33 .. :try_end_3a} :catchall_3c

    .line 91
    monitor-exit v9

    return-void

    :catchall_3c
    move-exception v0

    monitor-exit v9

    throw v0
.end method

.method public static declared-synchronized reset()V
    .registers 5

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 53
    :try_start_3
    invoke-static {}, Lcom/unity3d/services/core/request/WebRequestThread;->cancel()V

    .line 55
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    if-eqz v1, :cond_28

    .line 56
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    invoke-virtual {v1}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->shutdown()V
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_2a

    .line 58
    :try_start_f
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    const-wide v2, 0x7fffffffffffffffL

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_1b} :catch_1b
    .catchall {:try_start_f .. :try_end_1b} :catchall_2a

    .line 61
    :catch_1b
    :try_start_1b
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    const/4 v1, 0x0

    .line 62
    sput-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    .line 63
    sput-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_queue:Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x0

    .line 64
    sput-boolean v1, Lcom/unity3d/services/core/request/WebRequestThread;->_ready:Z
    :try_end_28
    .catchall {:try_start_1b .. :try_end_28} :catchall_2a

    .line 66
    :cond_28
    monitor-exit v0

    return-void

    :catchall_2a
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized resolve(Ljava/lang/String;Lcom/unity3d/services/core/request/IResolveHostListener;)Z
    .registers 5

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    if-eqz p0, :cond_1d

    .line 124
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_d

    goto :goto_1d

    .line 129
    :cond_d
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/unity3d/services/core/request/WebRequestThread$2;

    invoke-direct {v2, p0, p1}, Lcom/unity3d/services/core/request/WebRequestThread$2;-><init>(Ljava/lang/String;Lcom/unity3d/services/core/request/IResolveHostListener;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 162
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_27

    const/4 p0, 0x1

    .line 165
    monitor-exit v0

    return p0

    .line 125
    :cond_1d
    :goto_1d
    :try_start_1d
    sget-object v1, Lcom/unity3d/services/core/request/ResolveHostError;->INVALID_HOST:Lcom/unity3d/services/core/request/ResolveHostError;

    const-string v2, "Host is NULL"

    invoke-interface {p1, p0, v1, v2}, Lcom/unity3d/services/core/request/IResolveHostListener;->onFailed(Ljava/lang/String;Lcom/unity3d/services/core/request/ResolveHostError;Ljava/lang/String;)V
    :try_end_24
    .catchall {:try_start_1d .. :try_end_24} :catchall_27

    const/4 p0, 0x0

    .line 126
    monitor-exit v0

    return p0

    :catchall_27
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized setConcurrentRequestCount(I)V
    .registers 3

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 98
    :try_start_3
    sput p0, Lcom/unity3d/services/core/request/WebRequestThread;->_corePoolSize:I

    .line 99
    sput p0, Lcom/unity3d/services/core/request/WebRequestThread;->_maximumPoolSize:I

    .line 101
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    if-eqz v1, :cond_17

    .line 102
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    invoke-virtual {v1, p0}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->setCorePoolSize(I)V

    .line 103
    sget-object p0, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    sget v1, Lcom/unity3d/services/core/request/WebRequestThread;->_maximumPoolSize:I

    invoke-virtual {p0, v1}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->setMaximumPoolSize(I)V
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_19

    .line 105
    :cond_17
    monitor-exit v0

    return-void

    :catchall_19
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized setKeepAliveTime(J)V
    .registers 5

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 116
    :try_start_3
    sput-wide p0, Lcom/unity3d/services/core/request/WebRequestThread;->_keepAliveTime:J

    .line 118
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    if-eqz v1, :cond_10

    .line 119
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p0, p1, v2}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    .line 121
    :cond_10
    monitor-exit v0

    return-void

    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized setMaximumPoolSize(I)V
    .registers 3

    const-class v0, Lcom/unity3d/services/core/request/WebRequestThread;

    monitor-enter v0

    .line 108
    :try_start_3
    sput p0, Lcom/unity3d/services/core/request/WebRequestThread;->_maximumPoolSize:I

    .line 110
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    if-eqz v1, :cond_e

    .line 111
    sget-object v1, Lcom/unity3d/services/core/request/WebRequestThread;->_pool:Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;

    invoke-virtual {v1, p0}, Lcom/unity3d/services/core/request/CancelableThreadPoolExecutor;->setMaximumPoolSize(I)V
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 113
    :cond_e
    monitor-exit v0

    return-void

    :catchall_10
    move-exception p0

    monitor-exit v0

    throw p0
.end method
