.class public Lcom/unity3d/services/ads/adunit/AdUnitActivity;
.super Landroid/app/Activity;
.source "AdUnitActivity.java"


# static fields
.field public static final EXTRA_ACTIVITY_ID:Ljava/lang/String; = "activityId"

.field public static final EXTRA_DISPLAY_CUTOUT_MODE:Ljava/lang/String; = "displayCutoutMode"

.field public static final EXTRA_KEEP_SCREEN_ON:Ljava/lang/String; = "keepScreenOn"

.field public static final EXTRA_KEY_EVENT_LIST:Ljava/lang/String; = "keyEvents"

.field public static final EXTRA_ORIENTATION:Ljava/lang/String; = "orientation"

.field public static final EXTRA_SYSTEM_UI_VISIBILITY:Ljava/lang/String; = "systemUiVisibility"

.field public static final EXTRA_VIEWS:Ljava/lang/String; = "views"


# instance fields
.field private _activityId:I

.field private _displayCutoutMode:I

.field _keepScreenOn:Z

.field private _keyEventList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected _layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

.field private _orientation:I

.field private _systemUiVisibility:I

.field private _viewHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;",
            ">;"
        }
    .end annotation
.end field

.field private _views:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 34
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, -0x1

    .line 46
    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    return-void
.end method

