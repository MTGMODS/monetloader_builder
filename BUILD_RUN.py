import subprocess
import os
import shutil
import re
import glob

##################################################################################################################

PATH = os.path.dirname(__file__)

APK_NAME = "app-arizona-release_web"
## don't app name, examle apk_name.apk insert apk_name
APK_PATH = PATH + r"\\" + APK_NAME + ".apk"

APKTOOL_PATH = PATH + r"\apktool.jar"
DECODED_DIR = PATH + r"\\" + APK_NAME

if os.path.exists(DECODED_DIR):
    print("[INFO] 🗑️ Delete old decompiled app folder...")
    subprocess.run(["rmdir", "/s", "/q", DECODED_DIR], shell=True)

print("[INFO] ⌚ Decompiling apk...")
subprocess.run(["java", "-jar", APKTOOL_PATH, "d", APK_PATH, "-o", DECODED_DIR, "--force"], check=True)
print("[INFO] ✅ APK decompiled!")

##################################################################################################################

LIB_PATH = PATH + r"\\" + APK_NAME + r"\lib\arm64-v8a"

print("[INFO] 🗑️ Delete " + LIB_PATH)

if os.path.exists(LIB_PATH):
    shutil.rmtree(LIB_PATH)
    print("[INFO] ✅ Folder lib/arm64-v8a deleted!")

##################################################################################################################

SRC_FILES = PATH + r"\files"
DEST_FILES = PATH + r"\\" + APK_NAME

print("[INFO] ⌚ Adding MonetLoader files...")
for root, dirs, files in os.walk(SRC_FILES):
    for file in files:
        src_file = os.path.join(root, file)
        dest_file = os.path.join(DEST_FILES, os.path.relpath(src_file, SRC_FILES))
        os.makedirs(os.path.dirname(dest_file), exist_ok=True)
        shutil.copy2(src_file, dest_file)
print("[INFO] ✅ MonetLoader files success adden!")

##################################################################################################################

GTASA_INTERNAL_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\game\GTASAInternal.smali"

print("[INFO] ⌚ Connect MonetLoader to GTASAInternal.smali...")

with open(GTASA_INTERNAL_PATH, "r", encoding="utf-8") as file:
    smali_lines = file.readlines()

for i, line in enumerate(smali_lines):
    if 'const-string v1, "samp"' in line and "invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V" in smali_lines[i + 2]:
        smali_lines.insert(i + 3, '\n    const-string v1, "monetloader"\n\n    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V\n\n')
        print("[INFO] ✅ Successful connected!")
        break

with open(GTASA_INTERNAL_PATH, "w", encoding="utf-8") as file:
    file.writelines(smali_lines)

##################################################################################################################

SMALI_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4"

print("[INFO] ⌚ Rename \"com.arizona21.game.web\" to \"com.arizona.game\" in launcher files...")

for filepath in glob.glob(f"{SMALI_PATH}/**/*.smali", recursive=True):
    with open(filepath, "r", encoding="utf-8") as file:
        smali_data = file.read()

    smali_data = smali_data.replace("com.arizona21.game.web", "com.arizona.game")

    with open(filepath, "w", encoding="utf-8") as file:
        file.write(smali_data)

print("[INFO] ✅ Successful renaded!")

##################################################################################################################

MANIFEST_PATH = PATH + r"\\" + APK_NAME + r"\AndroidManifest.xml"

with open(MANIFEST_PATH, "r", encoding="utf-8") as file:
    manifest_data = file.read()

print("[INFO] ⌚ Rename \"com.arizona21.game.web\" to \"com.arizona.game\" in AndroidManifest.xml...")
manifest_data = manifest_data.replace("com.arizona21.game.web", "com.arizona.game")
print("[INFO] ✅ Successful renaded!")

print("[INFO] ⌚ Raname app name to \"Arizona RPG\"")
manifest_data = re.sub(r'android:label="@string/app_name"', 'android:label="Arizona RPG"', manifest_data)
print("[INFO] ✅ Successful renaded!")

## connect unity ads activity
new_activities = '''
<activity android:configChanges="fontScale|keyboard|keyboardHidden|locale|mcc|mnc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|touchscreen|uiMode" android:hardwareAccelerated="true" android:name="com.unity3d.services.ads.adunit.AdUnitActivity" android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
<activity android:configChanges="fontScale|keyboard|keyboardHidden|locale|mcc|mnc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|touchscreen|uiMode" android:hardwareAccelerated="true" android:name="com.unity3d.services.ads.adunit.AdUnitTransparentActivity" android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
<activity android:configChanges="fontScale|keyboard|keyboardHidden|locale|mcc|mnc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|touchscreen|uiMode" android:hardwareAccelerated="false" android:name="com.unity3d.services.ads.adunit.AdUnitTransparentSoftwareActivity" android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
<activity android:configChanges="fontScale|keyboard|keyboardHidden|locale|mcc|mnc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|touchscreen|uiMode" android:hardwareAccelerated="false" android:name="com.unity3d.services.ads.adunit.AdUnitSoftwareActivity" android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
'''
manifest_data = re.sub(
    r'(<activity[^>]+PlayCoreDialogWrapperActivity[^>]+/>)',
    r'\1' + new_activities,
    manifest_data
)
with open(MANIFEST_PATH, "w", encoding="utf-8") as file:
    file.write(manifest_data)

