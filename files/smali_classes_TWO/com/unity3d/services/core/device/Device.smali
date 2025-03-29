.class public Lcom/unity3d/services/core/device/Device;
.super Ljava/lang/Object;
.source "Device.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unity3d/services/core/device/Device$MemoryInfoType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAdvertisingTrackingId()Ljava/lang/String;
    .registers 1

    .line 89
    invoke-static {}, Lcom/unity3d/services/core/device/AdvertisingId;->getAdvertisingTrackingId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAndroidId()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .line 79
    :try_start_0
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_16

    :catch_f
    move-exception v0

    const-string v1, "Problems fetching androidId"

    .line 82
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    :goto_16
    return-object v0
.end method

.method public static getApiLevel()I
    .registers 1

    .line 51
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public static getApkDigest()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 482
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageCodePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 485
    :try_start_9
    new-instance v2, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_13
    .catchall {:try_start_9 .. :try_end_13} :catchall_1e

    .line 486
    :try_start_13
    invoke-static {v2}, Lcom/unity3d/services/core/misc/Utilities;->Sha256(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_1b

    .line 491
    :try_start_17
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1a} :catch_1a

    :catch_1a
    return-object v0

    :catchall_1b
    move-exception v0

    move-object v1, v2

    goto :goto_1f

    :catchall_1e
    move-exception v0

    :goto_1f
    if-eqz v1, :cond_24

    :try_start_21
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_24} :catch_24

    .line 494
    :catch_24
    :cond_24
    throw v0
.end method

.method public static getBatteryLevel()F
    .registers 4

    .line 317
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 318
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_29

    const-string v1, "level"

    const/4 v2, -0x1

    .line 321
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "scale"

    .line 322
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    int-to-float v1, v1

    int-to-float v0, v0

    div-float/2addr v1, v0

    return v1

    :cond_29
    const/high16 v0, -0x40800000    # -1.0f

    return v0
.end method

.method public static getBatteryStatus()I
    .registers 5

    .line 332
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_20

    .line 333
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x0

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_20

    const-string v2, "status"

    .line 336
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0

    :cond_20
    return v1
.end method

.method public static getBoard()Ljava/lang/String;
    .registers 1

    .line 521
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    return-object v0
.end method

.method public static getBootloader()Ljava/lang/String;
    .registers 1

    .line 525
    sget-object v0, Landroid/os/Build;->BOOTLOADER:Ljava/lang/String;

    return-object v0
.end method

.method public static getBrand()Ljava/lang/String;
    .registers 1

    .line 529
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    return-object v0
.end method

.method public static getBuildId()Ljava/lang/String;
    .registers 1

    .line 593
    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    return-object v0
.end method

.method public static getBuildVersionIncremental()Ljava/lang/String;
    .registers 1

    .line 597
    sget-object v0, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    return-object v0
.end method

.method public static getCPUCount()J
    .registers 2

    .line 581
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public static getCertificateFingerprint()Ljava/lang/String;
    .registers 5

    .line 501
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 502
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x40

    const/4 v3, 0x0

    .line 504
    :try_start_13
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 505
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v0, :cond_51

    .line 506
    array-length v1, v0

    const/4 v2, 0x1

    if-lt v1, v2, :cond_51

    const-string v1, "X.509"

    .line 507
    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 508
    new-instance v2, Ljava/io/ByteArrayInputStream;

    const/4 v4, 0x0

    aget-object v0, v0, v4

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 509
    invoke-virtual {v1, v2}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    const-string v1, "SHA-1"

    .line 510
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 511
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 512
    invoke-static {v0}, Lcom/unity3d/services/core/misc/Utilities;->toHexString([B)Ljava/lang/String;

    move-result-object v0
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_49} :catch_4b

    move-object v3, v0

    goto :goto_51

    :catch_4b
    move-exception v0

    const-string v1, "Exception when signing certificate fingerprint"

    .line 515
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_51
    :goto_51
    return-object v3
.end method

.method public static getDevice()Ljava/lang/String;
    .registers 1

    .line 533
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    return-object v0
.end method

.method public static getDisplayMetricDensity()F
    .registers 1

    .line 183
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 184
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    return v0

    :cond_15
    const/high16 v0, -0x40800000    # -1.0f

    return v0
.end method

.method public static getElapsedRealtime()J
    .registers 2

    .line 589
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFingerprint()Ljava/lang/String;
    .registers 1

    .line 549
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    return-object v0
.end method