.method private createViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;
    .registers 9

    .line 520
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_55

    .line 521
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unity3d/services/core/webview/WebViewApp;->getConfiguration()Lcom/unity3d/services/core/configuration/Configuration;

    move-result-object v0

    .line 522
    invoke-virtual {v0}, Lcom/unity3d/services/core/configuration/Configuration;->getModuleConfigurationList()[Ljava/lang/String;

    move-result-object v2

    .line 524
    array-length v3, v2

    const/4 v4, 0x0

    :goto_15
    if-ge v4, v3, :cond_55

    aget-object v5, v2, v4

    .line 525
    invoke-virtual {v0, v5}, Lcom/unity3d/services/core/configuration/Configuration;->getModuleConfiguration(Ljava/lang/String;)Lcom/unity3d/services/core/configuration/IModuleConfiguration;

    move-result-object v5

    .line 526
    instance-of v6, v5, Lcom/unity3d/services/ads/configuration/IAdsModuleConfiguration;

    if-eqz v6, :cond_52

    .line 527
    check-cast v5, Lcom/unity3d/services/ads/configuration/IAdsModuleConfiguration;

    invoke-interface {v5}, Lcom/unity3d/services/ads/configuration/IAdsModuleConfiguration;->getAdUnitViewHandlers()Ljava/util/Map;

    move-result-object v5

    if-eqz v5, :cond_52

    .line 528
    invoke-interface {v5, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_52

    .line 531
    :try_start_2f
    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_3b} :catch_3d

    move-object v1, v0

    goto :goto_51

    .line 534
    :catch_3d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error creating view: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    :goto_51
    return-object v1

    :cond_52
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_55
    return-object v1
.end method

.method private handleViewPlacement(Landroid/view/View;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_c

    .line 402
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    const-string p1, "Could not place view because it is null, finishing activity"

    .line 403
    invoke-static {p1}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    return v0

    .line 407
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_24

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 408
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {v0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->bringChildToFront(Landroid/view/View;)V

    goto :goto_3d

    .line 411
    :cond_24
    invoke-static {p1}, Lcom/unity3d/services/core/misc/ViewUtilities;->removeViewFromParent(Landroid/view/View;)V

    .line 412
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xd

    .line 413
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 414
    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 415
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 416
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {v0, p1, v1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_3d
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method protected createLayout()V
    .registers 4

    .line 510
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    if-eqz v0, :cond_5

    return-void

    .line 514
    :cond_5
    new-instance v0, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-direct {v0, p0}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    .line 515
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 516
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, -0x1000000

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-static {v0, v1}, Lcom/unity3d/services/core/misc/ViewUtilities;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public getLayout()Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;
    .registers 2

    .line 124
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    return-object v0
.end method

.method public getViewFrame(Ljava/lang/String;)Ljava/util/Map;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 334
    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v0

    const-string v1, "adunit"

    .line 337
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v1, "height"

    const-string v2, "width"

    const-string v3, "y"

    const-string v4, "x"

    if-eqz p1, :cond_4e

    .line 338
    iget-object p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {p1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 339
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 340
    iget v5, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    iget p1, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    iget-object p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {p1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->getWidth()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    iget-object p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {p1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->getHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_4e
    const/4 p1, 0x0

    if-eqz v0, :cond_56

    .line 347
    invoke-interface {v0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->getView()Landroid/view/View;

    move-result-object v0

    goto :goto_57

    :cond_56
    move-object v0, p1

    :goto_57
    if-eqz v0, :cond_8d

    .line 351
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 352
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 353
    iget v6, p1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    iget p1, p1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v5, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v5, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v5, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v5

    :cond_8d
    return-object p1
.end method

.method public getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;
    .registers 4

    .line 472
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_13

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 473
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    goto :goto_2a

    .line 476
    :cond_13
    invoke-direct {p0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->createViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 479
    iget-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-nez v1, :cond_24

    .line 480
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    .line 483
    :cond_24
    iget-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_29
    move-object p1, v0

    :goto_2a
    return-object p1
.end method

.method public getViews()[Ljava/lang/String;
    .registers 2

    .line 423
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 11

    .line 56
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 60
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_12

    const-string p1, "Unity Ads web app is null, closing Unity Ads activity from onCreate"

    .line 61
    invoke-static {p1}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    return-void

    .line 66
    :cond_12
    invoke-static {p0}, Lcom/unity3d/services/ads/api/AdUnit;->setAdUnitActivity(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    .line 67
    invoke-static {p0}, Lcom/unity3d/services/core/api/Intent;->setActiveActivity(Landroid/app/Activity;)V

    .line 69
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->createLayout()V

    .line 71
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-static {v0}, Lcom/unity3d/services/core/misc/ViewUtilities;->removeViewFromParent(Landroid/view/View;)V

    .line 72
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {v0}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "keyEvents"

    const-string v1, "views"

    const-string v2, "displayCutoutMode"

    const-string v3, "activityId"

    const-string v4, "systemUiVisibility"

    const-string v5, "orientation"

    const/4 v6, -0x1

    const/4 v7, 0x0

    if-nez p1, :cond_a0

    .line 77
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    invoke-virtual {v8, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    .line 78
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keyEventList:Ljava/util/ArrayList;

    .line 80
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 81
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    .line 83
    :cond_61
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_75

    .line 84
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_systemUiVisibility:I

    .line 86
    :cond_75
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_89

    .line 87
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    .line 89
    :cond_89
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9d

    .line 90
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_displayCutoutMode:I

    .line 93
    :cond_9d
    sget-object v0, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_CREATE:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    goto :goto_d3

    .line 95
    :cond_a0
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    .line 96
    invoke-virtual {p1, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    .line 97
    invoke-virtual {p1, v4, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_systemUiVisibility:I

    .line 98
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keyEventList:Ljava/util/ArrayList;

    const-string v0, "keepScreenOn"

    .line 99
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keepScreenOn:Z

    .line 100
    invoke-virtual {p1, v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    .line 101
    invoke-virtual {p1, v2, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_displayCutoutMode:I

    .line 102
    iget-boolean v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keepScreenOn:Z

    invoke-virtual {p0, v0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setKeepScreenOn(Z)Z

    .line 103
    sget-object v0, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_RESTORE:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    .line 106
    :goto_d3
    iget v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setOrientation(I)V

    .line 107
    iget v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_systemUiVisibility:I

    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setSystemUiVisibility(I)Z

    .line 108
    iget v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_displayCutoutMode:I

    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setLayoutInDisplayCutoutMode(I)V

    .line 110
    iget-object v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    if-eqz v1, :cond_f8

    .line 111
    array-length v2, v1

    const/4 v3, 0x0

    :goto_e8
    if-ge v3, v2, :cond_f8

    aget-object v4, v1, v3

    .line 112
    invoke-virtual {p0, v4}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v4

    if-eqz v4, :cond_f5

    .line 115
    invoke-interface {v4, p0, p1}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onCreate(Lcom/unity3d/services/ads/adunit/AdUnitActivity;Landroid/os/Bundle;)V

    :cond_f5
    add-int/lit8 v3, v3, 0x1

    goto :goto_e8

    .line 120
    :cond_f8
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object p1

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-virtual {p1, v1, v0, v2}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method protected onDestroy()V
    .registers 7

    .line 241
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 243
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_18

    .line 244
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "Unity Ads web app is null, closing Unity Ads activity from onDestroy"

    .line 245
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 246
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    :cond_17
    return-void

    .line 251
    :cond_18
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_DESTROY:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    .line 253
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_62

    .line 254
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_46
    :goto_46
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 255
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_46

    .line 256
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    invoke-interface {v1, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onDestroy(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    goto :goto_46

    .line 261
    :cond_62
    invoke-static {}, Lcom/unity3d/services/ads/api/AdUnit;->getCurrentAdUnitActivityId()I

    move-result v0

    iget v1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    if-ne v0, v1, :cond_6e

    const/4 v0, 0x0

    .line 262
    invoke-static {v0}, Lcom/unity3d/services/ads/api/AdUnit;->setAdUnitActivity(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    .line 265
    :cond_6e
    invoke-static {p0}, Lcom/unity3d/services/core/api/Intent;->removeActiveActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 10

    .line 270
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keyEventList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_4d

    .line 271
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 272
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v3, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->KEY_DOWN:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 v1, 0x1

    aput-object p1, v4, v1

    const/4 p1, 0x2

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, p1

    const/4 p1, 0x3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, p1

    const/4 p1, 0x4

    iget p2, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, p1

    invoke-virtual {v0, v2, v3, v4}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    :cond_4d
    return v1
.end method

.method protected onPause()V
    .registers 7

    .line 200
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 202
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_18

    .line 203
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "Unity Ads web app is null, closing Unity Ads activity from onPause"

    .line 204
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 205
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    :cond_17
    return-void

    .line 210
    :cond_18
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unity3d/services/core/webview/WebViewApp;->getWebView()Lcom/unity3d/services/core/webview/WebView;

    move-result-object v0

    if-nez v0, :cond_28

    const-string v0, "Unity Ads web view is null, from onPause"

    .line 211
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->warning(Ljava/lang/String;)V

    goto :goto_39

    .line 212
    :cond_28
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 213
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unity3d/services/core/webview/WebViewApp;->getWebView()Lcom/unity3d/services/core/webview/WebView;

    move-result-object v0

    invoke-static {v0}, Lcom/unity3d/services/core/misc/ViewUtilities;->removeViewFromParent(Landroid/view/View;)V

    .line 216
    :cond_39
    :goto_39
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_61

    .line 217
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_45
    :goto_45
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 218
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_45

    .line 219
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    invoke-interface {v1, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onPause(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    goto :goto_45

    .line 224
    :cond_61
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_PAUSE:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 11

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 293
    :try_start_2
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 294
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 296
    array-length v4, p2

    const/4 v5, 0x0

    :goto_e
    if-ge v5, v4, :cond_18

    aget-object v6, p2, v5

    .line 297
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 300
    :cond_18
    array-length p2, p3

    const/4 v4, 0x0

    :goto_1a
    if-ge v4, p2, :cond_24

    aget v5, p3, v4

    .line 301
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1a

    .line 304
    :cond_24
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object p2

    sget-object p3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PERMISSIONS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v4, Lcom/unity3d/services/ads/adunit/PermissionsEvent;->PERMISSIONS_RESULT:Lcom/unity3d/services/ads/adunit/PermissionsEvent;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v0

    aput-object v2, v5, v1

    const/4 p1, 0x2

    aput-object v3, v5, p1

    invoke-virtual {p2, p3, v4, v5}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3d} :catch_3e

    goto :goto_52

    :catch_3e
    move-exception p1

    .line 307
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object p2

    sget-object p3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->PERMISSIONS:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/PermissionsEvent;->PERMISSIONS_ERROR:Lcom/unity3d/services/ads/adunit/PermissionsEvent;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v0

    invoke-virtual {p2, p3, v2, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    :goto_52
    return-void
.end method

.method protected onResume()V
    .registers 7

    .line 175
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 177
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_18

    .line 178
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "Unity Ads web app is null, closing Unity Ads activity from onResume"

    .line 179
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 180
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    :cond_17
    return-void

    .line 185
    :cond_18
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setViews([Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_45

    .line 188
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_29
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_45

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 189
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_29

    .line 190
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    invoke-interface {v1, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onResume(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    goto :goto_29

    .line 195
    :cond_45
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_RESUME:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    .line 229
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 231
    iget v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    const-string v1, "orientation"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 232
    iget v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_systemUiVisibility:I

    const-string v1, "systemUiVisibility"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 233
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keyEventList:Ljava/util/ArrayList;

    const-string v1, "keyEvents"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 234
    iget-boolean v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keepScreenOn:Z

    const-string v1, "keepScreenOn"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 235
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    const-string v1, "views"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 236
    iget v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    const-string v1, "activityId"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method protected onStart()V
    .registers 7

    .line 129
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 131
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_18

    .line 132
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "Unity Ads web app is null, closing Unity Ads activity from onStart"

    .line 133
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    :cond_17
    return-void

    .line 139
    :cond_18
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_40

    .line 140
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_24
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 141
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_24

    .line 142
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    invoke-interface {v1, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onStart(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    goto :goto_24

    .line 147
    :cond_40
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_START:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method protected onStop()V
    .registers 7

    .line 152
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 154
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    if-nez v0, :cond_18

    .line 155
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_17

    const-string v0, "Unity Ads web app is null, closing Unity Ads activity from onStop"

    .line 156
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    .line 157
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->finish()V

    :cond_17
    return-void

    .line 162
    :cond_18
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_viewHandlers:Ljava/util/Map;

    if-eqz v0, :cond_40

    .line 163
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_24
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 164
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_24

    .line 165
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    invoke-interface {v1, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->onStop(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)V

    goto :goto_24

    .line 170
    :cond_40
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_STOP:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_1a

    .line 283
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v2

    sget-object v3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v4, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_FOCUS_GAINED:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v0

    invoke-virtual {v2, v3, v4, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto :goto_2f

    .line 285
    :cond_1a
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v2

    sget-object v3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->ADUNIT:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v4, Lcom/unity3d/services/ads/adunit/AdUnitEvent;->ON_FOCUS_LOST:Lcom/unity3d/services/ads/adunit/AdUnitEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget v5, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_activityId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v0

    invoke-virtual {v2, v3, v4, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    .line 287
    :goto_2f
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public setKeepScreenOn(Z)Z
    .registers 3

    .line 433
    iput-boolean p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keepScreenOn:Z

    .line 436
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 p1, 0x0

    return p1

    :cond_a
    const/16 v0, 0x80

    if-eqz p1, :cond_16

    .line 440
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1d

    .line 442
    :cond_16
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    :goto_1d
    const/4 p1, 0x1

    return p1
.end method

.method public setKeyEventList(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 466
    iput-object p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_keyEventList:Ljava/util/ArrayList;

    return-void
.end method

.method public setLayoutInDisplayCutoutMode(I)V
    .registers 7

    .line 491
    iput p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_displayCutoutMode:I

    .line 494
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_3b

    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_3b

    .line 495
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 497
    :try_start_18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "layoutInDisplayCutoutMode"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 498
    invoke-virtual {v3, v0, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_18 .. :try_end_25} :catch_31
    .catch Ljava/lang/NoSuchFieldException; {:try_start_18 .. :try_end_25} :catch_26

    goto :goto_3b

    :catch_26
    move-exception p1

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "Error getting layoutInDisplayCutoutMode"

    .line 502
    invoke-static {p1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3b

    :catch_31
    move-exception p1

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "Error setting layoutInDisplayCutoutMode"

    .line 500
    invoke-static {p1, v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3b
    :goto_3b
    return-void
.end method

.method public setOrientation(I)V
    .registers 2

    .line 427
    iput p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_orientation:I

    .line 428
    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->setRequestedOrientation(I)V

    return-void
.end method

.method public setSystemUiVisibility(I)Z
    .registers 5

    .line 449
    iput p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_systemUiVisibility:I

    .line 451
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0xb

    if-lt v0, v2, :cond_1c

    .line 453
    :try_start_9
    invoke-virtual {p0}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_14} :catch_16

    const/4 p1, 0x1

    return p1

    :catch_16
    move-exception p1

    const-string v0, "Error while setting SystemUIVisibility"

    .line 457
    invoke-static {v0, p1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_1c
    return v1
.end method

.method public setViewFrame(Ljava/lang/String;IIII)V
    .registers 8

    .line 314
    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v0

    const-string v1, "adunit"

    .line 317
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v1, 0x0

    if-eqz p1, :cond_1b

    .line 318
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p1, p4, p5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 319
    invoke-virtual {p1, p2, p3, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 320
    iget-object v0, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_layout:Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;

    invoke-virtual {v0, p1}, Lcom/unity3d/services/ads/adunit/AdUnitRelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_22

    :cond_1b
    if-eqz v0, :cond_22

    .line 323
    invoke-interface {v0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->getView()Landroid/view/View;

    move-result-object p1

    goto :goto_23

    :cond_22
    :goto_22
    const/4 p1, 0x0

    :goto_23
    if-eqz p1, :cond_30

    .line 327
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p4, p5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 328
    invoke-virtual {v0, p2, p3, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 329
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_30
    return-void
.end method

.method public setViews([Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_5

    new-array p1, v0, [Ljava/lang/String;

    .line 371
    :cond_5
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 373
    iget-object v2, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    if-nez v2, :cond_16

    new-array v2, v0, [Ljava/lang/String;

    .line 374
    iput-object v2, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    .line 377
    :cond_16
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 378
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 380
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 381
    invoke-virtual {p0, v2}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v2

    .line 382
    invoke-interface {v2}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->destroy()Z

    goto :goto_28

    .line 385
    :cond_3c
    iput-object p1, p0, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->_views:[Ljava/lang/String;

    .line 387
    array-length v1, p1

    :goto_3f
    if-ge v0, v1, :cond_5b

    aget-object v2, p1, v0

    if-nez v2, :cond_46

    goto :goto_58

    .line 392
    :cond_46
    invoke-virtual {p0, v2}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->getViewHandler(Ljava/lang/String;)Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;

    move-result-object v2

    .line 393
    invoke-interface {v2, p0}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->create(Lcom/unity3d/services/ads/adunit/AdUnitActivity;)Z

    .line 394
    invoke-interface {v2}, Lcom/unity3d/services/ads/adunit/IAdUnitViewHandler;->getView()Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/unity3d/services/ads/adunit/AdUnitActivity;->handleViewPlacement(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_58

    return-void

    :cond_58
    :goto_58
    add-int/lit8 v0, v0, 0x1

    goto :goto_3f

    :cond_5b
    return-void
.end method
