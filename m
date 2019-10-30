Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 43B9D7FBCB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 08:06:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id y8so641026plk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BchP+Y4K0K2KlsdaprP58dLsXZbQVl39R9+dS2RFBIU=;
	b=HZpoX/le/3PqXBhEAOfdyv96fHGQ1hcTxV7X9D7hfJ0T5qSb9qo9iqpCNZZlhn+xM+
	Jst4a3UTBcs3s1/9rehw1erAMyerM5UNA4UHUqakI/ESR1N9j4+EpyKB4FLXsLnVCsiJ
	V9iB65HdTfysMGDDsMeoyTVgoReKuzvkmC9ikQzEeZYnoy8yDL7t9cpx3ycDz7b/w8D0
	xUL1W+gMlNcm2jW8dBz47OwGwqi5qRTsXTbVBG7DHHcbUxEGuS72WEOdUwgLhBcLOCwU
	qntoPpsd7Msa5Bg2c7yHShiVnV7kGh3KRFGCcPdkak2vYPxg5a6TX4kHXWTTiPvF2dH4
	Mwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BchP+Y4K0K2KlsdaprP58dLsXZbQVl39R9+dS2RFBIU=;
	b=CJ2hAao/7ii2qnly5ikjSl4SMethKpQdKuZ+df6504xDqCEp9p72w49UxQMdkgWSlh
	UQ2kmWmyGBM8lLgb3Rv/IqCCu6x/8XiivIaEj9BOL4eVzX/qNo4LiQUc1epyA2qqMJEI
	Txk5zPwsOUJ6m4RucW6UxOxe6/gBx7PaqcqX1N3pEo94l4PSXoYljxL4pDdgI0HiAbxc
	cLddlotm9/PptBvr4aMCNb6nHUHEPV/oIfzCFMUgAwMExWM16OnPqH/imUOvyGneElvR
	STykUTRgI4bB04tn7EoJJuc4wlzJwOPz7TCeJrFrdE1pAODsaPj+6gvSHwBFqMycxV/9
	14vQ==
X-Gm-Message-State: APjAAAUi/hpwAf91PUCVIwHuKjj/uqxBaCqIQ0/QMViUE+p0mJLHkCwT
	E+YE62XAagLFKZiotd1ExPVIlKNC
X-Google-Smtp-Source: APXvYqx6EZsKAHVmkxv/IDLKJdKTDejAhGMo0SwPn/bM2lOaDKxXBa7Jhtj06IOxNIAs+L4pIzg+YQ==
X-Received: by 2002:a17:902:a584:: with SMTP id
	az4mr3163283plb.74.1572422794718; 
	Wed, 30 Oct 2019 01:06:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id h4sm1856673pgg.81.2019.10.30.01.06.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Oct 2019 01:06:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 09:06:30 +0100
Message-Id: <1572422790-16185-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [zeus][PATCH] README: updated Maintainers list for Zeus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2019 08:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README                      |  2 +-
 meta-filesystems/README     | 10 +++++-----
 meta-gnome/README           | 10 +++++-----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 10 +++++-----
 meta-networking/MAINTAINERS | 32 +++-----------------------------
 meta-networking/README      |  6 +++---
 meta-oe/README              |  8 ++++----
 meta-perl/README            | 10 ++++------
 meta-python/README          | 12 +++++-------
 meta-webserver/README       |  8 ++++----
 meta-xfce/README            | 10 +++++-----
 12 files changed, 48 insertions(+), 78 deletions(-)

diff --git a/README b/README
index 7318f09..d0b5b91 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+zeus maintainer: Armin Kuster  <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index edcf8bf..7d1945c 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -11,26 +11,26 @@ This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: zeus
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: zeus
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][zeus]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+zeus maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][zeus][PATCH
 
 
 Table of Contents
diff --git a/meta-gnome/README b/meta-gnome/README
index 3c5b4c5..cffd93a 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -3,16 +3,16 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: zeus
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][zeus]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][zeus][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+zeus maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 79244d4..f786d22 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 
@@ -20,12 +20,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][zeus]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][zeus][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+zeus maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 20f4fb8..968079f 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,19 +1,19 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe
-branch: master
+branch: zeus
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][zeus]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][zeus][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+zeus maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 5c4c4ce..1fcb636 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][zeus]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][zeus][PATCH
 
-You may also contact the maintainers directly.
-
-Descriptions of section entries:
-
-        M: Mail patches to: FullName <address@domain>
-        F: Files and directories with wildcard patterns.
-           A trailing slash includes all files and subdirectory files.
-           F: recipes-devtools/    all files in and below recipes-devtools
-           F: recipes-selinux/*    all files in recipes-selinux, but not below
-           One pattern per line.  Multiple F: lines acceptable.
-
-Please keep this list in alphabetical order.
-
-Maintainers List (try to look for most precise areas first)
-
-COMMON
-M:      Khem Raj <raj.khem@gmail.com>
-M:      "Joe MacDonald (backup)" <joe@deserted.net>
-L:      openembedded-devel@lists.openembedded.org
-Q:      https://patchwork.openembedded.org/project/oe/
-S:      Maintained
-F:      conf
-F:      recipes-*
-
-NETKIT
-M:      Armin Kuster <akuster808@gmail.com>
-F:      recipes-netkit
+zeus Maintainer:      Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d..41217dd 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: zeus
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: zeus
 revision: HEAD
 
 Maintenance
diff --git a/meta-oe/README b/meta-oe/README
index 347816b..623056e 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -4,7 +4,7 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
@@ -14,10 +14,10 @@ e.g. on archlinux based distributions install prerequisites like below
 
 pacman -S lib32-gcc-libs lib32-glibc
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][zeus]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][zeus][PATCH'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -26,4 +26,4 @@ Other services like gitorious, repo.or.cz or self-hosted setups are of course ac
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+zeus maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 67f2910..6f18466 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: zeus
   revision: HEAD
   prio: default
 
@@ -75,14 +75,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][zeus]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][zeus][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+zeus maintainers: Armin kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 705b035..bd79192 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -13,12 +13,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: zeus
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: zeus
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][zeus]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][zeus][PATCH'
 
 Maintenance
 -------------------------
 
-Layer Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+zeus Maintainers: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..b39cd23 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: zeus
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: zeus
 revision: HEAD
 
 
@@ -52,9 +52,9 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][zeus]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+zeus Maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 70ad47a..b250307 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: zeus
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: zeus
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][zeus]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][zeus][PATCH'
 
-Layer maintainer: Kai Kang <kai.kang@windriver.com>
+zeus Maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