.method public static getFreeMemory()J
    .registers 2

    .line 348
    sget-object v0, Lcom/unity3d/services/core/device/Device$MemoryInfoType;->FREE_MEMORY:Lcom/unity3d/services/core/device/Device$MemoryInfoType;

    invoke-static {v0}, Lcom/unity3d/services/core/device/Device;->getMemoryInfo(Lcom/unity3d/services/core/device/Device$MemoryInfoType;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFreeSpace(Ljava/io/File;)J
    .registers 5

    if-eqz p0, :cond_16

    .line 301
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 302
    invoke-virtual {p0}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    long-to-float p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    :cond_16
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static getGLVersion()Ljava/lang/String;
    .registers 2

    .line 465
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 466
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    if-eqz v0, :cond_1f

    .line 469
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 472
    invoke-virtual {v0}, Landroid/content/pm/ConfigurationInfo;->getGlEsVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getHardware()Ljava/lang/String;
    .registers 1

    .line 537
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    return-object v0
.end method

.method public static getHost()Ljava/lang/String;
    .registers 1

    .line 541
    sget-object v0, Landroid/os/Build;->HOST:Ljava/lang/String;

    return-object v0
.end method

.method public static getManufacturer()Ljava/lang/String;
    .registers 1

    .line 59
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method

.method private static getMemoryInfo(Lcom/unity3d/services/core/device/Device$MemoryInfoType;)J
    .registers 7

    const-string v0, "Error closing RandomAccessFile"

    .line 354
    sget-object v1, Lcom/unity3d/services/core/device/Device$1;->$SwitchMap$com$unity3d$services$core$device$Device$MemoryInfoType:[I

    invoke-virtual {p0}, Lcom/unity3d/services/core/device/Device$MemoryInfoType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v3, :cond_12

    if-eq v1, v2, :cond_13

    const/4 v2, -0x1

    goto :goto_13

    :cond_12
    const/4 v2, 0x1

    :cond_13
    :goto_13
    const/4 v1, 0x0

    .line 369
    :try_start_14
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v4, "/proc/meminfo"

    const-string v5, "r"

    invoke-direct {v3, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_1d} :catch_38
    .catchall {:try_start_14 .. :try_end_1d} :catchall_36

    const/4 v4, 0x0

    :goto_1e
    if-ge v4, v2, :cond_27

    .line 372
    :try_start_20
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 374
    :cond_27
    invoke-static {v1}, Lcom/unity3d/services/core/device/Device;->getMemoryValueFromString(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_2b} :catch_34
    .catchall {:try_start_20 .. :try_end_2b} :catchall_5a

    .line 379
    :try_start_2b
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_2f

    goto :goto_33

    :catch_2f
    move-exception p0

    .line 381
    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_33
    return-wide v1

    :catch_34
    move-exception v1

    goto :goto_3b

    :catchall_36
    move-exception p0

    goto :goto_5c

    :catch_38
    move-exception v2

    move-object v3, v1

    move-object v1, v2

    .line 376
    :goto_3b
    :try_start_3b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while reading memory info: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_4f
    .catchall {:try_start_3b .. :try_end_4f} :catchall_5a

    .line 379
    :try_start_4f
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_52} :catch_53

    goto :goto_57

    :catch_53
    move-exception p0

    .line 381
    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_57
    const-wide/16 v0, -0x1

    return-wide v0

    :catchall_5a
    move-exception p0

    move-object v1, v3

    .line 379
    :goto_5c
    :try_start_5c
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_60

    goto :goto_64

    :catch_60
    move-exception v1

    .line 381
    invoke-static {v0, v1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 382
    :goto_64
    goto :goto_66

    :goto_65
    throw p0

    :goto_66
    goto :goto_65
.end method

.method private static getMemoryValueFromString(Ljava/lang/String;)J
    .registers 3

    if-eqz p0, :cond_1f

    const-string v0, "(\\d+)"

    .line 390
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 391
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, ""

    .line 394
    :goto_e
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v0, 0x1

    .line 395
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 398
    :cond_1a
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    :cond_1f
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static getModel()Ljava/lang/String;
    .registers 1

    .line 63
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public static getNetworkCountryISO()Ljava/lang/String;
    .registers 2

    .line 174
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 175
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 176
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_17
    const-string v0, ""

    return-object v0
.end method

.method public static getNetworkMetered()Z
    .registers 3

    .line 145
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_21

    .line 146
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_1c

    return v1

    .line 151
    :cond_1c
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    return v0

    :cond_21
    return v1
.end method

.method public static getNetworkOperator()Ljava/lang/String;
    .registers 2

    .line 157
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 158
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 159
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_17
    const-string v0, ""

    return-object v0
.end method

.method public static getNetworkOperatorName()Ljava/lang/String;
    .registers 2

    .line 165
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 166
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 167
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_17
    const-string v0, ""

    return-object v0
.end method

.method public static getNetworkType()I
    .registers 2

    .line 130
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 131
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 133
    :try_start_12
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v0
    :try_end_16
    .catch Ljava/lang/SecurityException; {:try_start_12 .. :try_end_16} :catch_17

    return v0

    :catch_17
    const-string v0, "Unity Ads was not able to get current network type due to missing permission"

    .line 135
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->warning(Ljava/lang/String;)V

    :cond_1c
    const/4 v0, -0x1

    return v0
.end method

.method private static getNewAbiList()Ljava/util/ArrayList;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 610
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 611
    sget-object v1, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method private static getOldAbiList()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 601
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 602
    sget-object v1, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 603
    sget-object v1, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static getOpenAdvertisingTrackingId()Ljava/lang/String;
    .registers 1

    .line 97
    invoke-static {}, Lcom/unity3d/services/core/device/OpenAdvertisingId;->getOpenAdvertisingTrackingId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOsVersion()Ljava/lang/String;
    .registers 1

    .line 55
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public static getProcessInfo()Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "Error closing RandomAccessFile"

    .line 617
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x0

    .line 621
    :try_start_8
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v4, "/proc/self/stat"

    const-string v5, "r"

    invoke-direct {v3, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_11} :catch_22
    .catchall {:try_start_8 .. :try_end_11} :catchall_20

    .line 622
    :try_start_11
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    move-result-object v2

    const-string v4, "stat"

    .line 623
    invoke-virtual {v1, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_1a} :catch_1e
    .catchall {:try_start_11 .. :try_end_1a} :catchall_34

    .line 628
    :try_start_1a
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_2f

    goto :goto_33

    :catch_1e
    move-exception v2

    goto :goto_26

    :catchall_20
    move-exception v1

    goto :goto_36

    :catch_22
    move-exception v3

    move-object v6, v3

    move-object v3, v2

    move-object v2, v6

    :goto_26
    :try_start_26
    const-string v4, "Error while reading processor info: "

    .line 625
    invoke-static {v4, v2}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2b
    .catchall {:try_start_26 .. :try_end_2b} :catchall_34

    .line 628
    :try_start_2b
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_2f

    goto :goto_33

    :catch_2f
    move-exception v2

    .line 630
    invoke-static {v0, v2}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_33
    return-object v1

    :catchall_34
    move-exception v1

    move-object v2, v3

    .line 628
    :goto_36
    :try_start_36
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_3a

    goto :goto_3e

    :catch_3a
    move-exception v2

    .line 630
    invoke-static {v0, v2}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 631
    :goto_3e
    throw v1
.end method

.method public static getProduct()Ljava/lang/String;
    .registers 1

    .line 545
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    return-object v0
.end method

.method public static getRingerMode()I
    .registers 2

    .line 254
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 255
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz v0, :cond_19

    .line 258
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    return v0

    :cond_19
    const/4 v0, -0x2

    return v0

    :cond_1b
    const/4 v0, -0x1

    return v0
.end method

.method public static getScreenBrightness()I
    .registers 3

    .line 293
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_16

    .line 294
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "screen_brightness"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0

    :cond_16
    return v1
.end method

.method public static getScreenDensity()I
    .registers 1

    .line 191
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 192
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    return v0

    :cond_15
    const/4 v0, -0x1

    return v0
.end method

.method public static getScreenHeight()I
    .registers 1

    .line 207
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 208
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    return v0

    :cond_15
    const/4 v0, -0x1

    return v0
.end method

.method public static getScreenLayout()I
    .registers 1

    .line 67
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 68
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    return v0

    :cond_15
    const/4 v0, -0x1

    return v0
.end method

.method public static getScreenWidth()I
    .registers 1

    .line 199
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 200
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v0

    :cond_15
    const/4 v0, -0x1

    return v0
.end method

.method public static getSensorList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/hardware/Sensor;",
            ">;"
        }
    .end annotation

    .line 562
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 563
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    const/4 v1, -0x1

    .line 564
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_18
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getStreamMaxVolume(I)I
    .registers 3

    .line 280
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 281
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz v0, :cond_19

    .line 284
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p0

    return p0

    :cond_19
    const/4 p0, -0x2

    return p0

    :cond_1b
    const/4 p0, -0x1

    return p0
.end method

.method public static getStreamVolume(I)I
    .registers 3

    .line 267
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 268
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz v0, :cond_19

    .line 271
    invoke-virtual {v0, p0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p0

    return p0

    :cond_19
    const/4 p0, -0x2

    return p0

    :cond_1b
    const/4 p0, -0x1

    return p0
.end method

.method public static getSupportedAbis()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 553
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->getApiLevel()I

    move-result v0

    const/16 v1, 0x15

    if-ge v0, v1, :cond_d

    .line 554
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->getOldAbiList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0

    .line 557
    :cond_d
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->getNewAbiList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p1, :cond_7

    .line 247
    invoke-static {p0, p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 250
    :cond_7
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTotalMemory()J
    .registers 2

    .line 344
    sget-object v0, Lcom/unity3d/services/core/device/Device$MemoryInfoType;->TOTAL_MEMORY:Lcom/unity3d/services/core/device/Device$MemoryInfoType;

    invoke-static {v0}, Lcom/unity3d/services/core/device/Device;->getMemoryInfo(Lcom/unity3d/services/core/device/Device$MemoryInfoType;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getTotalSpace(Ljava/io/File;)J
    .registers 5

    if-eqz p0, :cond_16

    .line 309
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 310
    invoke-virtual {p0}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    long-to-float p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    :cond_16
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static getUniqueEventId()Ljava/lang/String;
    .registers 1

    .line 228
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUptime()J
    .registers 2

    .line 585
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static isActiveNetworkConnected()Z
    .registers 3

    .line 215
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    .line 216
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_22

    .line 219
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 220
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v1, 0x1

    :cond_22
    return v1
.end method

.method public static isAdbEnabled()Ljava/lang/Boolean;
    .registers 2

    .line 415
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->getApiLevel()I

    move-result v0

    const/16 v1, 0x11

    if-ge v0, v1, :cond_d

    .line 416
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->oldAdbStatus()Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_11

    .line 418
    :cond_d
    invoke-static {}, Lcom/unity3d/services/core/device/Device;->newAdbStatus()Ljava/lang/Boolean;

    move-result-object v0

    :goto_11
    return-object v0
.end method

.method public static isLimitAdTrackingEnabled()Z
    .registers 1

    .line 93
    invoke-static {}, Lcom/unity3d/services/core/device/AdvertisingId;->getLimitedAdTracking()Z

    move-result v0

    return v0
.end method

.method public static isLimitOpenAdTrackingEnabled()Z
    .registers 1

    .line 101
    invoke-static {}, Lcom/unity3d/services/core/device/OpenAdvertisingId;->getLimitedOpenAdTracking()Z

    move-result v0

    return v0
.end method

.method public static isRooted()Z
    .registers 2

    :try_start_0
    const-string v0, "su"

    .line 406
    invoke-static {v0}, Lcom/unity3d/services/core/device/Device;->searchPathForBinary(Ljava/lang/String;)Z

    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    return v0

    :catch_7
    move-exception v0

    const-string v1, "Rooted check failed"

    .line 408
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static isUSBConnected()Z
    .registers 5

    .line 571
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    .line 572
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x0

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "android.hardware.usb.action.USB_STATE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_20

    const-string v2, "connected"

    .line 574
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0

    :cond_20
    return v1
.end method

.method public static isUsingWifi()Z
    .registers 5

    .line 107
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    .line 108
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "connectivity"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_16

    return v1

    .line 114
    :cond_16
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 117
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    if-eqz v3, :cond_49

    .line 118
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_49

    if-nez v2, :cond_3b

    goto :goto_49

    .line 122
    :cond_3b
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_49

    .line 123
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_49

    const/4 v1, 0x1

    :cond_49
    :goto_49
    return v1
.end method

.method public static isWiredHeadsetOn()Z
    .registers 2

    .line 233
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 234
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 239
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    return v0

    :cond_17
    const/4 v0, 0x0

    return v0
.end method

.method private static newAdbStatus()Ljava/lang/Boolean;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 438
    :try_start_0
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "adb_enabled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_13

    const/4 v2, 0x1

    :cond_13
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    goto :goto_1f

    :catch_18
    move-exception v0

    const-string v1, "Problems fetching adb enabled status"

    .line 441
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    :goto_1f
    return-object v0
.end method

.method private static oldAdbStatus()Ljava/lang/Boolean;
    .registers 3

    .line 426
    :try_start_0
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "adb_enabled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_13

    const/4 v2, 0x1

    :cond_13
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    goto :goto_1f

    :catch_18
    move-exception v0

    const-string v1, "Problems fetching adb enabled status"

    .line 429
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    :goto_1f
    return-object v0
.end method

.method private static searchPathForBinary(Ljava/lang/String;)Z
    .registers 9

    const-string v0, "PATH"

    .line 447
    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 448
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v1, :cond_42

    aget-object v4, v0, v3

    .line 449
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 450
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3f

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 451
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_3f

    .line 453
    array-length v5, v4

    const/4 v6, 0x0

    :goto_2c
    if-ge v6, v5, :cond_3f

    aget-object v7, v4, v6

    .line 454
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3c

    const/4 p0, 0x1

    return p0

    :cond_3c
    add-int/lit8 v6, v6, 0x1

    goto :goto_2c

    :cond_3f
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_42
    return v2
.end method
