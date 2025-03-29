.class public Lcom/unity3d/services/core/webview/WebView;
.super Landroid/webkit/WebView;
.source "WebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unity3d/services/core/webview/WebView$JavaScriptInvocation;
    }
.end annotation


# static fields
.field private static _evaluateJavascript:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 9

    .line 22
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 23
    invoke-virtual {p0}, Lcom/unity3d/services/core/webview/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    .line 25
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x10

    if-lt v0, v2, :cond_14

    .line 26
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    .line 27
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 30
    :cond_14
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 32
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-lt v0, v2, :cond_3d

    .line 34
    :try_start_1f
    const-class v0, Landroid/webkit/WebView;

    const-string v2, "evaluateJavascript"

    new-array v5, v3, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v4

    const-class v6, Landroid/webkit/ValueCallback;

    aput-object v6, v5, v1

    invoke-virtual {v0, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/unity3d/services/core/webview/WebView;->_evaluateJavascript:Ljava/lang/reflect/Method;
    :try_end_33
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1f .. :try_end_33} :catch_34

    goto :goto_3d

    :catch_34
    move-exception v0

    const-string v2, "Method evaluateJavascript not found"

    .line 36
    invoke-static {v2, v0}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    const/4 v0, 0x0

    .line 37
    sput-object v0, Lcom/unity3d/services/core/webview/WebView;->_evaluateJavascript:Ljava/lang/reflect/Method;

    .line 41
    :cond_3d
    :goto_3d
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 42
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setBlockNetworkImage(Z)V

    .line 43
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setBlockNetworkLoads(Z)V

    .line 44
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 45
    invoke-virtual {p1, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 46
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 48
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_58

    .line 49
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 52
    :cond_58
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 54
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v2, :cond_62

    .line 55
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setEnableSmoothTransition(Z)V

    .line 58
    :cond_62
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 59
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 60
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 61
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setLightTouchEnabled(Z)V

    .line 62
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 63
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    .line 65
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v0, v2, :cond_7d

    .line 66
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    .line 69
    :cond_7d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_86

    .line 70
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    .line 73
    :cond_86
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setNeedInitialFocus(Z)V

    .line 74
    sget-object v0, Landroid/webkit/WebSettings$PluginState;->OFF:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 75
    sget-object v0, Landroid/webkit/WebSettings$RenderPriority;->NORMAL:Landroid/webkit/WebSettings$RenderPriority;

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setRenderPriority(Landroid/webkit/WebSettings$RenderPriority;)V

    .line 76
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 77
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 78
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 79
    invoke-virtual {p1, v4}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 80
    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 82
    invoke-virtual {p0, v4}, Lcom/unity3d/services/core/webview/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 83
    invoke-virtual {p0, v4}, Lcom/unity3d/services/core/webview/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 84
    invoke-virtual {p0, v4}, Lcom/unity3d/services/core/webview/WebView;->setInitialScale(I)V

    .line 85
    invoke-virtual {p0, v4}, Lcom/unity3d/services/core/webview/WebView;->setBackgroundColor(I)V

    .line 86
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p1, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-static {p0, p1}, Lcom/unity3d/services/core/misc/ViewUtilities;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 87
    invoke-virtual {p0, v4}, Lcom/unity3d/services/core/webview/WebView;->setBackgroundResource(I)V

    .line 89
    new-instance p1, Lcom/unity3d/services/core/webview/bridge/WebViewBridgeInterface;

    invoke-direct {p1}, Lcom/unity3d/services/core/webview/bridge/WebViewBridgeInterface;-><init>()V

    const-string v0, "webviewbridge"

    invoke-virtual {p0, p1, v0}, Lcom/unity3d/services/core/webview/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/reflect/Method;
    .registers 1

    .line 17
    sget-object v0, Lcom/unity3d/services/core/webview/WebView;->_evaluateJavascript:Ljava/lang/reflect/Method;

    return-object v0
.end method


# virtual methods
.method public invokeJavascript(Ljava/lang/String;)V
    .registers 3

    .line 93
    new-instance v0, Lcom/unity3d/services/core/webview/WebView$JavaScriptInvocation;

    invoke-direct {v0, p0, p1, p0}, Lcom/unity3d/services/core/webview/WebView$JavaScriptInvocation;-><init>(Lcom/unity3d/services/core/webview/WebView;Ljava/lang/String;Landroid/webkit/WebView;)V

    invoke-static {v0}, Lcom/unity3d/services/core/misc/Utilities;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public loadUrl(Ljava/lang/String;)V
    .registers 4

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Loading url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    .line 99
    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
