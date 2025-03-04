.class Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;
.super Ljava/lang/Object;
.source "LoadModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unity3d/services/ads/load/LoadModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadEventState"
.end annotation


# instance fields
.field public listener:Lcom/unity3d/ads/IUnityAdsLoadListener;

.field public listenerId:Ljava/lang/String;

.field public loadOptions:Lcom/unity3d/ads/UnityAdsLoadOptions;

.field public placementId:Ljava/lang/String;

.field final synthetic this$0:Lcom/unity3d/services/ads/load/LoadModule;

.field public time:J

.field public timeoutRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/unity3d/services/ads/load/LoadModule;Ljava/lang/String;Ljava/lang/String;Lcom/unity3d/ads/IUnityAdsLoadListener;Ljava/lang/Runnable;JLcom/unity3d/ads/UnityAdsLoadOptions;)V
    .registers 9

    .line 52
    iput-object p1, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->this$0:Lcom/unity3d/services/ads/load/LoadModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p2, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->placementId:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->listenerId:Ljava/lang/String;

    .line 55
    iput-object p4, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->listener:Lcom/unity3d/ads/IUnityAdsLoadListener;

    .line 56
    iput-wide p6, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->time:J

    .line 57
    iput-object p5, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->timeoutRunnable:Ljava/lang/Runnable;

    .line 58
    iput-object p8, p0, Lcom/unity3d/services/ads/load/LoadModule$LoadEventState;->loadOptions:Lcom/unity3d/ads/UnityAdsLoadOptions;

    return-void
.end method
