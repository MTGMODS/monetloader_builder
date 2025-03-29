.class public Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;
.super Ljava/lang/Object;
.source "JSONUtilities.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static jsonArrayToList(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 34
    :goto_b
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_2f

    .line 36
    :try_start_11
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;->mapTypeFromJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 37
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_1c} :catch_1d

    goto :goto_2c

    :catch_1d
    move-exception v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    .line 39
    invoke-virtual {v3}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v1

    const-string v3, "Could not put value into list: %s"

    invoke-static {v3, v4}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_2f
    return-object v0
.end method

.method public static jsonObjectToMap(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Lorg/json/JSONObject;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 20
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 21
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 23
    :try_start_19
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;->mapTypeFromJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 24
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_24} :catch_25

    goto :goto_d

    :catch_25
    move-exception v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v2, 0x1

    .line 26
    invoke-virtual {v3}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v2

    const-string v2, "Could not put value in map: %s, %s"

    invoke-static {v2, v4}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_d

    :cond_39
    return-object v0
.end method

.method public static mapToJsonObject(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 55
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 56
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 58
    :try_start_19
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;->wrap(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_2a} :catch_2b

    goto :goto_d

    :catch_2b
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 60
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    aput-object v1, v2, v3

    const-string v1, "Could not map entry to object: %s, %s"

    invoke-static {v1, v2}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_d

    :cond_42
    return-object v0
.end method

.method private static mapTypeFromJSON(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 46
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_b

    .line 47
    check-cast p0, Lorg/json/JSONObject;

    invoke-static {p0}, Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;->jsonObjectToMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    goto :goto_15

    .line 48
    :cond_b
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_15

    .line 49
    check-cast p0, Lorg/json/JSONArray;

    invoke-static {p0}, Lcom/unity3d/services/monetization/core/utilities/JSONUtilities;->jsonArrayToList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p0

    :cond_15
    :goto_15
    return-object p0
.end method

.method public static wrap(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 73
    :cond_4
    instance-of v1, p0, Lorg/json/JSONArray;

    if-nez v1, :cond_91

    instance-of v1, p0, Lorg/json/JSONObject;

    if-eqz v1, :cond_e

    goto/16 :goto_91

    .line 76
    :cond_e
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    return-object p0

    .line 80
    :cond_17
    :try_start_17
    instance-of v1, p0, Ljava/util/Collection;

    if-eqz v1, :cond_23

    .line 81
    new-instance v1, Lorg/json/JSONArray;

    check-cast p0, Ljava/util/Collection;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 82
    :cond_23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 83
    new-instance v1, Lorg/json/JSONArray;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 85
    :cond_3d
    instance-of v1, p0, Ljava/util/Map;

    if-eqz v1, :cond_49

    .line 86
    new-instance v1, Lorg/json/JSONObject;

    check-cast p0, Ljava/util/Map;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v1

    .line 88
    :cond_49
    instance-of v1, p0, Ljava/lang/Boolean;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Byte;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Character;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Double;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Float;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Integer;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Long;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/Short;

    if-nez v1, :cond_8f

    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_6e

    goto :goto_8f

    .line 99
    :cond_6e
    instance-of v1, p0, Ljava/lang/Enum;

    if-eqz v1, :cond_77

    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 102
    :cond_77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "java."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_90

    .line 103
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_8f} :catch_90

    :cond_8f
    :goto_8f
    return-object p0

    :catch_90
    :cond_90
    return-object v0

    :cond_91
    :goto_91
    return-object p0
.end method
