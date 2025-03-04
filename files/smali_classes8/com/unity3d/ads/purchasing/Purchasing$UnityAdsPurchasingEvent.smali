.class public final enum Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;
.super Ljava/lang/Enum;
.source "Purchasing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unity3d/ads/purchasing/Purchasing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UnityAdsPurchasingEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

.field public static final enum CATALOG:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

.field public static final enum COMMAND:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

.field public static final enum EVENT:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

.field public static final enum INITIALIZATION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

.field public static final enum VERSION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 9
    new-instance v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const-string v1, "COMMAND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->COMMAND:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    .line 10
    new-instance v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const-string v1, "VERSION"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->VERSION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    .line 11
    new-instance v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const-string v1, "CATALOG"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->CATALOG:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    .line 12
    new-instance v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const-string v1, "INITIALIZATION"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->INITIALIZATION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    .line 13
    new-instance v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const-string v1, "EVENT"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->EVENT:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    const/4 v1, 0x5

    new-array v1, v1, [Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    .line 8
    sget-object v7, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->COMMAND:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    aput-object v7, v1, v2

    sget-object v2, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->VERSION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->CATALOG:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    aput-object v2, v1, v4

    sget-object v2, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->INITIALIZATION:Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    aput-object v2, v1, v5

    aput-object v0, v1, v6

    sput-object v1, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->$VALUES:[Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;
    .registers 2

    .line 8
    const-class v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;
    .registers 1

    .line 8
    sget-object v0, Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->$VALUES:[Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    invoke-virtual {v0}, [Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/ads/purchasing/Purchasing$UnityAdsPurchasingEvent;

    return-object v0
.end method
