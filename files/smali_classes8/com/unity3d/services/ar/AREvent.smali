.class public final enum Lcom/unity3d/services/ar/AREvent;
.super Ljava/lang/Enum;
.source "AREvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/ar/AREvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_ANCHORS_UPDATED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_ERROR:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_FRAME_UPDATED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_PLANES_ADDED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_PLANES_REMOVED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_PLANES_UPDATED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_SESSION_INTERRUPTED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_SESSION_INTERRUPTION_ENDED:Lcom/unity3d/services/ar/AREvent;

.field public static final enum AR_WINDOW_RESIZED:Lcom/unity3d/services/ar/AREvent;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    .line 4
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_PLANES_ADDED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_ADDED:Lcom/unity3d/services/ar/AREvent;

    .line 5
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_PLANES_REMOVED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_REMOVED:Lcom/unity3d/services/ar/AREvent;

    .line 6
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_PLANES_UPDATED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_UPDATED:Lcom/unity3d/services/ar/AREvent;

    .line 7
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_ANCHORS_UPDATED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_ANCHORS_UPDATED:Lcom/unity3d/services/ar/AREvent;

    .line 8
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_FRAME_UPDATED"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_FRAME_UPDATED:Lcom/unity3d/services/ar/AREvent;

    .line 9
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_WINDOW_RESIZED"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_WINDOW_RESIZED:Lcom/unity3d/services/ar/AREvent;

    .line 10
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_ERROR"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_ERROR:Lcom/unity3d/services/ar/AREvent;

    .line 11
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_SESSION_INTERRUPTED"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_SESSION_INTERRUPTED:Lcom/unity3d/services/ar/AREvent;

    .line 12
    new-instance v0, Lcom/unity3d/services/ar/AREvent;

    const-string v1, "AR_SESSION_INTERRUPTION_ENDED"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/unity3d/services/ar/AREvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/AREvent;->AR_SESSION_INTERRUPTION_ENDED:Lcom/unity3d/services/ar/AREvent;

    const/16 v1, 0x9

    new-array v1, v1, [Lcom/unity3d/services/ar/AREvent;

    .line 3
    sget-object v11, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_ADDED:Lcom/unity3d/services/ar/AREvent;

    aput-object v11, v1, v2

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_REMOVED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_PLANES_UPDATED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v4

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_ANCHORS_UPDATED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v5

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_FRAME_UPDATED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v6

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_WINDOW_RESIZED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v7

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_ERROR:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v8

    sget-object v2, Lcom/unity3d/services/ar/AREvent;->AR_SESSION_INTERRUPTED:Lcom/unity3d/services/ar/AREvent;

    aput-object v2, v1, v9

    aput-object v0, v1, v10

    sput-object v1, Lcom/unity3d/services/ar/AREvent;->$VALUES:[Lcom/unity3d/services/ar/AREvent;

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

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/ar/AREvent;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/ar/AREvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/ar/AREvent;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/ar/AREvent;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/ar/AREvent;->$VALUES:[Lcom/unity3d/services/ar/AREvent;

    invoke-virtual {v0}, [Lcom/unity3d/services/ar/AREvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/ar/AREvent;

    return-object v0
.end method
