.class final Lcom/unity3d/services/store/core/api/Store$3;
.super Ljava/lang/Object;
.source "Store.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/unity3d/services/store/core/api/Store;->getPurchaseHistory(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Lcom/unity3d/services/core/webview/bridge/WebViewCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$maxPurchases:Ljava/lang/Integer;

.field final synthetic val$operationId:Ljava/lang/Integer;

.field final synthetic val$purchaseType:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 4

    .line 141
    iput-object p1, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$purchaseType:Ljava/lang/String;

    iput-object p2, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$maxPurchases:Ljava/lang/Integer;

    iput-object p3, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    const/4 v0, 0x4

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 145
    :try_start_5
    iget-object v5, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$purchaseType:Ljava/lang/String;

    iget-object v6, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$maxPurchases:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v5, v6}, Lcom/unity3d/services/store/StoreMonitor;->getPurchaseHistory(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v5

    .line 146
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v6

    sget-object v7, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v8, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_RESULT:Lcom/unity3d/services/store/StoreEvent;

    new-array v9, v2, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v10, v9, v4

    aput-object v5, v9, v3

    invoke-virtual {v6, v7, v8, v9}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z
    :try_end_24
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_24} :catch_eb
    .catch Lcom/unity3d/services/store/core/StoreException; {:try_start_5 .. :try_end_24} :catch_c4
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_24} :catch_a7
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_24} :catch_8a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_24} :catch_6c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_24} :catch_4e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_24} :catch_26

    goto/16 :goto_107

    :catch_26
    move-exception v5

    .line 160
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v6

    sget-object v7, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v8, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v9, v0, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->UNKNOWN_ERROR:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v0, v3

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {v6, v7, v8, v0}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto/16 :goto_107

    :catch_4e
    move-exception v0

    .line 158
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v5

    sget-object v6, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v7, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v8, v1, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->CLASS_NOT_FOUND:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {v5, v6, v7, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto/16 :goto_107

    :catch_6c
    move-exception v0

    .line 156
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v5

    sget-object v6, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v7, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v8, v1, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->INVOCATION_TARGET:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {v5, v6, v7, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto/16 :goto_107

    :catch_8a
    move-exception v0

    .line 154
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v5

    sget-object v6, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v7, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v8, v1, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->JSON_ERROR:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {v5, v6, v7, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto :goto_107

    :catch_a7
    move-exception v0

    .line 152
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v5

    sget-object v6, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v7, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v8, v1, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->ILLEGAL_ACCESS:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {v5, v6, v7, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto :goto_107

    :catch_c4
    move-exception v5

    .line 150
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v6

    sget-object v7, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v8, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v9, v0, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->STORE_ERROR:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v0, v3

    invoke-virtual {v5}, Lcom/unity3d/services/store/core/StoreException;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-virtual {v5}, Lcom/unity3d/services/store/core/StoreException;->getResultCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {v6, v7, v8, v0}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    goto :goto_107

    :catch_eb
    move-exception v0

    .line 148
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v5

    sget-object v6, Lcom/unity3d/services/core/webview/WebViewEventCategory;->STORE:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v7, Lcom/unity3d/services/store/StoreEvent;->PURCHASE_HISTORY_ERROR:Lcom/unity3d/services/store/StoreEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/unity3d/services/store/core/api/Store$3;->val$operationId:Ljava/lang/Integer;

    aput-object v8, v1, v4

    sget-object v4, Lcom/unity3d/services/store/StoreError;->NO_SUCH_METHOD:Lcom/unity3d/services/store/StoreError;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {v5, v6, v7, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    :goto_107
    return-void
.end method
