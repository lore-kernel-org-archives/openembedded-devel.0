Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYa-0003rN-5Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:08 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H7kAqWN9hC1wo2JKKALrCZzz8TqU9kTieZEBEXAAfXE=;
	b=ddfrls/32Mijq7LBcAwJ+gzWsG6q+wJnjpYo7wP7pANNgq1wkSEqMXFbxwhwwHcl1Z
	ok6yWfNHXhYWCe+T5iEEfvUTEtQ6Hsu2+rYfBKiymc2tzU2bKxI+H6k3GzT/QPX4EKn0
	yJklqDKTz8SduztRsgzJNQyDwiClXfWXMRck4=
Received: by 10.223.23.10 with SMTP id p10mr2959858fab.112.1316345035535;
	Sun, 18 Sep 2011 04:23:55 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:54 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:18 +0400
Message-Id: <1316344999-26642-17-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 16/17] opie: mass GPL->GPLv2 fixup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Sep 2011 11:29:09 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../nonworking/opie-dagger/opie-dagger.inc         |    2 +-
 .../nonworking/opie-dasher/opie-dasher.inc         |    2 +-
 recipes-opie/opie-aboutapplet/opie-aboutapplet.inc |    2 +-
 recipes-opie/opie-addressbook/opie-addressbook.inc |    2 +-
 recipes-opie/opie-advancedfm/opie-advancedfm.inc   |    2 +-
 recipes-opie/opie-alarm/opie-alarm.inc             |    2 +-
 recipes-opie/opie-appearance/opie-appearance.inc   |    2 +-
 recipes-opie/opie-backgammon/opie-backgammon.inc   |    2 +-
 .../opie-batteryapplet/opie-batteryapplet.inc      |    2 +-
 recipes-opie/opie-bluepin/opie-bluepin.inc         |    2 +-
 .../opie-bluetoothapplet/opie-bluetoothapplet.inc  |    2 +-
 .../opie-bluetoothmanager.inc                      |    3 ++-
 .../opie-button-settings/opie-button-settings.inc  |    2 +-
 recipes-opie/opie-calculator/opie-calculator.inc   |    2 +-
 recipes-opie/opie-camera/opie-camera.inc           |    2 +-
 recipes-opie/opie-citytime/opie-citytime.inc       |    2 +-
 .../opie-clipboardapplet/opie-clipboardapplet.inc  |    2 +-
 recipes-opie/opie-clock/opie-clock.inc             |    2 +-
 recipes-opie/opie-clockapplet/opie-clockapplet.inc |    2 +-
 recipes-opie/opie-confeditor/opie-confeditor.inc   |    2 +-
 recipes-opie/opie-console/opie-console.inc         |    2 +-
 .../opie-datebook-birthdayplugin.inc               |    2 +-
 .../opie-datebook-chrisholidayplugin.inc           |    2 +-
 .../opie-datebook-nationalholidayplugin.inc        |    2 +-
 recipes-opie/opie-datebook/opie-datebook.inc       |    2 +-
 recipes-opie/opie-deco-flat/opie-deco-flat.inc     |    2 +-
 recipes-opie/opie-deco-liquid/opie-deco-liquid.inc |    2 +-
 .../opie-deco-polished/opie-deco-polished.inc      |    2 +-
 recipes-opie/opie-doctab/opie-doctab.inc           |    2 +-
 recipes-opie/opie-dvorak/opie-dvorak.inc           |    2 +-
 .../opie-embeddedkonsole/opie-embeddedkonsole.inc  |    2 +-
 recipes-opie/opie-euroconv/opie-euroconv.inc       |    2 +-
 .../opie-examples-python/opie-examples-python.inc  |    2 +-
 recipes-opie/opie-examples/opie-examples.inc       |    2 +-
 recipes-opie/opie-eye/opie-eye.inc                 |    2 +-
 recipes-opie/opie-fifteen/opie-fifteen.inc         |    2 +-
 recipes-opie/opie-formatter/opie-formatter.inc     |    2 +-
 recipes-opie/opie-freetype/opie-freetype.inc       |    2 +-
 recipes-opie/opie-ftp/opie-ftp.inc                 |    2 +-
 recipes-opie/opie-go/opie-go.inc                   |    2 +-
 .../opie-gutenbrowser/opie-gutenbrowser.inc        |    2 +-
 recipes-opie/opie-handwriting/opie-handwriting.inc |    2 +-
 recipes-opie/opie-help-en/opie-help-en.inc         |    2 +-
 recipes-opie/opie-helpbrowser/opie-helpbrowser.inc |    2 +-
 recipes-opie/opie-homeapplet/opie-homeapplet.inc   |    2 +-
 recipes-opie/opie-i18n/opie-i18n.inc               |    2 +-
 recipes-opie/opie-i18n/opie-lrelease-native.inc    |    2 +-
 recipes-opie/opie-i18n/opie-lupdate-native.inc     |    2 +-
 recipes-opie/opie-icon-reload/opie-icon-reload.inc |    2 +-
 recipes-opie/opie-init/opie-init.inc               |    2 +-
 recipes-opie/opie-irc/opie-irc.inc                 |    2 +-
 recipes-opie/opie-irdaapplet/opie-irdaapplet.inc   |    2 +-
 recipes-opie/opie-jumpx/opie-jumpx.inc             |    2 +-
 recipes-opie/opie-kcheckers/opie-kcheckers.inc     |    2 +-
 recipes-opie/opie-keyboard/opie-keyboard.inc       |    2 +-
 recipes-opie/opie-keypebble/opie-keypebble.inc     |    2 +-
 recipes-opie/opie-keytabs/opie-keytabs.inc         |    2 +-
 recipes-opie/opie-keyview/opie-keyview.inc         |    2 +-
 recipes-opie/opie-kjumpx/opie-kjumpx.inc           |    2 +-
 recipes-opie/opie-kpacman/opie-kpacman.inc         |    2 +-
 recipes-opie/opie-language/opie-language.inc       |    2 +-
 .../opie-launcher-settings.inc                     |    2 +-
 recipes-opie/opie-libqrsync/opie-libqrsync.inc     |    2 +-
 .../opie-light-and-power/opie-light-and-power.inc  |    2 +-
 recipes-opie/opie-lockapplet/opie-lockapplet.inc   |    2 +-
 recipes-opie/opie-login/opie-login.inc             |    5 +++--
 .../opie-logoutapplet/opie-logoutapplet.inc        |    2 +-
 recipes-opie/opie-mail/opie-mail.inc               |    2 +-
 recipes-opie/opie-mailapplet/opie-mailapplet.inc   |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1-core.inc   |    2 +-
 .../opie-mediaplayer1/opie-mediaplayer1.inc        |    2 +-
 ...ie-mediaplayer2-skin-default-landscape_1.2.5.bb |    2 +-
 ...opie-mediaplayer2-skin-default-landscape_git.bb |    2 +-
 .../opie-mediaplayer2-skin-default_1.2.5.bb        |    2 +-
 .../opie-mediaplayer2-skin-default_git.bb          |    2 +-
 .../opie-mediaplayer2-skin-pod_1.2.5.bb            |    2 +-
 .../opie-mediaplayer2-skin-pod_git.bb              |    2 +-
 .../opie-mediaplayer2-skin-techno_1.2.5.bb         |    2 +-
 .../opie-mediaplayer2-skin-techno_git.bb           |    2 +-
 .../opie-mediaplayer2/opie-mediaplayer2.inc        |    2 +-
 recipes-opie/opie-mediummount/opie-mediummount.inc |    2 +-
 .../opie-memoryapplet/opie-memoryapplet.inc        |    2 +-
 recipes-opie/opie-mindbreaker/opie-mindbreaker.inc |    2 +-
 recipes-opie/opie-minesweep/opie-minesweep.inc     |    2 +-
 recipes-opie/opie-multikey/opie-multikey.inc       |    2 +-
 .../opie-multikeyapplet/opie-multikeyapplet.inc    |    2 +-
 .../opie-networkapplet/opie-networkapplet.inc      |    2 +-
 .../opie-networksettings/opie-networksettings.inc  |    2 +-
 recipes-opie/opie-notes/opie-notes.inc             |    2 +-
 recipes-opie/opie-notesapplet/opie-notesapplet.inc |    2 +-
 recipes-opie/opie-oyatzee/opie-oyatzee.inc         |    2 +-
 recipes-opie/opie-parashoot/opie-parashoot.inc     |    2 +-
 recipes-opie/opie-pickboard/opie-pickboard.inc     |    2 +-
 recipes-opie/opie-pics/opie-pics.inc               |    2 +-
 recipes-opie/opie-powerchord/opie-powerchord.inc   |    2 +-
 .../opie-pyquicklaunchapplet.inc                   |    2 +-
 recipes-opie/opie-qasteroids/opie-qasteroids.inc   |    2 +-
 recipes-opie/opie-qcop/opie-qcop.inc               |    2 +-
 recipes-opie/opie-qss/opie-qss.inc                 |    2 +-
 .../opie-quicklauncher/opie-quicklauncher.inc      |    2 +-
 recipes-opie/opie-reader/opie-reader.inc           |    2 +-
 recipes-opie/opie-reader/uqtreader_1.2.5.bb        |    2 +-
 recipes-opie/opie-reader/uqtreader_git.bb          |    2 +-
 recipes-opie/opie-recorder/opie-recorder.inc       |    2 +-
 .../opie-restartapplet/opie-restartapplet.inc      |    2 +-
 .../opie-restartapplet2/opie-restartapplet2.inc    |    2 +-
 .../opie-screenshotapplet.inc                      |    2 +-
 recipes-opie/opie-search/opie-search.inc           |    2 +-
 recipes-opie/opie-security/opie-security.inc       |    2 +-
 .../opie-securityplugins/opie-securityplugin.inc   |    2 +-
 recipes-opie/opie-sfcave/opie-sfcave.inc           |    2 +-
 recipes-opie/opie-sh-snes/opie-sh-snes.inc         |    2 +-
 recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb      |    2 +-
 recipes-opie/opie-sheet/opie-sheet.inc             |    2 +-
 recipes-opie/opie-snake/opie-snake.inc             |    2 +-
 recipes-opie/opie-solitaire/opie-solitaire.inc     |    2 +-
 recipes-opie/opie-sounds/opie-sounds.inc           |    2 +-
 recipes-opie/opie-stumbler/opie-stumbler.inc       |    2 +-
 recipes-opie/opie-style-flat/opie-style-flat.inc   |    2 +-
 recipes-opie/opie-style-fresh/opie-style-fresh.inc |    2 +-
 .../opie-style-liquid/opie-style-liquid.inc        |    2 +-
 recipes-opie/opie-style-metal/opie-style-metal.inc |    2 +-
 recipes-opie/opie-style-phase/opie-style-phase.inc |    2 +-
 recipes-opie/opie-style-web/opie-style-web.inc     |    2 +-
 .../opie-suspendapplet/opie-suspendapplet.inc      |    2 +-
 recipes-opie/opie-symlinker/opie-symlinker.inc     |    2 +-
 recipes-opie/opie-sysinfo/opie-sysinfo.inc         |    2 +-
 recipes-opie/opie-tableviewer/opie-tableviewer.inc |    2 +-
 recipes-opie/opie-taskbar/opie-taskbar-images.inc  |    2 +-
 recipes-opie/opie-taskbar/opie-taskbar.inc         |    2 +-
 recipes-opie/opie-tetrix/opie-tetrix.inc           |    2 +-
 recipes-opie/opie-textedit/opie-textedit.inc       |    2 +-
 recipes-opie/opie-theme/opie-theme.inc             |    2 +-
 recipes-opie/opie-tictac/opie-tictac.inc           |    2 +-
 recipes-opie/opie-tinykate/opie-tinykate.inc       |    2 +-
 .../opie-today-addressbookplugin.inc               |    2 +-
 .../opie-today-datebookplugin.inc                  |    2 +-
 .../opie-today-mailplugin.inc                      |    2 +-
 .../opie-today-stocktickerplugin.inc               |    2 +-
 .../opie-today-todolistplugin.inc                  |    2 +-
 recipes-opie/opie-tonleiter/opie-tonleiter.inc     |    2 +-
 recipes-opie/opie-unikeyboard/opie-unikeyboard.inc |    2 +-
 .../opie-vmemo-settings/opie-vmemo-settings.inc    |    2 +-
 .../opie-volumeapplet/opie-volumeapplet.inc        |    2 +-
 recipes-opie/opie-vtapplet/opie-vtapplet.inc       |    2 +-
 .../opie-wellenreiter/opie-wellenreiter.inc        |    2 +-
 .../opie-wirelessapplet/opie-wirelessapplet.inc    |    2 +-
 recipes-opie/opie-wordgame/opie-wordgame.inc       |    2 +-
 recipes-opie/opie-write/opie-write.inc             |    2 +-
 recipes-opie/opie-zkbapplet/opie-zkbapplet.inc     |    2 +-
 recipes-opie/opie-zsafe/opie-zsafe.inc             |    2 +-
 151 files changed, 154 insertions(+), 152 deletions(-)

