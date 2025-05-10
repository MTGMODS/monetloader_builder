# Самосоздатель лаунчера с MonetLoader из ориг. лаунчера ARZ

(требуется https://www.python.org/downloads/ и https://www.java.com/en/download/)

# Как это использовать:

1) Загрузите apksigner.jar, apktool.jar, BUILD_RUN.py, папку «files» из этого репозитория в удобную вам папку.

2) Возьмите apk-файл арз лаунчера и поместите его в ту же папку, где находятся эти загрузки.

3) Если ваш apk-файл лаунчера имеет название не "app-arizona-release_web.apk", то дайте ему такое название

4) Возьмите своё хранилище ключей (key.jks) и поместите его в ту же папку, где находятся эти загрузки.
Если у вас его еще нет, создайте свой key.jks, например, в Android Studio / APK Editor.

5) Отредактируйте BUILD_RUN.py : вставьте свои данные в KEY_ALIAS и KEY_PASS для подписи apk.

6) Запустите в cmd/termital: python BUILD_RUN.py. 

7) В вашей папке появиться MonetLoader.apk с авто-установкой lib.

# P.S.
Есть такой файл как files/assets/monetloader/compat/profile.json

Сейчас в репо актуальный на момент 16.1.7, но если арз обновят оффсеты/паттерны, то он станет неактуал и вам нужно будет обновить его самостоятельно!

Для обновления вам нужно найти оффсеты/паттерны через Ida Pro и заполнить profile.json

Расшифровка что за что отвечает:

```

// GTA San Andreas library name

"gtasa_name": "libGTASA.so"

// Name of compatibility profile

"profile_name": "Profile Name GTA:2.0 SAMP:ARZ-15.0.8"

// SAMP library name
// MonetLoader only supports build 69-like SAMP, for example old arizona

"samp_name": "libsamp.so"

// Pattern that will be used to find RakPeer::ReceiveIgnoreRPC
// in samp library

"receiveignorerpc_pattern": "F0B503AF2DE900????B004460068C16A20468847"

// Pattern that will be used to find CNetGame::CNetGame
// in samp library

"cnetgame_ctor_pattern": "F0B503AF2DE9000788B00D46????9146????0446002079447A44"

// Offset from start of CNetGame structure to RakClientInterface* member

"rakclientinterface_netgame_offset": 528

// true => use NvEventInsertNewest hook for touch
// false => use TouchEvent hook for touch
// Needs to be true for correct touch hook on SAM

"use_samp_touch_workaround": true

// If "use_samp_touch_workaround" true
// NvEventInsertNewest offset in GTA San Andreas

"nveventinsertnewest_offset": 2606320

```
