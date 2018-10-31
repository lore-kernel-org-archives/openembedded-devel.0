Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id B6D3D79C41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 15:03:52 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id f26-v6so7749586pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ffRbZS0nTnb4Yiei76fhSumTKNyuKcO5yLWV6P49Bk=;
	b=sIEdjft1aKMmAUMSossvH5xL48WmmMOu75Krak+KqZe0oFdvH74+c85TKMp00NSa1e
	6JQVMtbqDvqZkfOL42xmEr3STvjVv1nSEZ8fyE/pbiuvt/Wo5lQd1l67VTzscfgpnbr3
	GGGAijX7qxIG3mbB6vwE9hdNz2BHRaPr7Xg5wZsBiw21H6DShrb/CE97xIBdlS/7tGYe
	eVh1EIYOBr4GLiIfq+PNRQjrbvVsuoFEHT7Yq8JbTEJhOSxxTjLxTpAhcX9fmiU6/fdM
	lDAxTFpBeNxVZRlWDTttq4718G6Y5azINMtSMbXggQe5rsBAGAR5It2A4xs0R8UxS3Sl
	PFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ffRbZS0nTnb4Yiei76fhSumTKNyuKcO5yLWV6P49Bk=;
	b=jdkNUCZCBwFUD1GhaD84fEkjfMLAiZAMCaRxiqeEB6PACOmvNrvwxeMhnz0iJxJZGl
	Ht3CKVpUFCi/3h/ZgaQj8C3Ay7mPRvPDH0l0iOk/QqMKpy+b7+nuHSNUt8ebr40rLJNO
	y+ubLf+r8xBOCU5IAESQrr7a3PixUDza/496E4s3xaMkpIy5ed4N6j8en/KkjSxsLt7T
	qHc3yj7XcochRYqQcSrGZnMRzE4kYcgylSi7TZNpgeogoI01QenES8xUUXiwVoUTQpWO
	4a7SfL8hkkfRzkU7SqpyB56jn79l28/elsIiPkwrTIfTjyS2G1Cp4XR8JY1TXCo48NsB
	biKg==
X-Gm-Message-State: AGRZ1gKH67I9euDdfnSWfkVDu58GZEW3LR8z2QJigJMkzbmB97U7NdLj
	7IN43KK+gIkrbItk9M5H1KY44kK9
X-Google-Smtp-Source: AJdET5fvPBF/z7L5qYimXLGj/5mQXvZPzb40tjDEymXGzCLPA3zn1Tm4wHYy4PDY5x/gBkU35LsuEQ==
X-Received: by 2002:a62:ea03:: with SMTP id
	t3-v6mr3975542pfh.228.1540998233294; 
	Wed, 31 Oct 2018 08:03:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:571:f5d0:d940:5c94])
	by smtp.gmail.com with ESMTPSA id
	w2-v6sm25798755pfw.26.2018.10.31.08.03.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 08:03:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Oct 2018 08:03:51 -0700
Message-Id: <1540998231-30955-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe] README: updated Maintainers list for Thud
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
X-List-Received-Date: Wed, 31 Oct 2018 15:03:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 README                      |  2 +-
 meta-filesystems/README     | 12 ++++++------
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
 12 files changed, 49 insertions(+), 79 deletions(-)

diff --git a/README b/README
index 7318f09..a716801 100644
--- a/README
+++ b/README
@@ -1,6 +1,6 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Khem Raj <raj.khem@gmail.com>
+Thud maintainer: Armin Kuster  <akuster808@gmail.com>
 
 This repository is a collection of layers to suppliment OE-Core
 with additional packages, Each layer have designated maintainer
diff --git a/meta-filesystems/README b/meta-filesystems/README
index 87cb685..ac0035a 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,30 +10,30 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.40
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: thud
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: thud
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][thud]' in the subject.
 
-Layer maintainer: Khem Raj <raj.khem@gmail.com>
+Thud maintainer: Armin Kuster <akuster808@gmail.com>
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][thud][PATCH
 
 
 Table of Contents
diff --git a/meta-gnome/README b/meta-gnome/README
index 2a682e7..84d4f73 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -23,16 +23,16 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: thud
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][thud]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][thud][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Thud maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 79244d4..ba2ba5f 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: thud
 revision: HEAD
 
 
@@ -20,12 +20,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][thud]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][thud][PATCH'
 
-Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
+Thud maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 20f4fb8..050392d 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,19 +1,19 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe
-branch: master
+branch: thud
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][thud]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][thud][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Thud maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 5c4c4ce..945ee86 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][thud]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][thud][PATCH
 
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
+Thud Maintainer:      Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d..7a4aca4 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: thud
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: thud
 revision: HEAD
 
 Maintenance
diff --git a/meta-oe/README b/meta-oe/README
index 0e9f842..de351f2 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -4,13 +4,13 @@ meta-oe
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: thud 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][thud]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe[thud][PATCH'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
 to share your patches, this is preferred for patch sets consisting of more than one patch.
@@ -19,4 +19,4 @@ Other services like gitorious, repo.or.cz or self-hosted setups are of course ac
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Khem Raj <raj.khem@gmail.com>
+Thud maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 67f2910..3c787f4 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: thud
   revision: HEAD
   prio: default
 
@@ -75,14 +75,12 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][thud]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][thud][PATCH'
 
-Layer maintainers:
-    Hongxu Jia <hongxu.jia@windriver.com>
-    Tim "moto-timo" Orling <ticotimo@gmail.com>
+Thud maintainers: Armin kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 705b035..9c10c78 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -13,12 +13,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: thud
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: thud
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][thud]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][thud][PATCH'
 
 Maintenance
 -------------------------
 
-Layer Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Derek Straka <derek@asterius.io>
+Thud Maintainers: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..4d2c710 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: thud
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: thud
 revision: HEAD
 
 
@@ -52,9 +52,9 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][thud]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+Thud Maintainer: Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 7431e8b..4d8dc45 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: thud
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: thud
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,9 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][thud]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][thud][PATCH'
 
-Layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+Thud Maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