diff --git a/recipes-opie/nonworking/opie-dagger/opie-dagger.inc b/recipes-opie/nonworking/opie-dagger/opie-dagger.inc
index 150fe7b..3505739 100644
--- a/recipes-opie/nonworking/opie-dagger/opie-dagger.inc
+++ b/recipes-opie/nonworking/opie-dagger/opie-dagger.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Bible study program utilizing the Sword library."
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopiecore2 libopieui2 sword"
diff --git a/recipes-opie/nonworking/opie-dasher/opie-dasher.inc b/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
index d2d2f4d..9ae4147 100644
--- a/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
+++ b/recipes-opie/nonworking/opie-dasher/opie-dasher.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Dasher text input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qdasher"
diff --git a/recipes-opie/opie-aboutapplet/opie-aboutapplet.inc b/recipes-opie/opie-aboutapplet/opie-aboutapplet.inc
index 36966d8..b199d9f 100644
--- a/recipes-opie/opie-aboutapplet/opie-aboutapplet.inc
+++ b/recipes-opie/opie-aboutapplet/opie-aboutapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "About Opie"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "aboutapplet"
diff --git a/recipes-opie/opie-addressbook/opie-addressbook.inc b/recipes-opie/opie-addressbook/opie-addressbook.inc
index 88faf45..af691ad 100644
--- a/recipes-opie/opie-addressbook/opie-addressbook.inc
+++ b/recipes-opie/opie-addressbook/opie-addressbook.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Contacts"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-pics"
diff --git a/recipes-opie/opie-advancedfm/opie-advancedfm.inc b/recipes-opie/opie-advancedfm/opie-advancedfm.inc
index e2e00e8..b3fdd88 100644
--- a/recipes-opie/opie-advancedfm/opie-advancedfm.inc
+++ b/recipes-opie/opie-advancedfm/opie-advancedfm.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Advanced Filemanager"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "advancedfm"
diff --git a/recipes-opie/opie-alarm/opie-alarm.inc b/recipes-opie/opie-alarm/opie-alarm.inc
index 2296974..10351ee 100644
--- a/recipes-opie/opie-alarm/opie-alarm.inc
+++ b/recipes-opie/opie-alarm/opie-alarm.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Alarm"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "apmd"
diff --git a/recipes-opie/opie-appearance/opie-appearance.inc b/recipes-opie/opie-appearance/opie-appearance.inc
index af36006..dff487d 100644
--- a/recipes-opie/opie-appearance/opie-appearance.inc
+++ b/recipes-opie/opie-appearance/opie-appearance.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Appearance settings dialog for the Opie environment"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2"
diff --git a/recipes-opie/opie-backgammon/opie-backgammon.inc b/recipes-opie/opie-backgammon/opie-backgammon.inc
index e4c3190..df3dad3 100644
--- a/recipes-opie/opie-backgammon/opie-backgammon.inc
+++ b/recipes-opie/opie-backgammon/opie-backgammon.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Backgammon Game"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "backgammon"
diff --git a/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc b/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
index 851a4eb..7de8aa0 100644
--- a/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
+++ b/recipes-opie/opie-batteryapplet/opie-batteryapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Battery Monitor applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "batteryapplet"
diff --git a/recipes-opie/opie-bluepin/opie-bluepin.inc b/recipes-opie/opie-bluepin/opie-bluepin.inc
index 043934a..148e082 100644
--- a/recipes-opie/opie-bluepin/opie-bluepin.inc
+++ b/recipes-opie/opie-bluepin/opie-bluepin.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Opie BluePin"
 SECTION = "opie/applications"
 DEPENDS = "libopietooth1"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "bluepin"
