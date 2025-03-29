.class public Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadataUtilities;
.super Ljava/lang/Object;
.source "PromoMetadataUtilities.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createItemFromMap(Ljava/util/Map;)Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;"
        }
    .end annotation

    .line 50
    invoke-static {}, Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;->newBuilder()Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;

    move-result-object v0

    const-string v1, "itemId"

    .line 51
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 52
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;->withItemId(Ljava/lang/String;)Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;

    :cond_15
    const-string v1, "quantity"

    .line 54
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 55
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;->withQuantity(J)Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;

    :cond_2a
    const-string v1, "type"

    .line 57
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 58
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;->withType(Ljava/lang/String;)Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;

    .line 60
    :cond_3b
    invoke-virtual {v0}, Lcom/unity3d/services/monetization/placementcontent/purchasing/Item$Builder;->build()Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;

    move-result-object p0

    return-object p0
.end method

.method private static createProductFromMap(Ljava/util/Map;)Lcom/unity3d/services/purchasing/core/Product;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/unity3d/services/purchasing/core/Product;"
        }
    .end annotation

    .line 64
    invoke-static {}, Lcom/unity3d/services/purchasing/core/Product;->newBuilder()Lcom/unity3d/services/purchasing/core/Product$Builder;

    move-result-object v0

    const-string v1, "productId"

    .line 65
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 66
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withProductId(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_15
    const-string v1, "isoCurrencyCode"

    .line 68
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 69
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withIsoCurrencyCode(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_26
    const-string v1, "localizedPriceString"

    .line 71
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 72
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withLocalizedPriceString(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_37
    const-string v1, "localizedDescription"

    .line 74
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_48

    .line 75
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withLocalizedDescription(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_48
    const-string v1, "localizedTitle"

    .line 77
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_59

    .line 78
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withLocalizedTitle(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_59
    const-string v1, "localizedPrice"

    .line 80
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 81
    new-instance v2, Ljava/lang/Double;

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withLocalizedPrice(D)Lcom/unity3d/services/purchasing/core/Product$Builder;

    :cond_75
    const-string v1, "productType"

    .line 83
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_86

    .line 84
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/unity3d/services/purchasing/core/Product$Builder;->withProductType(Ljava/lang/String;)Lcom/unity3d/services/purchasing/core/Product$Builder;

    .line 87
    :cond_86
    invoke-virtual {v0}, Lcom/unity3d/services/purchasing/core/Product$Builder;->build()Lcom/unity3d/services/purchasing/core/Product;

    move-result-object p0

    return-object p0
.end method

.method public static createPromoMetadataFromParamsMap(Ljava/util/Map;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata;"
        }
    .end annotation

    .line 12
    invoke-static {}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata;->newBuilder()Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    move-result-object v0

    const-string v1, "impressionDate"

    .line 13
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 14
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 15
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v3}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withImpressionDate(Ljava/util/Date;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    :cond_1e
    const-string v1, "offerDuration"

    .line 17
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 18
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withOfferDuration(J)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    :cond_39
    const-string v1, "costs"

    .line 20
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 21
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 22
    invoke-static {v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadataUtilities;->getItemListFromList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withCosts(Ljava/util/List;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    :cond_4e
    const-string v1, "payouts"

    .line 25
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_63

    .line 26
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 27
    invoke-static {v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadataUtilities;->getItemListFromList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withPayouts(Ljava/util/List;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    :cond_63
    const-string v1, "product"

    .line 30
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_78

    .line 31
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 32
    invoke-static {v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadataUtilities;->createProductFromMap(Ljava/util/Map;)Lcom/unity3d/services/purchasing/core/Product;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withPremiumProduct(Lcom/unity3d/services/purchasing/core/Product;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    :cond_78
    const-string v1, "userInfo"

    .line 34
    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_89

    .line 35
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-virtual {v0, p0}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->withCustomInfo(Ljava/util/Map;)Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;

    .line 37
    :cond_89
    invoke-virtual {v0}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata$Builder;->build()Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadata;

    move-result-object p0

    return-object p0
.end method

.method private static getItemListFromList(Ljava/util/List;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;",
            ">;"
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 42
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 43
    invoke-static {v1}, Lcom/unity3d/services/monetization/placementcontent/purchasing/PromoMetadataUtilities;->createItemFromMap(Ljava/util/Map;)Lcom/unity3d/services/monetization/placementcontent/purchasing/Item;

    move-result-object v1

    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_21
    return-object v0
.end method
