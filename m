Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0A47677D92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 19:48:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c198so13390182pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 12:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OHG7KwCX2/DS8nVSqKsBDVSYf/t82igVW6xU8k4j4Rk=;
	b=TKPAfBhRB8sp9FFdbEgsJEJdKGZeozA29zLryTHNPa3oToJffEl5Pbyzz9KzeF0WCz
	O7MLBM7IXuRFqO6gPv2EnxKyvExTSarPGgWF+hlwuC/yVwCN/8tMHdkIB7WVAwkLA1nz
	UClpEfe7XoKuDNu1pbOEcGQJmK/FmxfayYvaeUOZxOJDK0BQoSWTBTqt9SBzezv9YjBy
	AAdcJRQ9W6Vk84yv54dBHjlSpFVgK48BVjbeXToRza8wwLszGCQnppsLecTD2bzBuUrX
	+swqLoZQpEG+wwAwwo1nIsctvqarCMJwydgXxXzb04AwcF2VrL33jth8fCI2Y713BnQw
	P0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OHG7KwCX2/DS8nVSqKsBDVSYf/t82igVW6xU8k4j4Rk=;
	b=XBtYhmyh9rxNIGW1kaPXlolyI5wClznijEhpyEn6NEGfs591kml0zp/nFWYczXSlSJ
	9b9zHc0TPBfXg36TGdDFmH+rN3VvLv/9Or++KydcDOfzeQA6sSPzpI7/pgeIeyVwqgmV
	uEx1dSQoXyXzWAvTd57B58mkP/9YPYbQcFIELqpbTtKJrBVZrEVL106tdAnxRJUJ1OXi
	Jjh6sQWe6lkPEBvWmwjSV8pSX4atmt3Q8vs4+7745R/HwhajlWTbwTMkuB/EVQxDBhWN
	9sZ4MCkaioEVkp5p0sRKbZCzoXqqSTE65HXSxEi97vQuv3cqwWBU/HD86dHZQUTk/OZ7
	uAXg==
X-Gm-Message-State: AN3rC/7QrzKS0EFNUM4jLeYu1G27+e7Z+UDYTmSMGDXmU/TTIpR/hq+d
	rEFBkBqA2ONJBQ==
X-Received: by 10.84.248.8 with SMTP id p8mr9932330pll.32.1493322511630;
	Thu, 27 Apr 2017 12:48:31 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	e20sm5861482pfl.134.2017.04.27.12.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 12:48:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 27 Apr 2017 12:48:30 -0700