diff --git a/recipes-opie/opie-bluetoothapplet/opie-bluetoothapplet.inc b/recipes-opie/opie-bluetoothapplet/opie-bluetoothapplet.inc
index 6fa5e08..c4175b0 100644
--- a/recipes-opie/opie-bluetoothapplet/opie-bluetoothapplet.inc
+++ b/recipes-opie/opie-bluetoothapplet/opie-bluetoothapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Bluetooth Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopietooth1"
diff --git a/recipes-opie/opie-bluetoothmanager/opie-bluetoothmanager.inc b/recipes-opie/opie-bluetoothmanager/opie-bluetoothmanager.inc
index e1325ff..4e30ef2 100644
--- a/recipes-opie/opie-bluetoothmanager/opie-bluetoothmanager.inc
+++ b/recipes-opie/opie-bluetoothmanager/opie-bluetoothmanager.inc
@@ -1,7 +1,8 @@
 DESCRIPTION = "Bluetooth manager for Opie"
 SECTION = "opie/settings"
 DEPENDS = "libopietooth1 obexftp"
-LICENSE = "GPL"
+RDEPENDS_${PN} = "opie-bluepin"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "bluetooth-manager"
diff --git a/recipes-opie/opie-button-settings/opie-button-settings.inc b/recipes-opie/opie-button-settings/opie-button-settings.inc
index bc6e6ea..4cc0908 100644
--- a/recipes-opie/opie-button-settings/opie-button-settings.inc
+++ b/recipes-opie/opie-button-settings/opie-button-settings.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie device buttons settings dialog"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-button-settings-pics"
diff --git a/recipes-opie/opie-calculator/opie-calculator.inc b/recipes-opie/opie-calculator/opie-calculator.inc
index 2379e55..f4da6aa 100644
--- a/recipes-opie/opie-calculator/opie-calculator.inc
+++ b/recipes-opie/opie-calculator/opie-calculator.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Calculator"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "calculator"
diff --git a/recipes-opie/opie-camera/opie-camera.inc b/recipes-opie/opie-camera/opie-camera.inc
index 16a204b..675006b 100644
--- a/recipes-opie/opie-camera/opie-camera.inc
+++ b/recipes-opie/opie-camera/opie-camera.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Camera, Photo and Video Capturing Application for the Sharp CF-AG06 camera"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "sharp-camera-support"
diff --git a/recipes-opie/opie-citytime/opie-citytime.inc b/recipes-opie/opie-citytime/opie-citytime.inc
index b86f9ef..6e00002 100644
--- a/recipes-opie/opie-citytime/opie-citytime.inc
+++ b/recipes-opie/opie-citytime/opie-citytime.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Time-zone / world clock settings"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RRECOMMENDS_${PN} = "tzdata"
diff --git a/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc b/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
index 57e0af1..8c67089 100644
--- a/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
+++ b/recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Clipboard applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "clipboardapplet"
diff --git a/recipes-opie/opie-clock/opie-clock.inc b/recipes-opie/opie-clock/opie-clock.inc
index d6f0c29..f9d5ea5 100644
--- a/recipes-opie/opie-clock/opie-clock.inc
+++ b/recipes-opie/opie-clock/opie-clock.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Clock and stop-watch"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "clock"
diff --git a/recipes-opie/opie-clockapplet/opie-clockapplet.inc b/recipes-opie/opie-clockapplet/opie-clockapplet.inc
index 820efe7..e2b607f 100644
--- a/recipes-opie/opie-clockapplet/opie-clockapplet.inc
+++ b/recipes-opie/opie-clockapplet/opie-clockapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Clock applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "clockapplet"
diff --git a/recipes-opie/opie-confeditor/opie-confeditor.inc b/recipes-opie/opie-confeditor/opie-confeditor.inc
index d351d8f..4b72b5a 100644
--- a/recipes-opie/opie-confeditor/opie-confeditor.inc
+++ b/recipes-opie/opie-confeditor/opie-confeditor.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "An enditor for the ~/Settings/*.conf files"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "confedit"
diff --git a/recipes-opie/opie-console/opie-console.inc b/recipes-opie/opie-console/opie-console.inc
index 10b4a41..7bc065b 100644
--- a/recipes-opie/opie-console/opie-console.inc
+++ b/recipes-opie/opie-console/opie-console.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Console Application"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-keytabs"
diff --git a/recipes-opie/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc b/recipes-opie/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
index f2ab1db..8c85f56 100644
--- a/recipes-opie/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
+++ b/recipes-opie/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie datebook birthday plugin"
 SECTION = "opie/datebook"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-datebook"
diff --git a/recipes-opie/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc b/recipes-opie/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
index e64297b..2ebc62c 100644
--- a/recipes-opie/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
+++ b/recipes-opie/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie datebook christian holidays plugin"
 SECTION = "opie/datebook"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-datebook"
diff --git a/recipes-opie/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc b/recipes-opie/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
index f1a6757..41220f9 100644
--- a/recipes-opie/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
+++ b/recipes-opie/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie datebook national holidays plugin"
 SECTION = "opie/datebook"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-datebook"
diff --git a/recipes-opie/opie-datebook/opie-datebook.inc b/recipes-opie/opie-datebook/opie-datebook.inc
index 3377290..d3e6161 100644
--- a/recipes-opie/opie-datebook/opie-datebook.inc
+++ b/recipes-opie/opie-datebook/opie-datebook.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A datebook/appointment manager"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-pics"
diff --git a/recipes-opie/opie-deco-flat/opie-deco-flat.inc b/recipes-opie/opie-deco-flat/opie-deco-flat.inc
index 0796ae1..2acf5ca 100644
--- a/recipes-opie/opie-deco-flat/opie-deco-flat.inc
+++ b/recipes-opie/opie-deco-flat/opie-deco-flat.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Simple, flat window decoration style for Opie"
 SECTION = "opie/decorations"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "flat"
diff --git a/recipes-opie/opie-deco-liquid/opie-deco-liquid.inc b/recipes-opie/opie-deco-liquid/opie-deco-liquid.inc
index e3975bd..37524c9 100644
--- a/recipes-opie/opie-deco-liquid/opie-deco-liquid.inc
+++ b/recipes-opie/opie-deco-liquid/opie-deco-liquid.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Liquid window decoration style for Opie"
 SECTION = "opie/decorations"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2"
diff --git a/recipes-opie/opie-deco-polished/opie-deco-polished.inc b/recipes-opie/opie-deco-polished/opie-deco-polished.inc
index 820476b..b82f01a 100644
--- a/recipes-opie/opie-deco-polished/opie-deco-polished.inc
+++ b/recipes-opie/opie-deco-polished/opie-deco-polished.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Polished window decoration style for Opie"
 SECTION = "opie/decorations"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "polished"
diff --git a/recipes-opie/opie-doctab/opie-doctab.inc b/recipes-opie/opie-doctab/opie-doctab.inc
index 461c39a..80bae9d 100644
--- a/recipes-opie/opie-doctab/opie-doctab.inc
+++ b/recipes-opie/opie-doctab/opie-doctab.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "DocTab settings dialog for the Opie environment."
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "doctab"
diff --git a/recipes-opie/opie-dvorak/opie-dvorak.inc b/recipes-opie/opie-dvorak/opie-dvorak.inc
index 354859d..fa884c5 100644
--- a/recipes-opie/opie-dvorak/opie-dvorak.inc
+++ b/recipes-opie/opie-dvorak/opie-dvorak.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Dvorak keyboard input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-pickboard"
diff --git a/recipes-opie/opie-embeddedkonsole/opie-embeddedkonsole.inc b/recipes-opie/opie-embeddedkonsole/opie-embeddedkonsole.inc
index 95f47d4..ebb6b41 100644
--- a/recipes-opie/opie-embeddedkonsole/opie-embeddedkonsole.inc
+++ b/recipes-opie/opie-embeddedkonsole/opie-embeddedkonsole.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie embedded konsole"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2 opie-keytabs"
diff --git a/recipes-opie/opie-euroconv/opie-euroconv.inc b/recipes-opie/opie-euroconv/opie-euroconv.inc
index ac54435..d59837d 100644
--- a/recipes-opie/opie-euroconv/opie-euroconv.inc
+++ b/recipes-opie/opie-euroconv/opie-euroconv.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Euroconv"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "euroconv"
diff --git a/recipes-opie/opie-examples-python/opie-examples-python.inc b/recipes-opie/opie-examples-python/opie-examples-python.inc
index 300a535..651366b 100644
--- a/recipes-opie/opie-examples-python/opie-examples-python.inc
+++ b/recipes-opie/opie-examples-python/opie-examples-python.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Python examples for Opie"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "python-pyqt opie-pyquicklaunchapplet"
diff --git a/recipes-opie/opie-examples/opie-examples.inc b/recipes-opie/opie-examples/opie-examples.inc
index 6a800d1..ad48743 100644
--- a/recipes-opie/opie-examples/opie-examples.inc
+++ b/recipes-opie/opie-examples/opie-examples.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Developer Examples for Opie"
 SECTION = "opie/base"
 DEPENDS = "opie-networksettings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPTYPE = "binary"
