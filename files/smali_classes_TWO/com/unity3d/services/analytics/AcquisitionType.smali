.class public final enum Lcom/unity3d/services/analytics/AcquisitionType;
.super Ljava/lang/Enum;
.source "AcquisitionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/analytics/AcquisitionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/analytics/AcquisitionType;

.field public static final enum PREMIUM:Lcom/unity3d/services/analytics/AcquisitionType;

.field public static final enum SOFT:Lcom/unity3d/services/analytics/AcquisitionType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 4
    new-instance v0, Lcom/unity3d/services/analytics/AcquisitionType;

    const-string v1, "SOFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/analytics/AcquisitionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/analytics/AcquisitionType;->SOFT:Lcom/unity3d/services/analytics/AcquisitionType;

    .line 5
    new-instance v0, Lcom/unity3d/services/analytics/AcquisitionType;

    const-string v1, "PREMIUM"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/services/analytics/AcquisitionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/analytics/AcquisitionType;->PREMIUM:Lcom/unity3d/services/analytics/AcquisitionType;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/unity3d/services/analytics/AcquisitionType;

    .line 3
    sget-object v4, Lcom/unity3d/services/analytics/AcquisitionType;->SOFT:Lcom/unity3d/services/analytics/AcquisitionType;

    aput-object v4, v1, v2

    aput-object v0, v1, v3

    sput-object v1, Lcom/unity3d/services/analytics/AcquisitionType;->$VALUES:[Lcom/unity3d/services/analytics/AcquisitionType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/analytics/AcquisitionType;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/analytics/AcquisitionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/analytics/AcquisitionType;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/analytics/AcquisitionType;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/analytics/AcquisitionType;->$VALUES:[Lcom/unity3d/services/analytics/AcquisitionType;

    invoke-virtual {v0}, [Lcom/unity3d/services/analytics/AcquisitionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/analytics/AcquisitionType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .line 9
    sget-object v0, Lcom/unity3d/services/analytics/AcquisitionType$1;->$SwitchMap$com$unity3d$services$analytics$AcquisitionType:[I

    invoke-virtual {p0}, Lcom/unity3d/services/analytics/AcquisitionType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_14

    const/4 v1, 0x2

    if-eq v0, v1, :cond_11

    const-string v0, ""

    return-object v0

    :cond_11
    const-string v0, "premium"

    return-object v0

    :cond_14
    const-string v0, "soft"

    return-object v0
.end method
