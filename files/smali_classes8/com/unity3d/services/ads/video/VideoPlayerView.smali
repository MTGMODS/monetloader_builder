.class public Lcom/unity3d/services/ads/video/VideoPlayerView;
.super Landroid/widget/VideoView;
.source "VideoPlayerView.java"


# instance fields
.field private _audioManager:Landroid/media/AudioManager;

.field private _infoListenerEnabled:Z

.field private _mediaPlayer:Landroid/media/MediaPlayer;

.field private _prepareTimer:Ljava/util/Timer;

.field private _progressEventInterval:I

.field private _videoTimer:Ljava/util/Timer;

.field private _videoUrl:Ljava/lang/String;

.field private _volume:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 26
    invoke-direct {p0, p1}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x1f4

    .line 19
    iput p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_progressEventInterval:I

    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_mediaPlayer:Landroid/media/MediaPlayer;

    .line 21
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_volume:Ljava/lang/Float;

    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_infoListenerEnabled:Z

    .line 23
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_audioManager:Landroid/media/AudioManager;

    return-void
.end method

.method static synthetic access$000(Lcom/unity3d/services/ads/video/VideoPlayerView;)Ljava/lang/String;
    .registers 1

    .line 15
    iget-object p0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$102(Lcom/unity3d/services/ads/video/VideoPlayerView;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .registers 2

    .line 15
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_mediaPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method private startPrepareTimer(J)V
    .registers 5

    .line 57
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_prepareTimer:Ljava/util/Timer;

    .line 58
    new-instance v1, Lcom/unity3d/services/ads/video/VideoPlayerView$2;

    invoke-direct {v1, p0}, Lcom/unity3d/services/ads/video/VideoPlayerView$2;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;)V

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    return-void
.end method

.method private startVideoProgressTimer()V
    .registers 8

    .line 30
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoTimer:Ljava/util/Timer;

    .line 31
    new-instance v1, Lcom/unity3d/services/ads/video/VideoPlayerView$1;

    invoke-direct {v1, p0}, Lcom/unity3d/services/ads/video/VideoPlayerView$1;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;)V

    iget v2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_progressEventInterval:I

    int-to-long v3, v2

    int-to-long v5, v2

    move-wide v2, v3

    move-wide v4, v5

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    return-void
.end method


# virtual methods
.method public getProgressEventInterval()I
    .registers 2

    .line 258
    iget v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_progressEventInterval:I

    return v0
.end method