diff --git a/recipes-opie/opie-eye/opie-eye.inc b/recipes-opie/opie-eye/opie-eye.inc
index c32a3ba..3db767a 100644
--- a/recipes-opie/opie-eye/opie-eye.inc
+++ b/recipes-opie/opie-eye/opie-eye.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A image viewer"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopiecore2 libopieui2 libopiemm2"
diff --git a/recipes-opie/opie-fifteen/opie-fifteen.inc b/recipes-opie/opie-fifteen/opie-fifteen.inc
index f9da938..05fdb87 100644
--- a/recipes-opie/opie-fifteen/opie-fifteen.inc
+++ b/recipes-opie/opie-fifteen/opie-fifteen.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Fifteen pieces game"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "fifteen"
diff --git a/recipes-opie/opie-formatter/opie-formatter.inc b/recipes-opie/opie-formatter/opie-formatter.inc
index 200cc03..5479aa4 100644
--- a/recipes-opie/opie-formatter/opie-formatter.inc
+++ b/recipes-opie/opie-formatter/opie-formatter.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The filesystem formatting and mountpoint app for the Opie environment."
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "formatter"
diff --git a/recipes-opie/opie-freetype/opie-freetype.inc b/recipes-opie/opie-freetype/opie-freetype.inc
index ddb704b..32c26a8 100644
--- a/recipes-opie/opie-freetype/opie-freetype.inc
+++ b/recipes-opie/opie-freetype/opie-freetype.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Freetype fontfactory plugin"
 SECTION = "opie/fontfactories"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "freetype opie-ttf-support"
diff --git a/recipes-opie/opie-ftp/opie-ftp.inc b/recipes-opie/opie-ftp/opie-ftp.inc
index d486bad..bb04d90 100644
--- a/recipes-opie/opie-ftp/opie-ftp.inc
+++ b/recipes-opie/opie-ftp/opie-ftp.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie-Ftp"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libopiecore2 opie-ftplib"
diff --git a/recipes-opie/opie-go/opie-go.inc b/recipes-opie/opie-go/opie-go.inc
index 68e83de..a11c206 100644
--- a/recipes-opie/opie-go/opie-go.inc
+++ b/recipes-opie/opie-go/opie-go.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The game of Go"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "go"
diff --git a/recipes-opie/opie-gutenbrowser/opie-gutenbrowser.inc b/recipes-opie/opie-gutenbrowser/opie-gutenbrowser.inc
index 6cfba84..28b39d3 100644
--- a/recipes-opie/opie-gutenbrowser/opie-gutenbrowser.inc
+++ b/recipes-opie/opie-gutenbrowser/opie-gutenbrowser.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Etext reader for the Project Gutenberg."
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-ftplib"
diff --git a/recipes-opie/opie-handwriting/opie-handwriting.inc b/recipes-opie/opie-handwriting/opie-handwriting.inc
index 35d6645..67c7d51 100644
--- a/recipes-opie/opie-handwriting/opie-handwriting.inc
+++ b/recipes-opie/opie-handwriting/opie-handwriting.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Handwriting input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qhandwriting"
diff --git a/recipes-opie/opie-help-en/opie-help-en.inc b/recipes-opie/opie-help-en/opie-help-en.inc
index 8c705a1..78ad55a 100644
--- a/recipes-opie/opie-help-en/opie-help-en.inc
+++ b/recipes-opie/opie-help-en/opie-help-en.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Help Packages - English"
 SECTION = "opie/help"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 ALLOW_EMPTY = "1"