Message-Id: <1493322510-26428-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] README: update maintainers list for pyro
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
X-List-Received-Date: Thu, 27 Apr 2017 19:48:31 -0000
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
 meta-python/README          | 16 ++++++----------
 meta-ruby/README            | 11 ++++++-----
 meta-systemd/README         | 12 ++++++------
 meta-webserver/README       | 12 ++++++++----
 meta-xfce/README            | 11 ++++++-----
 14 files changed, 83 insertions(+), 75 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index cfffc47..2c10582 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,18 +1,18 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro 
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-python
-branch: master
+branch: pyro 
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-efl][pyro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-efl][pyro][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+pyro branch maintainer(s):
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-filesystems/README b/meta-filesystems/README
index d2716f8..48fe15f 100644
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
+  branch: pyro
 
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
-  branch: master
+  branch: pyro
 
 Patches
 =======
 
 Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
-with '[meta-filesystems]' in the subject.
+with '[meta-filesystems][pyro]' in the subject.
 
 Maintainers List:
   physfs      Andreas Müller <schnitzeltony@googlemail.com>
@@ -66,8 +66,10 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix=meta-filesystems][pyro][PATCH
 
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 Table of Contents
 =================
diff --git a/meta-gnome/README b/meta-gnome/README
index 0c4fbd2..7eee0e1 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: pyro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][pyro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][pyro][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-gpe/README b/meta-gpe/README
index 7d019f6..fd2997d 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,17 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: pyro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe][pyro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][pyro][PATCH'
 
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index e24acf9..9c05e1f 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 
@@ -20,13 +20,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][pyro]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][pyro][PATCH'
 
-Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
-                   Paul Eggleton <paul.eggleton@linux.intel.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index cbdc1b5..abdc1a2 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,21 +1,20 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
 layers: meta-oe, meta-ruby
-branch: master
+branch: pyro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia][pyro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][pyro][PATCH
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                        Martin Jansa <martin.jansa@gmail.com>
-
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..8e6e3a0 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -2,13 +2,16 @@ This file contains a list of maintainers for the meta-networking layer.
 
 Please submit any patches against meta-networking to the OpenEmbedded
 development mailing list (openembedded-devel@lists.openembedded.org) with
-'[meta-networking]' in the subject.
+'[meta-networking][pyro]' in the subject.
 
 When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix=meta-networking][pyro][PATCH
+
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 You may also contact the maintainers directly.
 
diff --git a/meta-oe/README b/meta-oe/README
index 6ad87c5..fdc5640 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,15 +1,15 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][pyro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][pyro][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 68160a6..2a9b9ac 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -52,7 +52,7 @@ Dependencies
 This layer depends on:
 
   URI: git://git.openembedded.org/openembedded-core
-  branch: master
+  branch: pyro 
   revision: HEAD
   prio: default
 
@@ -75,12 +75,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-perl]' in the subject.
+'[meta-perl][pyro]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][pyro][PATCH'
 
-Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 License
 -------
diff --git a/meta-python/README b/meta-python/README
index 905d5ee..01b056c 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: pyro 
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch:  pyro
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -39,16 +39,12 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][pyro]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][pyro][PATCH'
 
 Maintenance
 -------------------------
-
-Maintainers:
-        Tim "moto-timo" Orling <TicoTimo@gmail.com>
-        Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
-        Derek Straka <derek@asterius.io>
-
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-ruby/README b/meta-ruby/README
index 08e0aa7..137bd13 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -1,16 +1,17 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: pyro
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby][pyro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][pyro][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-systemd/README b/meta-systemd/README
index 2cd90b4..804fc3f 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 And we're working to break the dependency on this one:
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: pyro
 revision: HEAD
 
 To make BBMASK'ing per layer possible the following directory structure is
@@ -15,12 +15,12 @@ used:
 
 $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name>.bbappend
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][meta-systemd][pyro]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][meta-systemd][pyro][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
-                       Martin Jansa <martin.jansa@gmail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index 7b60630..fab7217 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -13,14 +13,14 @@ This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
 subdirectory: meta
-branch: master
+branch: pyro 
 revision: HEAD
 
 For some recipes, the meta-oe layer is required:
 
 URI: git://github.com/openembedded/meta-oe.git
 subdirectory: meta-oe
-branch: master
+branch: pyro 
 revision: HEAD
 
 
@@ -52,9 +52,13 @@ Maintenance
 -----------
 
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][pyro]' in the subject.
 
-Layer maintainer: Derek Straka <derek@asterius.io>
+When sending single patches, please use something like:
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-webserver][pyro][PATCH'
+
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 33ef509..a8e21a9 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
 
 URI: git://github.com/openembedded/oe-core.git
-branch: master
+branch: pyro
 revision: HEAD
 
 URI: git://github.com/openembedded/meta-oe.git
-branch: master
+branch: pyro
 revision: HEAD
 meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this repository.
 
@@ -14,9 +14,10 @@ this to local.conf:
 
 BBMASK = "meta-xfce/recipes-multimedia"
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce][pyro]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][pyro][PATCH'
 
-Interim layer maintainer: Andreas Müller <schnitzeltony@googlemail.com>
+pyro Branch Maintainer:
+Armin Kuster <akuster808@gmail.com>
-- 
2.7.4