.method public getVideoViewRectangle()[I
    .registers 6

    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 263
    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->getLocationInWindow([I)V

    const/4 v2, 0x4

    new-array v2, v2, [I

    const/4 v3, 0x0

    .line 265
    aget v4, v1, v3

    aput v4, v2, v3

    const/4 v3, 0x1

    aget v1, v1, v3

    aput v1, v2, v3

    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->getMeasuredWidth()I

    move-result v1

    aput v1, v2, v0

    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->getMeasuredHeight()I

    move-result v0

    const/4 v1, 0x3

    aput v0, v2, v1

    return-object v2
.end method

.method public getVolume()F
    .registers 2

    .line 235
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_volume:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public pause()V
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 183
    :try_start_2
    invoke-super {p0}, Landroid/widget/VideoView;->pause()V

    .line 187
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-ge v2, v3, :cond_16

    .line 188
    iget-object v2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_audioManager:Landroid/media/AudioManager;

    if-eqz v2, :cond_19

    .line 189
    iget-object v2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_audioManager:Landroid/media/AudioManager;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    goto :goto_19

    .line 192
    :cond_16
    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setAudioFocusRequest(I)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_19} :catch_2e

    .line 201
    :cond_19
    :goto_19
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->stopVideoProgressTimer()V

    .line 202
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v2

    sget-object v3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v4, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->PAUSE:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    aput-object v5, v0, v1

    invoke-virtual {v2, v3, v4, v0}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void

    :catch_2e
    move-exception v2

    .line 196
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v3

    sget-object v4, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v5, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->PAUSE_ERROR:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    aput-object v6, v0, v1

    invoke-virtual {v3, v4, v5, v0}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    const-string v0, "Error pausing video"

    .line 197
    invoke-static {v0, v2}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method public play()V
    .registers 7

    .line 143
    invoke-static {}, Lcom/unity3d/services/core/log/DeviceLog;->entered()V

    .line 145
    new-instance v0, Lcom/unity3d/services/ads/video/VideoPlayerView$5;

    invoke-direct {v0, p0}, Lcom/unity3d/services/ads/video/VideoPlayerView$5;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;)V

    invoke-virtual {p0, v0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 157
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->start()V

    .line 158
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->stopVideoProgressTimer()V

    .line 159
    invoke-direct {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->startVideoProgressTimer()V

    .line 161
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v1, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v2, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->PLAY:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method public prepare(Ljava/lang/String;FI)Z
    .registers 8

    .line 78
    invoke-static {}, Lcom/unity3d/services/core/log/DeviceLog;->entered()V

    .line 80
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    .line 82
    new-instance p1, Lcom/unity3d/services/ads/video/VideoPlayerView$3;

    invoke-direct {p1, p0, p2}, Lcom/unity3d/services/ads/video/VideoPlayerView$3;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;F)V

    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 96
    new-instance p1, Lcom/unity3d/services/ads/video/VideoPlayerView$4;

    invoke-direct {p1, p0}, Lcom/unity3d/services/ads/video/VideoPlayerView$4;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;)V

    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 111
    iget-boolean p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_infoListenerEnabled:Z

    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setInfoListenerEnabled(Z)V

    if-lez p3, :cond_20

    int-to-long p1, p3

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/unity3d/services/ads/video/VideoPlayerView;->startPrepareTimer(J)V

    :cond_20
    const/4 p1, 0x1

    .line 121
    :try_start_21
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1a

    const/4 v0, 0x2

    if-ge p2, p3, :cond_3e

    .line 122
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "audio"

    invoke-virtual {p2, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/media/AudioManager;

    iput-object p2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_audioManager:Landroid/media/AudioManager;

    if-eqz p2, :cond_41

    const/4 p3, 0x0

    const/4 v1, 0x3

    .line 125
    invoke-virtual {p2, p3, v1, v0}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    goto :goto_41

    .line 128
    :cond_3e
    invoke-virtual {p0, v0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setAudioFocusRequest(I)V

    .line 131
    :cond_41
    :goto_41
    iget-object p2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setVideoPath(Ljava/lang/String;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_46} :catch_47

    return p1

    :catch_47
    move-exception p2

    .line 134
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object p3

    sget-object v0, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v1, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->PREPARE_ERROR:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    new-array p1, p1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, p1, v3

    invoke-virtual {p3, v0, v1, p1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    .line 135
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Error preparing video: "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    return v3
.end method

.method public seekTo(I)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 208
    :try_start_2
    invoke-super {p0, p1}, Landroid/widget/VideoView;->seekTo(I)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_17

    .line 216
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object p1

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v3, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->SEEKTO:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    aput-object v4, v1, v0

    invoke-virtual {p1, v2, v3, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void

    :catch_17
    move-exception p1

    .line 211
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v2

    sget-object v3, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v4, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->SEEKTO_ERROR:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    aput-object v5, v1, v0

    invoke-virtual {v2, v3, v4, v1}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    const-string v0, "Error seeking video"

    .line 212
    invoke-static {v0, p1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method public setInfoListenerEnabled(Z)V
    .registers 3

    .line 165
    iput-boolean p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_infoListenerEnabled:Z

    .line 166
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x10

    if-le p1, v0, :cond_19

    .line 167
    iget-boolean p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_infoListenerEnabled:Z

    if-eqz p1, :cond_15

    .line 168
    new-instance p1, Lcom/unity3d/services/ads/video/VideoPlayerView$6;

    invoke-direct {p1, p0}, Lcom/unity3d/services/ads/video/VideoPlayerView$6;-><init>(Lcom/unity3d/services/ads/video/VideoPlayerView;)V

    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    goto :goto_19

    :cond_15
    const/4 p1, 0x0

    .line 176
    invoke-virtual {p0, p1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    :cond_19
    :goto_19
    return-void
.end method

.method public setProgressEventInterval(I)V
    .registers 2

    .line 250
    iput p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_progressEventInterval:I

    .line 251
    iget-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoTimer:Ljava/util/Timer;

    if-eqz p1, :cond_c

    .line 252
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->stopVideoProgressTimer()V

    .line 253
    invoke-direct {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->startVideoProgressTimer()V

    :cond_c
    return-void
.end method

.method public setVolume(Ljava/lang/Float;)V
    .registers 5

    .line 240
    :try_start_0
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 241
    iput-object p1, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_volume:Ljava/lang/Float;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    return-void

    :catch_10
    move-exception p1

    const-string v0, "MediaPlayer generic error"

    .line 244
    invoke-static {v0, p1}, Lcom/unity3d/services/core/log/DeviceLog;->exception(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method public stop()V
    .registers 7

    .line 220
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->stopPlayback()V

    .line 221
    invoke-virtual {p0}, Lcom/unity3d/services/ads/video/VideoPlayerView;->stopVideoProgressTimer()V

    .line 223
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x1a

    if-ge v0, v2, :cond_16

    .line 224
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_audioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_19

    const/4 v2, 0x0

    .line 225
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    goto :goto_19

    .line 228
    :cond_16
    invoke-virtual {p0, v1}, Lcom/unity3d/services/ads/video/VideoPlayerView;->setAudioFocusRequest(I)V

    .line 231
    :cond_19
    :goto_19
    invoke-static {}, Lcom/unity3d/services/core/webview/WebViewApp;->getCurrentApp()Lcom/unity3d/services/core/webview/WebViewApp;

    move-result-object v0

    sget-object v2, Lcom/unity3d/services/core/webview/WebViewEventCategory;->VIDEOPLAYER:Lcom/unity3d/services/core/webview/WebViewEventCategory;

    sget-object v3, Lcom/unity3d/services/ads/video/VideoPlayerEvent;->STOP:Lcom/unity3d/services/ads/video/VideoPlayerEvent;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoUrl:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v2, v3, v4}, Lcom/unity3d/services/core/webview/WebViewApp;->sendEvent(Ljava/lang/Enum;Ljava/lang/Enum;[Ljava/lang/Object;)Z

    return-void
.end method

.method public stopPrepareTimer()V
    .registers 2

    .line 70
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_prepareTimer:Ljava/util/Timer;

    if-eqz v0, :cond_f

    .line 71
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 72
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_prepareTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_prepareTimer:Ljava/util/Timer;

    :cond_f
    return-void
.end method

.method public stopVideoProgressTimer()V
    .registers 2

    .line 49
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoTimer:Ljava/util/Timer;

    if-eqz v0, :cond_f

    .line 50
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 51
    iget-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    const/4 v0, 0x0

    .line 52
    iput-object v0, p0, Lcom/unity3d/services/ads/video/VideoPlayerView;->_videoTimer:Ljava/util/Timer;

    :cond_f
    return-void
.end method
