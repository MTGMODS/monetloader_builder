.class synthetic Lcom/unity3d/services/core/api/DeviceInfo$2;
.super Ljava/lang/Object;
.source "DeviceInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/unity3d/services/core/api/DeviceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$unity3d$services$core$api$DeviceInfo$StorageType:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 359
    invoke-static {}, Lcom/unity3d/services/core/api/DeviceInfo$StorageType;->values()[Lcom/unity3d/services/core/api/DeviceInfo$StorageType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/unity3d/services/core/api/DeviceInfo$2;->$SwitchMap$com$unity3d$services$core$api$DeviceInfo$StorageType:[I

    :try_start_9
    sget-object v1, Lcom/unity3d/services/core/api/DeviceInfo$StorageType;->INTERNAL:Lcom/unity3d/services/core/api/DeviceInfo$StorageType;

    invoke-virtual {v1}, Lcom/unity3d/services/core/api/DeviceInfo$StorageType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lcom/unity3d/services/core/api/DeviceInfo$2;->$SwitchMap$com$unity3d$services$core$api$DeviceInfo$StorageType:[I

    sget-object v1, Lcom/unity3d/services/core/api/DeviceInfo$StorageType;->EXTERNAL:Lcom/unity3d/services/core/api/DeviceInfo$StorageType;

    invoke-virtual {v1}, Lcom/unity3d/services/core/api/DeviceInfo$StorageType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    return-void
.end method
