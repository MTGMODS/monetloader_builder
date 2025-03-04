.class public final enum Lcom/unity3d/services/ar/ARError;
.super Ljava/lang/Enum;
.source "ARError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/ar/ARError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/ar/ARError;

.field public static final enum ARCONFIG_INVALID:Lcom/unity3d/services/ar/ARError;

.field public static final enum ARVIEW_NULL:Lcom/unity3d/services/ar/ARError;

.field public static final enum AR_NOT_SUPPORTED:Lcom/unity3d/services/ar/ARError;

.field public static final enum INVALID_VALUE:Lcom/unity3d/services/ar/ARError;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 4
    new-instance v0, Lcom/unity3d/services/ar/ARError;

    const-string v1, "ARCONFIG_INVALID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/ar/ARError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/ARError;->ARCONFIG_INVALID:Lcom/unity3d/services/ar/ARError;

    .line 5
    new-instance v0, Lcom/unity3d/services/ar/ARError;

    const-string v1, "ARVIEW_NULL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/services/ar/ARError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/ARError;->ARVIEW_NULL:Lcom/unity3d/services/ar/ARError;

    .line 6
    new-instance v0, Lcom/unity3d/services/ar/ARError;

    const-string v1, "AR_NOT_SUPPORTED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/unity3d/services/ar/ARError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/ARError;->AR_NOT_SUPPORTED:Lcom/unity3d/services/ar/ARError;

    .line 7
    new-instance v0, Lcom/unity3d/services/ar/ARError;

    const-string v1, "INVALID_VALUE"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/unity3d/services/ar/ARError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ar/ARError;->INVALID_VALUE:Lcom/unity3d/services/ar/ARError;

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/unity3d/services/ar/ARError;

    .line 3
    sget-object v6, Lcom/unity3d/services/ar/ARError;->ARCONFIG_INVALID:Lcom/unity3d/services/ar/ARError;

    aput-object v6, v1, v2

    sget-object v2, Lcom/unity3d/services/ar/ARError;->ARVIEW_NULL:Lcom/unity3d/services/ar/ARError;

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/ar/ARError;->AR_NOT_SUPPORTED:Lcom/unity3d/services/ar/ARError;

    aput-object v2, v1, v4

    aput-object v0, v1, v5

    sput-object v1, Lcom/unity3d/services/ar/ARError;->$VALUES:[Lcom/unity3d/services/ar/ARError;

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

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/ar/ARError;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/ar/ARError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/ar/ARError;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/ar/ARError;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/ar/ARError;->$VALUES:[Lcom/unity3d/services/ar/ARError;

    invoke-virtual {v0}, [Lcom/unity3d/services/ar/ARError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/ar/ARError;

    return-object v0
.end method
