.class Lcom/unity3d/services/ar/view/GLSurfaceView$GLThreadManager;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unity3d/services/ar/view/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLThreadManager"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "GLThreadManager"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 1939
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unity3d/services/ar/view/GLSurfaceView$1;)V
    .registers 2

    .line 1939
    invoke-direct {p0}, Lcom/unity3d/services/ar/view/GLSurfaceView$GLThreadManager;-><init>()V

    return-void
.end method


# virtual methods
.method public releaseEglContextLocked(Lcom/unity3d/services/ar/view/GLSurfaceView$GLThread;)V
    .registers 2

    .line 1955
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    return-void
.end method

.method public declared-synchronized threadExiting(Lcom/unity3d/services/ar/view/GLSurfaceView$GLThread;)V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x1

    .line 1946
    :try_start_2
    invoke-static {p1, v0}, Lcom/unity3d/services/ar/view/GLSurfaceView$GLThread;->access$1102(Lcom/unity3d/services/ar/view/GLSurfaceView$GLThread;Z)Z

    .line 1947
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_a

    .line 1948
    monitor-exit p0

    return-void

    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method
