.class public final enum Lcom/unity3d/services/core/webview/WebViewEventCategory;
.super Ljava/lang/Enum;
.source "WebViewEventCategory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/core/webview/WebViewEventCategory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum ANALYTICS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum AR:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum BANNER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum BROADCAST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum CACHE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum CONNECTIVITY:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum DEVICEINFO:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum LIFECYCLE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum LOAD_API:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum PERMISSIONS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum PURCHASING:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum REQUEST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum RESOLVE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum STORAGE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum TOKEN:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

.field public static final enum WEBPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;


# direct methods
.method static constructor <clinit>()V
    .registers 17

    .line 4
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "ADUNIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 5
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "BANNER"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->BANNER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 6
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "VIDEOPLAYER"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 7
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "REQUEST"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->REQUEST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 8
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "RESOLVE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->RESOLVE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 9
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "CACHE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->CACHE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 10
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "CONNECTIVITY"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->CONNECTIVITY:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 11
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "STORAGE"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORAGE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 12
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "BROADCAST"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->BROADCAST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 13
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "LIFECYCLE"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->LIFECYCLE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 14
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "DEVICEINFO"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->DEVICEINFO:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 15
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "WEBPLAYER"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->WEBPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 16
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "PURCHASING"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PURCHASING:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 17
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "ANALYTICS"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ANALYTICS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 18
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "AR"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->AR:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 19
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "PERMISSIONS"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PERMISSIONS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 20
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "STORE"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 21
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "LOAD_API"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->LOAD_API:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 22
    new-instance v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const-string v1, "TOKEN"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15}, Lcom/unity3d/services/core/webview/WebViewEventCategory;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->TOKEN:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v1, 0x13

    new-array v1, v1, [Lcom/unity3d/services/core/webview/WebViewEventCategory;

    .line 3
    sget-object v16, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v16, v1, v2

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->BANNER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v4

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->REQUEST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v5

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->RESOLVE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v6

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->CACHE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v7

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->CONNECTIVITY:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v8

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORAGE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v9

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->BROADCAST:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v10

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->LIFECYCLE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v11

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->DEVICEINFO:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v12

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->WEBPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v13

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PURCHASING:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    aput-object v2, v1, v14

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ANALYTICS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v3, 0xd

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->AR:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v3, 0xe

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PERMISSIONS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v3, 0xf

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v3, 0x10

    aput-object v2, v1, v3

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->LOAD_API:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/16 v3, 0x11

    aput-object v2, v1, v3

    aput-object v0, v1, v15

    sput-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->$VALUES:[Lcom/unity3d/services/core/webview/WebViewEventCategory;

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

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/core/webview/WebViewEventCategory;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/core/webview/WebViewEventCategory;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/core/webview/WebViewEventCategory;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->$VALUES:[Lcom/unity3d/services/core/webview/WebViewEventCategory;

    invoke-virtual {v0}, [Lcom/unity3d/services/core/webview/WebViewEventCategory;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/core/webview/WebViewEventCategory;

    return-object v0
.end method