diff --git a/recipes-opie/opie-helpbrowser/opie-helpbrowser.inc b/recipes-opie/opie-helpbrowser/opie-helpbrowser.inc
index 5dbf480..e9d3b1a 100644
--- a/recipes-opie/opie-helpbrowser/opie-helpbrowser.inc
+++ b/recipes-opie/opie-helpbrowser/opie-helpbrowser.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Help Browser"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "helpbrowser"
diff --git a/recipes-opie/opie-homeapplet/opie-homeapplet.inc b/recipes-opie/opie-homeapplet/opie-homeapplet.inc
index 8bf669d..086cc4a 100644
--- a/recipes-opie/opie-homeapplet/opie-homeapplet.inc
+++ b/recipes-opie/opie-homeapplet/opie-homeapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Home Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "homeapplet"
diff --git a/recipes-opie/opie-i18n/opie-i18n.inc b/recipes-opie/opie-i18n/opie-i18n.inc
index 2f7a609..f2be6f9 100644
--- a/recipes-opie/opie-i18n/opie-i18n.inc
+++ b/recipes-opie/opie-i18n/opie-i18n.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie i18n files"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-lrelease-native"
diff --git a/recipes-opie/opie-i18n/opie-lrelease-native.inc b/recipes-opie/opie-i18n/opie-lrelease-native.inc
index 7bf9885..4900f62 100644
--- a/recipes-opie/opie-i18n/opie-lrelease-native.inc
+++ b/recipes-opie/opie-i18n/opie-lrelease-native.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie native i18n tool lrelease"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "uicmoc3-native"
diff --git a/recipes-opie/opie-i18n/opie-lupdate-native.inc b/recipes-opie/opie-i18n/opie-lupdate-native.inc
index 3ab1e22..3ac610f 100644
--- a/recipes-opie/opie-i18n/opie-lupdate-native.inc
+++ b/recipes-opie/opie-i18n/opie-lupdate-native.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie native i18n tool lupdate"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "uicmoc3-native"
diff --git a/recipes-opie/opie-icon-reload/opie-icon-reload.inc b/recipes-opie/opie-icon-reload/opie-icon-reload.inc
index 68ee4fa..fe897c8 100644
--- a/recipes-opie/opie-icon-reload/opie-icon-reload.inc
+++ b/recipes-opie/opie-icon-reload/opie-icon-reload.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Reload .desktop files on the fly"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-init/opie-init.inc b/recipes-opie/opie-init/opie-init.inc
index 04a611a..3e89664 100644
--- a/recipes-opie/opie-init/opie-init.inc
+++ b/recipes-opie/opie-init/opie-init.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Startup scripts and config"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 #APPNAME = "qpe"
diff --git a/recipes-opie/opie-irc/opie-irc.inc b/recipes-opie/opie-irc/opie-irc.inc
index e693e45..28495f9 100644
--- a/recipes-opie/opie-irc/opie-irc.inc
+++ b/recipes-opie/opie-irc/opie-irc.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Opie IRC client lets you chat on your favorite IRC server using your handheld computer"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 I18N_FILES = "opieirc.ts"
diff --git a/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc b/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
index 3343c9e..8813ad8 100644
--- a/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
+++ b/recipes-opie/opie-irdaapplet/opie-irdaapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "IrDA Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "irdaapplet"
diff --git a/recipes-opie/opie-jumpx/opie-jumpx.inc b/recipes-opie/opie-jumpx/opie-jumpx.inc
index b707420..a26fd41 100644
--- a/recipes-opie/opie-jumpx/opie-jumpx.inc
+++ b/recipes-opie/opie-jumpx/opie-jumpx.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "JumpX input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qjumpx"
diff --git a/recipes-opie/opie-kcheckers/opie-kcheckers.inc b/recipes-opie/opie-kcheckers/opie-kcheckers.inc
index 2b3c31b..f057365 100644
--- a/recipes-opie/opie-kcheckers/opie-kcheckers.inc
+++ b/recipes-opie/opie-kcheckers/opie-kcheckers.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The game of Checkers"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "kcheckers"
diff --git a/recipes-opie/opie-keyboard/opie-keyboard.inc b/recipes-opie/opie-keyboard/opie-keyboard.inc
index c404036..5e27c33 100644
--- a/recipes-opie/opie-keyboard/opie-keyboard.inc
+++ b/recipes-opie/opie-keyboard/opie-keyboard.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Keyboard input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-pickboard"
diff --git a/recipes-opie/opie-keypebble/opie-keypebble.inc b/recipes-opie/opie-keypebble/opie-keypebble.inc
index 2e1f8dc..e0d883f 100644
--- a/recipes-opie/opie-keypebble/opie-keypebble.inc
+++ b/recipes-opie/opie-keypebble/opie-keypebble.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A VNC Viewer"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "keypebble"
diff --git a/recipes-opie/opie-keytabs/opie-keytabs.inc b/recipes-opie/opie-keytabs/opie-keytabs.inc
index 8fed946..4f51c05 100644
--- a/recipes-opie/opie-keytabs/opie-keytabs.inc
+++ b/recipes-opie/opie-keytabs/opie-keytabs.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie keytabs for terminal applications"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-keyview/opie-keyview.inc b/recipes-opie/opie-keyview/opie-keyview.inc
index f99b15f..b21d243 100644
--- a/recipes-opie/opie-keyview/opie-keyview.inc
+++ b/recipes-opie/opie-keyview/opie-keyview.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Keyview Development Inputmethod"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "keyview"
diff --git a/recipes-opie/opie-kjumpx/opie-kjumpx.inc b/recipes-opie/opie-kjumpx/opie-kjumpx.inc
index 9f7eef3..252371c 100644
--- a/recipes-opie/opie-kjumpx/opie-kjumpx.inc
+++ b/recipes-opie/opie-kjumpx/opie-kjumpx.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Koreanized JumpX input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-pics"
diff --git a/recipes-opie/opie-kpacman/opie-kpacman.inc b/recipes-opie/opie-kpacman/opie-kpacman.inc
index c0e52d7..41cc192 100644
--- a/recipes-opie/opie-kpacman/opie-kpacman.inc
+++ b/recipes-opie/opie-kpacman/opie-kpacman.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Kpacman, the classical arcade game of Pacman"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "kpacman"
diff --git a/recipes-opie/opie-language/opie-language.inc b/recipes-opie/opie-language/opie-language.inc
index 5733fac..7d08a25 100644
--- a/recipes-opie/opie-language/opie-language.inc
+++ b/recipes-opie/opie-language/opie-language.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Language settings dialog"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "language"
diff --git a/recipes-opie/opie-launcher-settings/opie-launcher-settings.inc b/recipes-opie/opie-launcher-settings/opie-launcher-settings.inc
index 8c60bfe..547014b 100644
--- a/recipes-opie/opie-launcher-settings/opie-launcher-settings.inc
+++ b/recipes-opie/opie-launcher-settings/opie-launcher-settings.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Launcher settings dialog"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2"
diff --git a/recipes-opie/opie-libqrsync/opie-libqrsync.inc b/recipes-opie/opie-libqrsync/opie-libqrsync.inc
index ed657dd..7ceae07 100644
--- a/recipes-opie/opie-libqrsync/opie-libqrsync.inc
+++ b/recipes-opie/opie-libqrsync/opie-libqrsync.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Qt wrapper for librsync"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-light-and-power/opie-light-and-power.inc b/recipes-opie/opie-light-and-power/opie-light-and-power.inc
index 15b24bd..cec3c99 100644
--- a/recipes-opie/opie-light-and-power/opie-light-and-power.inc
+++ b/recipes-opie/opie-light-and-power/opie-light-and-power.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Light and Power settings dialog"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "light-and-power"
diff --git a/recipes-opie/opie-lockapplet/opie-lockapplet.inc b/recipes-opie/opie-lockapplet/opie-lockapplet.inc
index 706162b..837a417 100644
--- a/recipes-opie/opie-lockapplet/opie-lockapplet.inc
+++ b/recipes-opie/opie-lockapplet/opie-lockapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Lock Opie now Button to lock Opie (as configured in the Security settings) on demand."
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "lockapplet"
diff --git a/recipes-opie/opie-login/opie-login.inc b/recipes-opie/opie-login/opie-login.inc
index 79e3a3b..8d1c671 100644
--- a/recipes-opie/opie-login/opie-login.inc
+++ b/recipes-opie/opie-login/opie-login.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "Opie Login Manager (similar to gdm, xdm or kdm)"
 SECTION = "opie/base"
-LICENSE = "GPL"
+# opie-login is GPLv2+, core/apps/calibrate and core/launcher are GPLv2
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RRECOMMENDS_${PN} = "opie-logoutapplet"
@@ -29,4 +30,4 @@ do_configure() {
 	install -d "${WORKDIR}/apps"
 	ln -s "${WORKDIR}/calibrate" "${WORKDIR}/apps/calibrate"
 	palmtop_do_configure
-}
++}
diff --git a/recipes-opie/opie-logoutapplet/opie-logoutapplet.inc b/recipes-opie/opie-logoutapplet/opie-logoutapplet.inc
index f7ee8c2..0c015a9 100644
--- a/recipes-opie/opie-logoutapplet/opie-logoutapplet.inc
+++ b/recipes-opie/opie-logoutapplet/opie-logoutapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Logout Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "logoutapplet"
diff --git a/recipes-opie/opie-mail/opie-mail.inc b/recipes-opie/opie-mail/opie-mail.inc
index f06706e..5525be5 100644
--- a/recipes-opie/opie-mail/opie-mail.inc
+++ b/recipes-opie/opie-mail/opie-mail.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie's mail and news client featuring POP3, IMAP and NNTP - with and without SSL."
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libmailwrapper libetpan"
diff --git a/recipes-opie/opie-mailapplet/opie-mailapplet.inc b/recipes-opie/opie-mailapplet/opie-mailapplet.inc
index 83c87b5..53329c7 100644
--- a/recipes-opie/opie-mailapplet/opie-mailapplet.inc
+++ b/recipes-opie/opie-mailapplet/opie-mailapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Biff-like mailchecker"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libmailwrapper"
diff --git a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1-core.inc b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1-core.inc
index aa0ef87..2e2ec5f 100644
--- a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1-core.inc
+++ b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1-core.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The classic Opie media player (core)"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2"
diff --git a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
index a0693f2..22b1069 100644
--- a/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
+++ b/recipes-opie/opie-mediaplayer1/opie-mediaplayer1.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "The classic Opie media player (core+plugins)."
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 ALLOW_EMPTY = "1"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.5.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.5.bb
index 22667a9..5163ec1 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.5.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_1.2.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_git.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_git.bb
index cb85eb0..9478766 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_git.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.5.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.5.bb
index f8ebb6b..92221c7 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.5.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_git.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_git.bb
index 3a4e15d..7713bff 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_git.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-default_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.5.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.5.bb
index 8445771..6d31993 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.5.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_git.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_git.bb
index 952d7e2..ffef8bb 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_git.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-pod_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.5.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.5.bb
index 767e827..29ccbf0 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.5.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_git.bb b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_git.bb
index 3c0a7fb..a37690b 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_git.bb
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2-skin-techno_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Skin for opie-mediaplayer2"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opieplayer2"
diff --git a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2.inc b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2.inc
index 3fe64cb..6500c65 100644
--- a/recipes-opie/opie-mediaplayer2/opie-mediaplayer2.inc
+++ b/recipes-opie/opie-mediaplayer2/opie-mediaplayer2.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The next generation mediaplayer for Opie - based on libxine. \
 It plays mp3, mpeg, wav, ogg, quicktime, divx, etc. and is capable of streaming."
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libxine libqtaux2 opie-mediaplayer2-skin-default"
diff --git a/recipes-opie/opie-mediummount/opie-mediummount.inc b/recipes-opie/opie-mediummount/opie-mediummount.inc
index ec61278..247b7db 100644
--- a/recipes-opie/opie-mediummount/opie-mediummount.inc
+++ b/recipes-opie/opie-mediummount/opie-mediummount.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Medium mount configuration"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "mediummount"
diff --git a/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc b/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
index 4b351df..d3f8125 100644
--- a/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
+++ b/recipes-opie/opie-memoryapplet/opie-memoryapplet.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Memory Applet. \
 This applet displays the amount of free memory and manages the swap partition"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "memoryapplet"