##################################################################################################################

HUD_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes6\ru\mrlargha\commonui\elements\hud\presentation\Hud.smali"

print("[INFO] ⌚ Raname hud-name \"arizona-rp.com\" to \"arizona rpg\"...")

with open(HUD_PATH, "r", encoding="utf-8") as file:
    hud_data = file.read()

hud_data = hud_data.replace("arizona-rp.com", "arizona rpg")

if 'arizona rpg' in hud_data:
    print("[INFO] ✅ Successfully renamed!")
    with open(HUD_PATH, "w", encoding="utf-8") as file:
        file.write(hud_data)
else:
    print("[ERROR] ❌ String not found! No changes made.")

##################################################################################################################

UPDATE_SERVICE_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\launcher\UpdateService.smali"

print("[INFO] ⌚ Off update client...")
with open(UPDATE_SERVICE_PATH, "r", encoding="utf-8") as file:
    smali_lines = file.readlines()

matches = [i for i, line in enumerate(smali_lines) if "needUpdateMsg" in line]

insert_index = matches[2]
smali_lines.insert(insert_index + 2, "    const/4 p1, 0x0\n")
#const/4 p1, 0x0 додано після третього збігу 'needUpdateMsg'

with open(UPDATE_SERVICE_PATH, "w", encoding="utf-8") as file:
    file.writelines(smali_lines)

print("[INFO] ✅ Client update disabled!")

##################################################################################################################

# MAIN_ACTIVITY_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\launcher\MainActivity.smali"

# print("[7/13] ⌚ Додаю виклик unpackAssets у " + MAIN_ACTIVITY_PATH)
# with open(MAIN_ACTIVITY_PATH, "r", encoding="utf-8") as file:
#     smali_data = file.readlines()

# for i, line in enumerate(smali_data):
#     if ".method protected onCreate" in line:
#         for j in range(i, len(smali_data)):
#             if "return-void" in smali_data[j]:
#                 smali_data.insert(j, "    invoke-static {p0, p0}, Lcom/arizona/launcher/AssetExtractor;->unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V\n")
#                 print("[INFO] ✅ Connected AssetExtractor")
#                 break
#         break

# with open(MAIN_ACTIVITY_PATH, "w", encoding="utf-8") as file:
#     file.writelines(smali_data)
# print("[7/13] ✅ Виклик unpackAssets в onCreate додано")

##################################################################################################################

MAIN_ENTRENCH_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\launcher\MainEntrench.smali"

print("[INFO] ⌚ Adding MTG MODS functions (lib installer, toast)...")

with open(MAIN_ENTRENCH_PATH, "r", encoding="utf-8") as file:
    smali_lines = file.readlines()

for i, line in enumerate(smali_lines):
    if "sget-object v3, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;" in line:
        smali_lines[i] = '    const-string v3, ""\n'
        print("[INFO] ✅ Change CPU_ABI")
    if "invoke-virtual {v0}, Landroid/widget/Toast;->show()V" in line:
        smali_lines[i] = '    invoke-virtual {v0}, Landroid/widget/Toast;->show()V\n\ninvoke-static {p0, p0}, Lcom/arizona/launcher/AssetExtractor;->unpackAssets(Landroid/app/Activity;Landroid/content/Context;)V\n'
        print("[INFO] ✅ Connected AssetExtractor")

version_pattern = re.compile(r'const-string v3, " v(.+) release_web"')
version_found = None

for i, line in enumerate(smali_lines):
    match = version_pattern.search(line)
    if match:
        version_found = match.group(1)
        smali_lines[i] = f'    const-string v3, "[MTG MODS]\\n\u2139\ufe0f ARZ v{version_found} \u2139\ufe0f"\n'
        print(f"[INFO] ✅ Toast changed to ARZ v{version_found}")
        break

with open(MAIN_ENTRENCH_PATH, "w", encoding="utf-8") as file:
    file.writelines(smali_lines)

##################################################################################################################

# OFF UPDATE 
# DON'T ACTUAL

# MAIN_HANDLER_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\launcher\MainEntrench$IncomingHandler.smali"

