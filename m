Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D4EE560C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 07:46:03 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so6963496eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 23:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LYiorHT5Or0pArXpkFgmjkcyc3RmCJvRDAN1iNnN/uA=;
	b=Y96xrODUMz2GxDwNPPvEoceMhCKVblDtERHdByLDK/LrFySmpxptfdMXDDK6QsNoYg
	e15Ut/QTW/u2wD/bTeiOJ+gE4EJvXbbkf0MLaE2c8Qa1xt3JAQGGPSiidDAhShz7gj2T
	UvrDd/ALsGdCDgENX4EwVkwadYOV6FgJTNI5zBLesckeMOg/1iO7kj+XYAkqpKjltWYW
	iWoZU2wtlW+4nmKZBNJrfWziMAlU4vm/AGSoN0srW2UvUBjDEdp2NDzTOuWqkzZF6ery
	2Jp64TxQx2HB2yi1T74BETyuzr2TUuiDUiKUR10IZ5LE9D8KLF0HMI9PVhcBdQngMUKA
	XCRw==
X-Received: by 10.14.127.132 with SMTP id d4mr6476051eei.66.1388821564613;
	Fri, 03 Jan 2014 23:46:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm151346474eeg.0.2014.01.03.23.46.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 23:46:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 08:46:08 +0100
Message-Id: <1388821568-16253-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][PATCH] Update after toplevel LICENSE file checksum change
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Jan 2014 07:46:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb              | 2 +-
 .../recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb | 2 +-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb               | 2 +-
 meta-oe/recipes-core/llvm/llvm-common.bb                                | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb                | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-boot.bb                 | 2 +-
 meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb       | 2 +-
 meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb           | 2 +-
 meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb            | 2 +-
 meta-oe/recipes-extended/zram/zram_0.1.bb                               | 2 +-
 meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb          | 2 +-
 .../recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb    | 2 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb          | 2 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb      | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index 25f5357..fa261a5 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Efl Software Development Kit"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 ALLOW_EMPTY_${PN} = "1"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 70a88d7..b761317 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Efl Software Development Kit"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 ALLOW_EMPTY_${PN} = "1"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index ff91b20..ec476f8 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Configuration files for kexecboot"
 DESCRIPTION = "Default icon and boot.cfg for kexecboot linux-as-bootloader."
 SECTION = "base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 PR = "r14"
 
 SRC_URI = "file://icon.xpm"
diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index 395ab01..cedfde7 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Helper script for OE's llvm support"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
 "
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index c100b79..4f7e705 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "Basic task to get a device online"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r13"
 
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
index a46f4fa..c29d9ef 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-boot.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r58"
 
diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index b9e5a29..346ccf1 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Packages required for a target (on-device) SDK"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r1"
 
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
index 373e4f0..eced4b6 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-datetime.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Create usergroup datetime. All members off this group are allowed set date/time/timezone via system dbus"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 require polkit-group-rule.inc
 
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
index bba1136..551ed3e 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-network.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Create usergroup network. All members off this group are allowed to modify networkmanager settings"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 require polkit-group-rule.inc
 
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index 02abb12..1a89e7e 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 inherit update-rc.d systemd
 
diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
index 9512986..56130f2 100644
--- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Machine specific systemd units"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index b869572..d9e0ae6 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "All packages multimedia packages available for XFCE"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 inherit packagegroup
 
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 3d8b062..4b789b2 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 PR = "r5"
 
 inherit packagegroup
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 30fd138..bf0135a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "All packages for full XFCE installation"
 SECTION = "x11/wm"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 PR = "r10"
 
-- 
1.8.4.3