diff --git a/recipes-opie/opie-mindbreaker/opie-mindbreaker.inc b/recipes-opie/opie-mindbreaker/opie-mindbreaker.inc
index 398c42e..365c8c7 100644
--- a/recipes-opie/opie-mindbreaker/opie-mindbreaker.inc
+++ b/recipes-opie/opie-mindbreaker/opie-mindbreaker.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: crack the coloured code"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "mindbreaker"
diff --git a/recipes-opie/opie-minesweep/opie-minesweep.inc b/recipes-opie/opie-minesweep/opie-minesweep.inc
index 857edbc..758aba3 100644
--- a/recipes-opie/opie-minesweep/opie-minesweep.inc
+++ b/recipes-opie/opie-minesweep/opie-minesweep.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: find the mines"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "minesweep"
diff --git a/recipes-opie/opie-multikey/opie-multikey.inc b/recipes-opie/opie-multikey/opie-multikey.inc
index b7d835b..9b3e10d 100644
--- a/recipes-opie/opie-multikey/opie-multikey.inc
+++ b/recipes-opie/opie-multikey/opie-multikey.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Multiple language keyboard"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2 opie-pickboard"
diff --git a/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc b/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
index c88ed6b..381204f 100644
--- a/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
+++ b/recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Multikey Keyboard Layout Switcher Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "multikeyapplet"
diff --git a/recipes-opie/opie-networkapplet/opie-networkapplet.inc b/recipes-opie/opie-networkapplet/opie-networkapplet.inc
index 5f2a191..48e7486 100644
--- a/recipes-opie/opie-networkapplet/opie-networkapplet.inc
+++ b/recipes-opie/opie-networkapplet/opie-networkapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Network Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-networksettings"
diff --git a/recipes-opie/opie-networksettings/opie-networksettings.inc b/recipes-opie/opie-networksettings/opie-networksettings.inc
index 15c307f..a507e0f 100644
--- a/recipes-opie/opie-networksettings/opie-networksettings.inc
+++ b/recipes-opie/opie-networksettings/opie-networksettings.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Network Settings"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 PROVIDES = "opie-networksettings-pppplugin opie-networksettings-wlanplugin"
diff --git a/recipes-opie/opie-notes/opie-notes.inc b/recipes-opie/opie-notes/opie-notes.inc
index 03f3120..8274013 100644
--- a/recipes-opie/opie-notes/opie-notes.inc
+++ b/recipes-opie/opie-notes/opie-notes.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Notes"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-notes"
diff --git a/recipes-opie/opie-notesapplet/opie-notesapplet.inc b/recipes-opie/opie-notesapplet/opie-notesapplet.inc
index 9767cf2..8494d6c 100644
--- a/recipes-opie/opie-notesapplet/opie-notesapplet.inc
+++ b/recipes-opie/opie-notesapplet/opie-notesapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Notes Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "notesapplet"
diff --git a/recipes-opie/opie-oyatzee/opie-oyatzee.inc b/recipes-opie/opie-oyatzee/opie-oyatzee.inc
index 4418def..ca05ba6 100644
--- a/recipes-opie/opie-oyatzee/opie-oyatzee.inc
+++ b/recipes-opie/opie-oyatzee/opie-oyatzee.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Yatzee-like game"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "oyatzee"
diff --git a/recipes-opie/opie-parashoot/opie-parashoot.inc b/recipes-opie/opie-parashoot/opie-parashoot.inc
index f109ccb..f35b7ce 100644
--- a/recipes-opie/opie-parashoot/opie-parashoot.inc
+++ b/recipes-opie/opie-parashoot/opie-parashoot.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: shoot the parachutists"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "parashoot"
diff --git a/recipes-opie/opie-pickboard/opie-pickboard.inc b/recipes-opie/opie-pickboard/opie-pickboard.inc
index 5c78397..e8dee76 100644
--- a/recipes-opie/opie-pickboard/opie-pickboard.inc
+++ b/recipes-opie/opie-pickboard/opie-pickboard.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Pickboard input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qpickboard"
diff --git a/recipes-opie/opie-pics/opie-pics.inc b/recipes-opie/opie-pics/opie-pics.inc
index d5486fc..a4adad2 100644
--- a/recipes-opie/opie-pics/opie-pics.inc
+++ b/recipes-opie/opie-pics/opie-pics.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Common Opie pictures usable from all applications"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 PR = "r2"
diff --git a/recipes-opie/opie-powerchord/opie-powerchord.inc b/recipes-opie/opie-powerchord/opie-powerchord.inc
index 9b3878f..cbfdddb 100644
--- a/recipes-opie/opie-powerchord/opie-powerchord.inc
+++ b/recipes-opie/opie-powerchord/opie-powerchord.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Guitar Chord generator application"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "powerchord"
diff --git a/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc b/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
index e578c15..7ce7cce 100644
--- a/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
+++ b/recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Python Quicklaunch Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "pyquicklaunch"
diff --git a/recipes-opie/opie-qasteroids/opie-qasteroids.inc b/recipes-opie/opie-qasteroids/opie-qasteroids.inc
index 623ce91..9ffc2e7 100644
--- a/recipes-opie/opie-qasteroids/opie-qasteroids.inc
+++ b/recipes-opie/opie-qasteroids/opie-qasteroids.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: shoot the asteroids"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qasteroids"
diff --git a/recipes-opie/opie-qcop/opie-qcop.inc b/recipes-opie/opie-qcop/opie-qcop.inc
index 8f09c1a..28fbb46 100644
--- a/recipes-opie/opie-qcop/opie-qcop.inc
+++ b/recipes-opie/opie-qcop/opie-qcop.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie QCOP IPC Client"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-qss/opie-qss.inc b/recipes-opie/opie-qss/opie-qss.inc
index 0942955..bbf414e 100644
--- a/recipes-opie/opie-qss/opie-qss.inc
+++ b/recipes-opie/opie-qss/opie-qss.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Sound Sever Daemon"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-quicklauncher/opie-quicklauncher.inc b/recipes-opie/opie-quicklauncher/opie-quicklauncher.inc
index b7d355f..c2bf69c 100644
--- a/recipes-opie/opie-quicklauncher/opie-quicklauncher.inc
+++ b/recipes-opie/opie-quicklauncher/opie-quicklauncher.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Opie Quick Launcher Loader"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-reader/opie-reader.inc b/recipes-opie/opie-reader/opie-reader.inc
index ab33881..6e82e5f 100644
--- a/recipes-opie/opie-reader/opie-reader.inc
+++ b/recipes-opie/opie-reader/opie-reader.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "E-Book reader"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-reader"
diff --git a/recipes-opie/opie-reader/uqtreader_1.2.5.bb b/recipes-opie/opie-reader/uqtreader_1.2.5.bb
index 6731f23..ec70e15 100644
--- a/recipes-opie/opie-reader/uqtreader_1.2.5.bb
+++ b/recipes-opie/opie-reader/uqtreader_1.2.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "qt4-x11 opie-reader ebook reader port"
 SECTION = "x11/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-reader/uqtreader_git.bb b/recipes-opie/opie-reader/uqtreader_git.bb
index 72b950e..ad6c223 100644
--- a/recipes-opie/opie-reader/uqtreader_git.bb
+++ b/recipes-opie/opie-reader/uqtreader_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "qt4-x11 opie-reader ebook reader port"
 SECTION = "x11/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-recorder/opie-recorder.inc b/recipes-opie/opie-recorder/opie-recorder.inc