# with open(MAIN_HANDLER_PATH, "r", encoding="utf-8") as file:
#     smali_lines = file.readlines()

# matches = [i for i, line in enumerate(smali_lines) if "sget v1, Lcom/arizona/game/R$string;->exit:I" in line]

# if len(matches) >= 4:
#     smali_lines[matches[3]] = '    const-string v1, "\u041F\u0440\u043E\u043F\u0443\u0441\u0442\u0438\u0442\u044C"\n'
#     print("[9/13] ✅ Останній збіг 'sget v1, Lcom/arizona/game/R$string;->exit:I' замінено на 'Пропустити'")

# matches = [i for i, line in enumerate(smali_lines) if "invoke-virtual {p1, v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;" in line]

# if len(matches) >= 4:
#     smali_lines[matches[3]] = '    invoke-virtual {p1, v1, v2}, Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/google/android/material/dialog/MaterialAlertDialogBuilder;\n'
#     print("[9/13] ✅ Метод setNegativeButton виправлено")

# with open(MAIN_HANDLER_PATH, "w", encoding="utf-8") as file:
#     file.writelines(smali_lines)


# LAMBDA_PATH = PATH + r"\\" + APK_NAME + r"\smali_classes4\com\arizona\launcher\MainEntrench$IncomingHandler$$ExternalSyntheticLambda7.smali"

# with open(LAMBDA_PATH, "r", encoding="utf-8") as file:
#     smali_data = file.read()

# smali_data = smali_data.replace(".locals 1", ".locals 3")

# smali_data = smali_data.replace(
#     "invoke-static {v0, p1, p2}, Lcom/arizona/launcher/MainEntrench$IncomingHandler;->$r8$lambda$1sj-oZAojgDiIJvV2THFcI_Wwww(Lcom/arizona/launcher/MainEntrench;Landroid/content/DialogInterface;I)V",
#     """const-string v1, "com.arizona.launcher.MainActivity"
#     invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
#     move-result-object v1
#     new-instance v2, Landroid/content/Intent;
#     invoke-direct {v2, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
#     invoke-virtual {v0, v2}, Lcom/arizona/launcher/MainEntrench;->startActivity(Landroid/content/Intent;)V
#     invoke-virtual {v0}, Lcom/arizona/launcher/MainEntrench;->finish()V"""
# )
# with open(LAMBDA_PATH, "w", encoding="utf-8") as file:
#     file.write(smali_data)

##################################################################################################################

print("[INFO] ⌚ Recompiling APK...")
subprocess.run(["java", "-jar", APKTOOL_PATH, "b", DECODED_DIR], check=True)
#subprocess.run(f'java -jar "{APKTOOL_PATH}" b "{DECODED_DIR}"', shell=True)
print("[INFO] ✅ Recompiling succces!")

##################################################################################################################

APKSIGNER_PATH = PATH + r"\apksigner.jar"
UNSIGNED_APK = PATH + r"\\" + APK_NAME + r"\\dist\\" + APK_NAME + r".apk"
SIGNED_APK = PATH + r"\MonetLoader.apk"

KEYSTORE_PATH = PATH + r"\key.jks"
KEY_ALIAS = "key0" ## replace for your sight key data
KEY_PASS = "Bogdan20MTG!" ## replace for your sight key data

print("[INFO] ⌚ Signing APK...")

try:
    if os.path.exists(SIGNED_APK):
        print(f"[INFO] 🗑️ Delete old signed apk...")
        os.remove(SIGNED_APK)
    
    subprocess.run([
        "java", "-jar", APKSIGNER_PATH, "sign",
        "--ks", KEYSTORE_PATH,
        "--ks-key-alias", KEY_ALIAS,
        "--ks-pass", f"pass:{KEY_PASS}",
        "--key-pass", f"pass:{KEY_PASS}",
        "--out", SIGNED_APK,
        UNSIGNED_APK
    ], check=True)
    
    print("[INFO] ✅ Signed successfully!")
    print(f"[INFO] ℹ️ Your launcher: {SIGNED_APK}")
except subprocess.CalledProcessError as e:
    print(f"[ERROR] {e}")

##################################################################################################################

print("[INFO] ✅ All tasks finished!")

print("[INFO] Delete original apk & decompiled folder? Y/N")
a = input().strip().upper()

if a == "Y":
    if os.path.exists(DECODED_DIR):
        print("[INFO] 🗑️ Deleting decompiled folder...")
        shutil.rmtree(DECODED_DIR, ignore_errors=True)

    if os.path.exists(APK_PATH):
        print("[INFO] 🗑️ Deleting original APK...")
        os.remove(APK_PATH)
    
##################################################################################################################






