Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDE478457
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 03:02:59 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so1644218pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 20:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LFavsx44+kfdGJLkoLi7bMYKnKcqRbiIT4wJD7exsWk=;
	b=pIv1f7sUfol8SrPsGRfegj5siPrVF2N3zwniY9bnmm4NGn6MI/0r7ZCx5+zWFtIXZz
	tfWwkCb0iUtfLR9EN6pR5mFJqo9OTY3OxNy04E2w13Yn1D2X9lMsxXdTFqP0ZuS4SZOL
	R9yWzJkxZnQR5Le7nF2Cbti0ramfWCSfYaBtegobdLodi4E+utYsrOUq84js4xyZaf50
	SoytV/fD0d8CZE9pcJrE5mg/VH8BTPA/HPqJRcsxgrQvjHYAgFcez880DJxY0/LoT8aD
	vmmLeu+5stu6Mgc9U1s54OP97Iv/dJjfyzlVzzO7G85mlwmMBa5XvCoACcxPO59UobIr
	MFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LFavsx44+kfdGJLkoLi7bMYKnKcqRbiIT4wJD7exsWk=;
	b=t6Ho9aH9tHW7hxND8mZYIQ4jlrOWA/kMmrRnr8V/wU7L5tHX0h8c23stW6gsJZ6ax4
	0PJ1Z5Od0xqCODCyjZOxqBlxz09Vdfla2hPOwNl1AHGB0QtRNc2uGj2tdjtGCaqQCJWG
	0Yw3ws4BpHIENM5D8SUgX3ZBc9NlJp5LwMXyF115at4Pq3rn7uDi4hbwDsCcZIJ23v77
	3kKDEa0zRPsac2rxrafDL/HLSVSAgeuMJVoqkGUCcOIzXHKqAbSwKokWFvDpDzAW/nwC
	n1PQxoG/ioFL5Qhrj9VOw0mScevBRRyg/Vt0xLJIYOnaCoRirlyJ0isvA+WFP3tBWRkn
	P/gQ==
X-Gm-Message-State: AHPjjUhYm/67x/30hEdZTXrAoRx0EE+NEkstlXsDcvJ+yT7hKcYuPslt
	fxjqsusIllaxno3MmOfSuSE=
X-Google-Smtp-Source: AOwi7QAWSWFENjShFB7b1jtXvKG095/BkNxWf/xiPfnjNaNuc3L1CSLt5GfGMWpewAVhLTEZLxF8ig==
X-Received: by 10.101.65.77 with SMTP id x13mr995539pgp.144.1506135780478;
	Fri, 22 Sep 2017 20:03:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:d126:a20b:717e:18a0])
	by smtp.gmail.com with ESMTPSA id
	r22sm1421829pfe.78.2017.09.22.20.02.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Sep 2017 20:02:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 20:02:58 -0700
Message-Id: <1506135778-13189-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko][PATCH][Maintainership] README: update maintainers list for rocko
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
X-List-Received-Date: Sat, 23 Sep 2017 03:02:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 15 +++++++--------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          |  4 ++--
 meta-webserver/README       |  4 ++--
 meta-xfce/README            | 11 ++++++-----
 10 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..9ddd09e 100644
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
+  branch: rocko
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: rocko
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][rocko]' in the subject.
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][rocko][PATCH
 
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..25ef85d 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][rocko]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][rocko][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..b7dbfef 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 
@@ -20,13 +20,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][rocko]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][rocko][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..b59dfe0 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-layers: meta-oe, meta-ruby
-branch: master
+layers: meta-oe
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][rocko]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][rocko][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..771c73c 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,16 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][rocko]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][rocko][PATCH
+
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 You may also contact the maintainers directly.
 
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..dabed2f 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,15 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][rocko]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][rocko][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..cc965af 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: rocko 
   revision: HEAD
   prio: default
 
@@ -75,12 +75,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][rocko]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][rocko][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 905d5ee..43740f6 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: rocko 
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch:  rocko
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..f2928ab 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: rocko 
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: rocko 
 revision: HEAD
 
 
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..3367797 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: rocko
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: rocko
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,10 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][rocko]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][rocko][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+rocko Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


