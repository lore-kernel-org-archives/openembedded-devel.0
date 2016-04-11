Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 423B96FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 20:23:27 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c20so130419545pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=crq8ZWo4znl4kFwiYgAre/Tq735v266+0CYaA2x00I0=;
	b=B6W8JbaeubTp40Ma9aqskBwAwzTT2E+yEPdkRHdn0MKem2fobGbFLMbLHMchDuDApJ
	ULnGiygoNJuEqSn2Yrogo+2qs5sbIQUXtm1KgPbqmfJiKh7sitbk+CO1ofVwNXMt9RTJ
	ZWGrzagDLCjPBLgycGVyReknZ12bm/Fu7RxIcBFhsAp74aM7UnadDS4oUJ6lodwae1Kt
	ddSH/qExbyY7M0kND31I9JMmUy/tX3nqNe4sTekwSxxetM7e7w1vbtOy04TgWZL1dmkX
	UTN9eLfPPiKBBSDg51w9qIVSobkb6lqJxW21DJr0CHvlB7X1XF7LX5vpRvR6dP/64erP
	FFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=crq8ZWo4znl4kFwiYgAre/Tq735v266+0CYaA2x00I0=;
	b=mRXIjsiZDi+SBWVfLsy59KetfdbsjYNiwQ/qoxexPiZ4BAseRPCY2dmUGLLH6qCNlL
	R2/2fD86VyU0KAHTk4UBA0nM5CNI64PRf8tnFO+ApggjoVaWrcKUcSE0ylwLNgcwQUdf
	7h5BbUKmYsh3cj6rufL/FY54kAtizYyIydNAhrUlqV74qV3cTqGmuk9wlw8s7N6VOvOG
	3m/kvHZWbaA0lkyCB1nsOtxlaQIu28zDhaseL55wa8nRyqs/6xXpdJymZMgZ3pKjbbTL
	+fUY6s9W5EplSFvQVb1J9FPy6iF3fpkBe3HXMxbxWzVOEWs8c9CneQ1DlYefAh6P/yfa
	FzWQ==
X-Gm-Message-State: AD7BkJKdg96GDhSlgZl88rn8LBeQ9GFLo+tA32Q6S8BwPd9erJFxbQezAqO2DvkcbENX6g==
X-Received: by 10.98.72.213 with SMTP id q82mr35508223pfi.164.1460406208599;
	Mon, 11 Apr 2016 13:23:28 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	g28sm38147518pfd.25.2016.04.11.13.23.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 13:23:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 13:23:23 -0700
Message-Id: <1460406203-5139-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460406203-5139-1-git-send-email-akuster808@gmail.com>
References: <1460406203-5139-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] README: update maintainers list for krogoth
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
X-List-Received-Date: Mon, 11 Apr 2016 20:23:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-efl/README             | 12 ++++++------
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-gpe/README             | 12 ++++++------
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 13 ++++++-------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          | 14 ++++++--------
 meta-ruby/README            | 11 ++++++-----
 meta-systemd/README         | 12 ++++++------
 meta-webserver/README       | 12 +++++++-----
 meta-xfce/README            | 11 ++++++-----
 14 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index cfffc47..438efc5 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,18 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth 
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-python
-branch: master
+branch: krogoth 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][krogoth]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][krogoth][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+krogoth branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..026c132 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -10,22 +10,22 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.28
 
   URI: git://git.openembedded.org/openembedded-core
   layers: meta
-  branch: master
+  branch: krogoth
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: krogoth
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][krogoth]' in the subject.
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][krogoth][PATCH
 
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..2a889e4 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: krogoth
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][krogoth]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][krogoth][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 7d019f6..70055af 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: krogoth
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe][krogoth]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][krogoth][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..ea03a1d 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 
@@ -20,13 +20,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][krogoth]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][krogoth][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..9364618 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
-branch: master
+branch: krogoth
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][krogoth]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][krogoth][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..f389672 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,16 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][krogoth]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][krogoth][PATCH
+
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 You may also contact the maintainers directly.
 
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..a564c29 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,15 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][krogoth]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][krogoth][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..86c5c1a 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: krogoth 
   revision: HEAD
   prio: default
 
@@ -75,12 +75,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][krogoth]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][krogoth][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index f62ab8f..36e76bf 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: krogoth 
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch:  krogoth
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -39,15 +39,13 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][krogoth]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][krogoth][PATCH'
 
 Maintenance
 -------------------------
 
-Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
-
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-ruby/README b/meta-ruby/README
index 08e0aa7..17fdde9 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: krogoth
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][krogoth]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][krogoth][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 2cd90b4..d39e234 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 To make BBMASK'ing per layer possible the following directory structure is
@@ -15,12 +15,12 @@ used:
 
 $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd][krogoth]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][krogoth][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index 379b54a..e842279 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: krogoth 
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: krogoth 
 revision: HEAD
 
 
@@ -50,12 +50,14 @@ Notes
 
 Maintenance
 -----------
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-systemd][krogoth]' in the subject'
 
-Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+When sending single patches, please use something like:
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-systemd][krogoth][PATCH'
 
-Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
 
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..350ca11 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: krogoth
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: krogoth
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,10 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][krogoth]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][krogoth][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+krogoth Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
-- 
1.9.1