index be33b68..1ee45cd 100644
--- a/recipes-opie/opie-recorder/opie-recorder.inc
+++ b/recipes-opie/opie-recorder/opie-recorder.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Audio sampling recorder"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opierec"
diff --git a/recipes-opie/opie-restartapplet/opie-restartapplet.inc b/recipes-opie/opie-restartapplet/opie-restartapplet.inc
index ca9a1e5..027cac9 100644
--- a/recipes-opie/opie-restartapplet/opie-restartapplet.inc
+++ b/recipes-opie/opie-restartapplet/opie-restartapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Restart Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "restartapplet"
diff --git a/recipes-opie/opie-restartapplet2/opie-restartapplet2.inc b/recipes-opie/opie-restartapplet2/opie-restartapplet2.inc
index e76ccd6..25ba59b 100644
--- a/recipes-opie/opie-restartapplet2/opie-restartapplet2.inc
+++ b/recipes-opie/opie-restartapplet2/opie-restartapplet2.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Restart Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "restartapplet2"
diff --git a/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc b/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
index 1be094e..396c0e9 100644
--- a/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
+++ b/recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Screenshot Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "screenshotapplet"
diff --git a/recipes-opie/opie-search/opie-search.inc b/recipes-opie/opie-search/opie-search.inc
index adbdf68..8df1462 100644
--- a/recipes-opie/opie-search/opie-search.inc
+++ b/recipes-opie/opie-search/opie-search.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Search through all PIM data"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "osearch"
diff --git a/recipes-opie/opie-security/opie-security.inc b/recipes-opie/opie-security/opie-security.inc
index 1ab2913..24ac1fb 100644
--- a/recipes-opie/opie-security/opie-security.inc
+++ b/recipes-opie/opie-security/opie-security.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Security settings dialog for the Opie environment."
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "security"
diff --git a/recipes-opie/opie-securityplugins/opie-securityplugin.inc b/recipes-opie/opie-securityplugins/opie-securityplugin.inc
index 6fd02c7..b679f31 100644
--- a/recipes-opie/opie-securityplugins/opie-securityplugin.inc
+++ b/recipes-opie/opie-securityplugins/opie-securityplugin.inc
@@ -1,5 +1,5 @@
 SECTION = "opie/security"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-security"
diff --git a/recipes-opie/opie-sfcave/opie-sfcave.inc b/recipes-opie/opie-sfcave/opie-sfcave.inc
index db3ae5e..53bb9b8 100644
--- a/recipes-opie/opie-sfcave/opie-sfcave.inc
+++ b/recipes-opie/opie-sfcave/opie-sfcave.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "SFCave for the Zaurus. Fly the dot though the cave avoiding the walls."
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "sfcave"
diff --git a/recipes-opie/opie-sh-snes/opie-sh-snes.inc b/recipes-opie/opie-sh-snes/opie-sh-snes.inc
index d7939c7..85b5372 100644
--- a/recipes-opie/opie-sh-snes/opie-sh-snes.inc
+++ b/recipes-opie/opie-sh-snes/opie-sh-snes.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Displays a list of available ROMs for use with snes9x."
 SECTION = "opie/shell"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb b/recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb
index 575399a..97ec480 100644
--- a/recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb
+++ b/recipes-opie/opie-sh-snes/opie-sh-snes_0.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Displays a list of available ROMs for use with snes9x."
 SECTION = "opie/shell"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-sheet/opie-sheet.inc b/recipes-opie/opie-sheet/opie-sheet.inc
index 49937d3..e7d893c 100644
--- a/recipes-opie/opie-sheet/opie-sheet.inc
+++ b/recipes-opie/opie-sheet/opie-sheet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Sheet"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-sheet"
diff --git a/recipes-opie/opie-snake/opie-snake.inc b/recipes-opie/opie-snake/opie-snake.inc
index 9817bb2..a841887 100644
--- a/recipes-opie/opie-snake/opie-snake.inc
+++ b/recipes-opie/opie-snake/opie-snake.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: control the snake"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "snake"
diff --git a/recipes-opie/opie-solitaire/opie-solitaire.inc b/recipes-opie/opie-solitaire/opie-solitaire.inc
index 4adc266..a4e0392 100644
--- a/recipes-opie/opie-solitaire/opie-solitaire.inc
+++ b/recipes-opie/opie-solitaire/opie-solitaire.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: solitaire card games"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "patience"
diff --git a/recipes-opie/opie-sounds/opie-sounds.inc b/recipes-opie/opie-sounds/opie-sounds.inc
index 8f40771..8a8b2ea 100644
--- a/recipes-opie/opie-sounds/opie-sounds.inc
+++ b/recipes-opie/opie-sounds/opie-sounds.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Common Opie Sounds"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/recipes-opie/opie-stumbler/opie-stumbler.inc b/recipes-opie/opie-stumbler/opie-stumbler.inc
index 68f45f1..5d4a1f5 100644
--- a/recipes-opie/opie-stumbler/opie-stumbler.inc
+++ b/recipes-opie/opie-stumbler/opie-stumbler.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Wireless Network Scanner"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RRECOMMENDS_${PN} = "manufacturers"
diff --git a/recipes-opie/opie-style-flat/opie-style-flat.inc b/recipes-opie/opie-style-flat/opie-style-flat.inc
index c3d5047..edd223e 100644
--- a/recipes-opie/opie-style-flat/opie-style-flat.inc
+++ b/recipes-opie/opie-style-flat/opie-style-flat.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Simple, flat widget style for Opie"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "flatstyle"
diff --git a/recipes-opie/opie-style-fresh/opie-style-fresh.inc b/recipes-opie/opie-style-fresh/opie-style-fresh.inc
index a834952..e9da2e2 100644
--- a/recipes-opie/opie-style-fresh/opie-style-fresh.inc
+++ b/recipes-opie/opie-style-fresh/opie-style-fresh.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie widget style"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "freshstyle"
diff --git a/recipes-opie/opie-style-liquid/opie-style-liquid.inc b/recipes-opie/opie-style-liquid/opie-style-liquid.inc
index 0267dbf..a922e1c 100644
--- a/recipes-opie/opie-style-liquid/opie-style-liquid.inc
+++ b/recipes-opie/opie-style-liquid/opie-style-liquid.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Liquid style by Mosfet"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = " libqtaux2"
diff --git a/recipes-opie/opie-style-metal/opie-style-metal.inc b/recipes-opie/opie-style-metal/opie-style-metal.inc
index ef6abec..7b533ba 100644
--- a/recipes-opie/opie-style-metal/opie-style-metal.inc
+++ b/recipes-opie/opie-style-metal/opie-style-metal.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Metal Style by Trolltech"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "metal"
diff --git a/recipes-opie/opie-style-phase/opie-style-phase.inc b/recipes-opie/opie-style-phase/opie-style-phase.inc
index bc7406e..5ff39c2 100644
--- a/recipes-opie/opie-style-phase/opie-style-phase.inc
+++ b/recipes-opie/opie-style-phase/opie-style-phase.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Opie Phase disguishes oneself through its' simple, clean and slick look. \
 It is based on http://www.usermode.org/code.html Phase 0.4."
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "phasestyle"
diff --git a/recipes-opie/opie-style-web/opie-style-web.inc b/recipes-opie/opie-style-web/opie-style-web.inc
index 667ddce..7defc4a 100644
--- a/recipes-opie/opie-style-web/opie-style-web.inc
+++ b/recipes-opie/opie-style-web/opie-style-web.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A flatter widget style than flat :)"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "webstyle"
diff --git a/recipes-opie/opie-suspendapplet/opie-suspendapplet.inc b/recipes-opie/opie-suspendapplet/opie-suspendapplet.inc
index 719051e..7ed84db 100644
--- a/recipes-opie/opie-suspendapplet/opie-suspendapplet.inc
+++ b/recipes-opie/opie-suspendapplet/opie-suspendapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Suspend Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "suspendapplet"
diff --git a/recipes-opie/opie-symlinker/opie-symlinker.inc b/recipes-opie/opie-symlinker/opie-symlinker.inc
index 1c7c4ce..c662523 100644
--- a/recipes-opie/opie-symlinker/opie-symlinker.inc
+++ b/recipes-opie/opie-symlinker/opie-symlinker.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Enables apps on external media"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-update-symlinks"
diff --git a/recipes-opie/opie-sysinfo/opie-sysinfo.inc b/recipes-opie/opie-sysinfo/opie-sysinfo.inc
index 4bc7968..69eaf53 100644
--- a/recipes-opie/opie-sysinfo/opie-sysinfo.inc
+++ b/recipes-opie/opie-sysinfo/opie-sysinfo.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "System Information dialog for the Opie environment"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "sysinfo"
diff --git a/recipes-opie/opie-tableviewer/opie-tableviewer.inc b/recipes-opie/opie-tableviewer/opie-tableviewer.inc
index 775e251..eb4e947 100644
--- a/recipes-opie/opie-tableviewer/opie-tableviewer.inc
+++ b/recipes-opie/opie-tableviewer/opie-tableviewer.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "XML database browsers"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "tableviewer"
diff --git a/recipes-opie/opie-taskbar/opie-taskbar-images.inc b/recipes-opie/opie-taskbar/opie-taskbar-images.inc
index e41404d..91e5c84 100644
--- a/recipes-opie/opie-taskbar/opie-taskbar-images.inc
+++ b/recipes-opie/opie-taskbar/opie-taskbar-images.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Launcher and Taskbar"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qpe"
diff --git a/recipes-opie/opie-taskbar/opie-taskbar.inc b/recipes-opie/opie-taskbar/opie-taskbar.inc
index 14d56f2..68f8d8f 100644
--- a/recipes-opie/opie-taskbar/opie-taskbar.inc
+++ b/recipes-opie/opie-taskbar/opie-taskbar.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Launcher and Taskbar"
 SECTION = "opie/base"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-libqrsync opie-qss"
