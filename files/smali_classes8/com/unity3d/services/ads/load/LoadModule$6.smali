.class Lcom/unity3d/services/ads/load/LoadModule$6;
.super Ljava/lang/Object;
.source "LoadModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/services/ads/load/LoadModule;->onSdkInitialized()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/unity3d/services/ads/load/LoadModule;

.field final synthetic val$loadEventStates:[Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;


# direct methods
.method constructor <init>(Lcom/unity3d/services/ads/load/LoadModule;[Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;)V
    .registers 3

    .line 205
    iput-object p1, p0, Lcom/unity3d/services/ads/load/LoadModule$6;->this$0:Lcom/unity3d/services/ads/load/LoadModule;

    iput-object p2, p0, Lcom/unity3d/services/ads/load/LoadModule$6;->val$loadEventStates:[Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 208
    iget-object v0, p0, Lcom/unity3d/services/ads/load/LoadModule$6;->val$loadEventStates:[Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_10

    aget-object v3, v0, v2

    .line 209
    iget-object v4, p0, Lcom/unity3d/services/ads/load/LoadModule$6;->this$0:Lcom/unity3d/services/ads/load/LoadModule;

    invoke-static {v4, v3}, Lcom/unity3d/services/ads/load/LoadModule;->access$000(Lcom/unity3d/services/ads/load/LoadModule;Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_10
    return-void
.end method
