Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFD86FF73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 22:06:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 123so745554wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 15:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XghZWelf9LCwus5ChFXljCMJpTdh2rwGUWdv/FjxjDs=;
	b=tjQH5yj9YTsxcap7yEZ2sxFp4qNDA8t61PjBYbZsAD3xFsNp/D+T3RlkGAwHay2QXz
	lKX6pEUXr2xtSYXoilRTtj6JbPW5r3OGIiyIcj2hAuc/Mtkz0vOwrxIzSYsCh8ys5nwK
	JtvYi+URC9Dvg4OzIH3LORwa60gSqRZxvl90Z4W74cpIyyZmy2ShDfitzeu9SZEfb6iz
	/VCEjYWYj8qScULvJ64Kh9b1H8w7IJXtokjGv1as2CVrOoQZl20zDgsLillpSa2VSY6U
	Zy/CwgimV9MgOXNiY8hnRYKlmi/DyN7zLzuw5zwLjptfOSrn70c+nmEsxn6tl6sg+vFo
	wQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XghZWelf9LCwus5ChFXljCMJpTdh2rwGUWdv/FjxjDs=;
	b=hpMzvmw1cJhmjPMxiCFIx9UPH57gT0p9ZGJ+i9oUGp3piI9hOMOsxixDVBTcomVzLP
	cv4HPcG1OVD7UHrHPH32WlgnidaJp4mdkGhCQKSX3Ufesr8DDtNkPv/b0fwj3dKKn/lE
	7HyBWUAfe0xi0zfE5BDeHzOPEHw/o9H5i3aMAhG0hggNVIB/7VqhAUlS53Erwoje2+Pp
	HD30rZkLpmTJRlIDO3PyJNPj4TEsxPZR+5cY8hqHNluRu8i7YN5rfNH79WawD8/t8QlG
	wxUv12RJcN485msa4OjY55fGn4hknsCS/J42mrU0XU4JrrHCrr+PYnUudgtvBdrn7hiV
	qZug==
X-Gm-Message-State: AA6/9RnE1duYMa9Kf18su59uiwiv+WHowPMpZypN34bud1Sb4J2rw7GOEgEbm4Ekrz0W0A==
X-Received: by 10.28.234.205 with SMTP id g74mr618315wmi.64.1476223607895;
	Tue, 11 Oct 2016 15:06:47 -0700 (PDT)
Received: from akuster-ThinkPad-X240.rieo.lan ([94.186.205.19])
	by smtp.gmail.com with ESMTPSA id
	w131sm920095wmf.15.2016.10.11.15.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 15:06:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: Martin.Jansa@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:06:44 -0700
Message-Id: <1476223604-6284-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476223604-6284-1-git-send-email-akuster808@gmail.com>
References: <1476223604-6284-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [morty][PATCH] meta-openembedded: Add me to morty maintainer's list
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
X-List-Received-Date: Tue, 11 Oct 2016 22:06:47 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/README             | 10 +++++-----
 meta-filesystems/README     | 10 ++++++----
 meta-gnome/README           | 10 ++++++----
 meta-gpe/README             |  9 +++++----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 11 +++++------
 meta-networking/MAINTAINERS |  5 ++++-
 meta-networking/README      |  6 +++---
 meta-oe/README              |  9 +++++----
 meta-perl/README            |  7 ++++---
 meta-python/README          | 12 +++++-------
 meta-ruby/README            | 10 ++++++----
 meta-systemd/README         | 10 +++++-----
 meta-webserver/README       |  9 +++++----
 meta-xfce/README            |  9 +++++----
 15 files changed, 73 insertions(+), 62 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index cfffc47..e840076 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,18 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-python
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][morty][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..0a8f6cf 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,15 +10,15 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: morty
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: morty
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: morty
 
 Patches
 =======
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][morty][PATCH
 
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..1431737 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][morty][PATCH'
+
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 7d019f6..af7d98f 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
@@ -13,5 +13,6 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
+
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..906a859 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 
@@ -23,10 +23,10 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][morty][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..c540bed 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][morty][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..53593ae 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -8,10 +8,13 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][morty][PATCH
 
 You may also contact the maintainers directly.
 
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
+
 Descriptions of section entries:
 
         M: Mail patches to: FullName <address@domain>
diff --git a/meta-networking/README b/meta-networking/README
index e1ba27d..329db4f 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,19 +18,19 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/openembedded-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-oe
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-openembedded.git
 subdirectory: meta-python
-branch: master
+branch: morty
 revision: HEAD
 
 Maintenance
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..a4fc10e 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,16 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][morty][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
+
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..1f6d9a6 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: morty
   revision: HEAD
   prio: default
 
@@ -78,9 +78,10 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-perl]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][morty][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 905d5ee..7406184 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: morty
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: morty
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -42,13 +42,11 @@ Send pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-python]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][morty][PATCH'
 
 Maintenance
 -------------------------
 
-Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
-        Derek Straka <derek@asterius.io>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-ruby/README b/meta-ruby/README
index 08e0aa7..5ce01bc 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,16 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: morty
 revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][morty][PATCH'
+
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 2cd90b4..073afae 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: morty
 revision: HEAD
 
 To make BBMASK'ing per layer possible the following directory structure is
@@ -18,9 +18,9 @@ $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappe
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][morty][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index 379b54a..1a63dcc 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: morty
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: morty
 revision: HEAD
 
 
@@ -52,9 +52,10 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][morty]' in the subject.
 
-Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..5291c82 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: morty
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: morty
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -17,6 +17,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][morty][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+morty branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


