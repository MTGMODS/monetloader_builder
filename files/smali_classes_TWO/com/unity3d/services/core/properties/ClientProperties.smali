.class public Lcom/unity3d/services/core/properties/ClientProperties;
.super Ljava/lang/Object;
.source "ClientProperties.java"


# static fields
.field private static final DEBUG_CERT:Ljavax/security/auth/x500/X500Principal;

.field private static _activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static _application:Landroid/app/Application;

.field private static _applicationContext:Landroid/content/Context;

.field private static _gameId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 27
    new-instance v0, Ljavax/security/auth/x500/X500Principal;

    const-string v1, "CN=Android Debug,O=Android,C=US"

    invoke-direct {v0, v1}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->DEBUG_CERT:Ljavax/security/auth/x500/X500Principal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static areClassesPresent(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 9

    const-string v0, "found"

    const-string v1, "class"

    if-nez p0, :cond_c

    .line 139
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    .line 141
    :cond_c
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 143
    :goto_13
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_40

    .line 144
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 147
    :try_start_1e
    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_26} :catch_27

    goto :goto_29

    :catch_27
    const-string v6, ""

    .line 150
    :goto_29
    :try_start_29
    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 151
    invoke-virtual {v5, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v7, 0x1

    .line 152
    invoke-virtual {v5, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_33} :catch_34

    goto :goto_3a

    .line 155
    :catch_34
    :try_start_34
    invoke-virtual {v5, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    invoke-virtual {v5, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_3a} :catch_3a

    .line 160
    :catch_3a
    :goto_3a
    :try_start_3a
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3d} :catch_3d

    :catch_3d
    add-int/lit8 v4, v4, 0x1

    goto :goto_13

    :cond_40
    return-object v2
.end method

.method public static getActivity()Landroid/app/Activity;
    .registers 1

    .line 35
    sget-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public static getAppName()Ljava/lang/String;
    .registers 1

    .line 67
    sget-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAppVersion()Ljava/lang/String;
    .registers 4

    .line 71
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 72
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    .line 75
    :try_start_11
    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-nez v3, :cond_1c

    const-string v0, "FakeVersionName"

    return-object v0

    .line 79
    :cond_1c
    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_22
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_11 .. :try_end_22} :catch_23

    return-object v0

    :catch_23
    move-exception v0

    const-string v1, "Error getting package info"

    .line 81
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getApplication()Landroid/app/Application;
    .registers 1

    .line 51
    sget-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_application:Landroid/app/Application;

    return-object v0
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .registers 1

    .line 43
    sget-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getGameId()Ljava/lang/String;
    .registers 1

    .line 59
    sget-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_gameId:Ljava/lang/String;

    return-object v0
.end method

.method public static isAppDebuggable()Z
    .registers 8

    const-string v0, "Could not find name"

    .line 92
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_70

    .line 93
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 94
    invoke-static {}, Lcom/unity3d/services/core/properties/ClientProperties;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    .line 101
    :try_start_1a
    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 102
    iget v6, v5, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v6, v6, 0x2

    iput v6, v5, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_24
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1a .. :try_end_24} :catch_2b

    if-eqz v6, :cond_27

    goto :goto_28

    :cond_27
    const/4 v4, 0x0

    :goto_28
    move v5, v4

    const/4 v4, 0x0

    goto :goto_30

    :catch_2b
    move-exception v5

    .line 107
    invoke-static {v0, v5}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v5, 0x0

    :goto_30
    if-eqz v4, :cond_6f

    const/16 v4, 0x40

    .line 113
    :try_start_34
    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 114
    iget-object v1, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 116
    array-length v3, v1

    :goto_3b
    if-ge v2, v3, :cond_6f

    aget-object v4, v1, v2

    const-string v6, "X.509"

    .line 117
    invoke-static {v6}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v6

    .line 118
    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v4}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v4

    invoke-direct {v7, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 119
    invoke-virtual {v6, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 120
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    sget-object v6, Lcom/unity3d/services/core/properties/ClientProperties;->DEBUG_CERT:Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v4, v6}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_5e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_34 .. :try_end_5e} :catch_6b
    .catch Ljava/security/cert/CertificateException; {:try_start_34 .. :try_end_5e} :catch_64

    if-eqz v5, :cond_61

    goto :goto_6f

    :cond_61
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    :catch_64
    move-exception v0

    const-string v1, "Certificate exception"

    .line 129
    invoke-static {v1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_6f

    :catch_6b
    move-exception v1

    .line 126
    invoke-static {v0, v1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_6f
    :goto_6f
    return v5

    :cond_70
    return v2
.end method

.method public static setActivity(Landroid/app/Activity;)V
    .registers 2

    .line 39
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/unity3d/services/core/properties/ClientProperties;->_activity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static setApplication(Landroid/app/Application;)V
    .registers 1

    .line 55
    sput-object p0, Lcom/unity3d/services/core/properties/ClientProperties;->_application:Landroid/app/Application;

    return-void
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .registers 1

    .line 47
    sput-object p0, Lcom/unity3d/services/core/properties/ClientProperties;->_applicationContext:Landroid/content/Context;

    return-void
.end method

.method public static setGameId(Ljava/lang/String;)V
    .registers 1

    .line 63
    sput-object p0, Lcom/unity3d/services/core/properties/ClientProperties;->_gameId:Ljava/lang/String;

    return-void
.end method