diff --git a/recipes-opie/opie-tetrix/opie-tetrix.inc b/recipes-opie/opie-tetrix/opie-tetrix.inc
index 1f2edf8..36ac8a6 100644
--- a/recipes-opie/opie-tetrix/opie-tetrix.inc
+++ b/recipes-opie/opie-tetrix/opie-tetrix.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Game: control falling blocks"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "tetrix"
diff --git a/recipes-opie/opie-textedit/opie-textedit.inc b/recipes-opie/opie-textedit/opie-textedit.inc
index a4dc962..16f9821 100644
--- a/recipes-opie/opie-textedit/opie-textedit.inc
+++ b/recipes-opie/opie-textedit/opie-textedit.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Text Editor"
 SECTION = "opie/pim"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "textedit"
diff --git a/recipes-opie/opie-theme/opie-theme.inc b/recipes-opie/opie-theme/opie-theme.inc
index 3a07559..4018ada 100644
--- a/recipes-opie/opie-theme/opie-theme.inc
+++ b/recipes-opie/opie-theme/opie-theme.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Themed style"
 SECTION = "opie/styles"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "theme"
diff --git a/recipes-opie/opie-tictac/opie-tictac.inc b/recipes-opie/opie-tictac/opie-tictac.inc
index 64f7df5..9b5d4a6 100644
--- a/recipes-opie/opie-tictac/opie-tictac.inc
+++ b/recipes-opie/opie-tictac/opie-tictac.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Tic Tac Toe game."
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "tictac"
diff --git a/recipes-opie/opie-tinykate/opie-tinykate.inc b/recipes-opie/opie-tinykate/opie-tinykate.inc
index 7979927..d549654 100644
--- a/recipes-opie/opie-tinykate/opie-tinykate.inc
+++ b/recipes-opie/opie-tinykate/opie-tinykate.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Kate Text Editor for Opie"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libqtaux2"
diff --git a/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc b/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
index 0bf5d5f..26f5bf0 100644
--- a/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
+++ b/recipes-opie/opie-today-addressbookplugin/opie-today-addressbookplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Addressbook plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-today libqtaux2"
diff --git a/recipes-opie/opie-today-datebookplugin/opie-today-datebookplugin.inc b/recipes-opie/opie-today-datebookplugin/opie-today-datebookplugin.inc
index 729bb83..c684057 100644
--- a/recipes-opie/opie-today-datebookplugin/opie-today-datebookplugin.inc
+++ b/recipes-opie/opie-today-datebookplugin/opie-today-datebookplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Datebook plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-today"
diff --git a/recipes-opie/opie-today-mailplugin/opie-today-mailplugin.inc b/recipes-opie/opie-today-mailplugin/opie-today-mailplugin.inc
index 6b38bdb..ac5eeee 100644
--- a/recipes-opie/opie-today-mailplugin/opie-today-mailplugin.inc
+++ b/recipes-opie/opie-today-mailplugin/opie-today-mailplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Mail plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-today opie-mailapplet"
diff --git a/recipes-opie/opie-today-stocktickerplugin/opie-today-stocktickerplugin.inc b/recipes-opie/opie-today-stocktickerplugin/opie-today-stocktickerplugin.inc
index 33e927a..ba74c55 100644
--- a/recipes-opie/opie-today-stocktickerplugin/opie-today-stocktickerplugin.inc
+++ b/recipes-opie/opie-today-stocktickerplugin/opie-today-stocktickerplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Stock ticker plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "opie-today libqtaux2"
diff --git a/recipes-opie/opie-today-todolistplugin/opie-today-todolistplugin.inc b/recipes-opie/opie-today-todolistplugin/opie-today-todolistplugin.inc
index 3c7ccfb..9491839 100644
--- a/recipes-opie/opie-today-todolistplugin/opie-today-todolistplugin.inc
+++ b/recipes-opie/opie-today-todolistplugin/opie-today-todolistplugin.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Todo list plugin for Today"
 SECTION = "opie/today"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RDEPENDS_${PN} = "opie-today"
diff --git a/recipes-opie/opie-tonleiter/opie-tonleiter.inc b/recipes-opie/opie-tonleiter/opie-tonleiter.inc
index 60dfb1b..240dcdb 100644
--- a/recipes-opie/opie-tonleiter/opie-tonleiter.inc
+++ b/recipes-opie/opie-tonleiter/opie-tonleiter.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Music scales for string instruments"
 SECTION = "opie/multimedia"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "tonleiter"
diff --git a/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc b/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
index 20477eb..3c9268e 100644
--- a/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
+++ b/recipes-opie/opie-unikeyboard/opie-unikeyboard.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Unicode input method"
 SECTION = "opie/inputmethods"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "qunikeyboard"
diff --git a/recipes-opie/opie-vmemo-settings/opie-vmemo-settings.inc b/recipes-opie/opie-vmemo-settings/opie-vmemo-settings.inc
index 85db5f0..46dfed2 100644
--- a/recipes-opie/opie-vmemo-settings/opie-vmemo-settings.inc
+++ b/recipes-opie/opie-vmemo-settings/opie-vmemo-settings.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Sound settings dialog"
 SECTION = "opie/settings"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "sound"
diff --git a/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc b/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
index 5ff869c..c18a979 100644
--- a/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
+++ b/recipes-opie/opie-volumeapplet/opie-volumeapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Volume applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "volumeapplet"
diff --git a/recipes-opie/opie-vtapplet/opie-vtapplet.inc b/recipes-opie/opie-vtapplet/opie-vtapplet.inc
index 70ea1b9..0aad0fe 100644
--- a/recipes-opie/opie-vtapplet/opie-vtapplet.inc
+++ b/recipes-opie/opie-vtapplet/opie-vtapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "VT Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "vtapplet"
diff --git a/recipes-opie/opie-wellenreiter/opie-wellenreiter.inc b/recipes-opie/opie-wellenreiter/opie-wellenreiter.inc
index 1c966bf..8523c18 100644
--- a/recipes-opie/opie-wellenreiter/opie-wellenreiter.inc
+++ b/recipes-opie/opie-wellenreiter/opie-wellenreiter.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Wireless Network Monitor"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 RRECOMMENDS_${PN} = "manufacturers"
diff --git a/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc b/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
index dcf7d0c..e57a6be 100644
--- a/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
+++ b/recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Wireless Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "wirelessapplet"
diff --git a/recipes-opie/opie-wordgame/opie-wordgame.inc b/recipes-opie/opie-wordgame/opie-wordgame.inc
index 9496598..7dbc60e 100644
--- a/recipes-opie/opie-wordgame/opie-wordgame.inc
+++ b/recipes-opie/opie-wordgame/opie-wordgame.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Crossword game"
 SECTION = "opie/games"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "wordgame"
diff --git a/recipes-opie/opie-write/opie-write.inc b/recipes-opie/opie-write/opie-write.inc
index df0e4c1..4dff176 100644
--- a/recipes-opie/opie-write/opie-write.inc
+++ b/recipes-opie/opie-write/opie-write.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Opie Write"
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "opie-write"
diff --git a/recipes-opie/opie-zkbapplet/opie-zkbapplet.inc b/recipes-opie/opie-zkbapplet/opie-zkbapplet.inc
index 69ed434..30a7112 100644
--- a/recipes-opie/opie-zkbapplet/opie-zkbapplet.inc
+++ b/recipes-opie/opie-zkbapplet/opie-zkbapplet.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "KeyZ Applet"
 SECTION = "opie/applets"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "zkbapplet"
diff --git a/recipes-opie/opie-zsafe/opie-zsafe.inc b/recipes-opie/opie-zsafe/opie-zsafe.inc
index 6dfce30..f7fb134 100644
--- a/recipes-opie/opie-zsafe/opie-zsafe.inc
+++ b/recipes-opie/opie-zsafe/opie-zsafe.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Password manager program for Opie."
 SECTION = "opie/applications"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 APPNAME = "zsafe"
-- 
1.7.2.5



