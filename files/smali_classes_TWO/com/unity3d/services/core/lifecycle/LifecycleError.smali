.class public final enum Lcom/unity3d/services/core/lifecycle/LifecycleError;
.super Ljava/lang/Enum;
.source "LifecycleError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/core/lifecycle/LifecycleError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/core/lifecycle/LifecycleError;

.field public static final enum APPLICATION_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;

.field public static final enum JSON_ERROR:Lcom/unity3d/services/core/lifecycle/LifecycleError;

.field public static final enum LISTENER_NOT_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 4
    new-instance v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;

    const-string v1, "APPLICATION_NULL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/core/lifecycle/LifecycleError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;->APPLICATION_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;

    .line 5
    new-instance v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;

    const-string v1, "LISTENER_NOT_NULL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/services/core/lifecycle/LifecycleError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;->LISTENER_NOT_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;

    .line 6
    new-instance v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;

    const-string v1, "JSON_ERROR"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/unity3d/services/core/lifecycle/LifecycleError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;->JSON_ERROR:Lcom/unity3d/services/core/lifecycle/LifecycleError;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/unity3d/services/core/lifecycle/LifecycleError;

    .line 3
    sget-object v5, Lcom/unity3d/services/core/lifecycle/LifecycleError;->APPLICATION_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;

    aput-object v5, v1, v2

    sget-object v2, Lcom/unity3d/services/core/lifecycle/LifecycleError;->LISTENER_NOT_NULL:Lcom/unity3d/services/core/lifecycle/LifecycleError;

    aput-object v2, v1, v3

    aput-object v0, v1, v4

    sput-object v1, Lcom/unity3d/services/core/lifecycle/LifecycleError;->$VALUES:[Lcom/unity3d/services/core/lifecycle/LifecycleError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/core/lifecycle/LifecycleError;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/core/lifecycle/LifecycleError;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/core/lifecycle/LifecycleError;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/core/lifecycle/LifecycleError;->$VALUES:[Lcom/unity3d/services/core/lifecycle/LifecycleError;

    invoke-virtual {v0}, [Lcom/unity3d/services/core/lifecycle/LifecycleError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/core/lifecycle/LifecycleError;

    return-object v0
.end method
