Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHk-0007eM-LK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:30 +0200
Received: by gyd5 with SMTP id 5so802676gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZX6gfSpMd/f7rWJClyulF+QzSIENP7CpADf3/0pZtcc=;
	b=nL7yDI5oyZVzBP4vw7wZhGG3ap36M09giI28mnmbpA5+nJcxxbryol2X61twrboL3/
	T91/GBpkoR2Op6/7dzszKPgMUfcQo495GTTvMwbz6HzRuhIaXDya79LVDH1RlyPvn58P
	pr/5UzDH1ujegQ7dSqEUez149CGpeoZenr2kI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ARhj2LIbNgDrviRCUfkJ0AINJZfhjQqDCQmdQ8yvx//aCHmH3FAAcfZX6IoaCntmCk
	TMZVD4lrXZZ0++yqrOTWR1jbUUBF0J6QuLXCy5MD8onQWBqhJY/gogOs//xYKXW6vR8K
	2Wn1Bd6F+7X8Gkcrgbef5o0VF48Y+4So6rFiU=
Received: by 10.150.11.11 with SMTP id 11mr3764474ybk.219.1287668027050;
	Thu, 21 Oct 2010 06:33:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:46 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:16 -0500
Message-Id: <1287668010-11310-9-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 08/22] glib-2.0: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:59 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/glib-2.0/glib-2.0_2.22.4.bb |    2 +-
 recipes/glib-2.0/glib-2.0_2.23.6.bb |    2 +-
 recipes/glib-2.0/glib-2.0_2.24.0.bb |    2 +-
 recipes/glib-2.0/glib-2.0_2.24.1.bb |    2 +-
 recipes/glib-2.0/glib-2.0_2.6.4.bb  |    2 +-
 recipes/glib-2.0/glib-2.0_2.8.6.bb  |    2 +-
 recipes/glib-2.0/glib.inc           |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/glib-2.0/glib-2.0_2.22.4.bb b/recipes/glib-2.0/glib-2.0_2.22.4.bb
index 05a1342..ddaf4d2 100644
--- a/recipes/glib-2.0/glib-2.0_2.22.4.bb
+++ b/recipes/glib-2.0/glib-2.0_2.22.4.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl"
diff --git a/recipes/glib-2.0/glib-2.0_2.23.6.bb b/recipes/glib-2.0/glib-2.0_2.23.6.bb
index 51a2153..b2c900f 100644
--- a/recipes/glib-2.0/glib-2.0_2.23.6.bb
+++ b/recipes/glib-2.0/glib-2.0_2.23.6.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl zlib"
diff --git a/recipes/glib-2.0/glib-2.0_2.24.0.bb b/recipes/glib-2.0/glib-2.0_2.24.0.bb
index 3a90dc6..b0755a4 100644
--- a/recipes/glib-2.0/glib-2.0_2.24.0.bb
+++ b/recipes/glib-2.0/glib-2.0_2.24.0.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0-native gtk-doc zlib"
diff --git a/recipes/glib-2.0/glib-2.0_2.24.1.bb b/recipes/glib-2.0/glib-2.0_2.24.1.bb
index 15f0b1a..c91f626 100644
--- a/recipes/glib-2.0/glib-2.0_2.24.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.24.1.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "glib-2.0-native gtk-doc zlib"
diff --git a/recipes/glib-2.0/glib-2.0_2.6.4.bb b/recipes/glib-2.0/glib-2.0_2.6.4.bb
index 1a483f4..ca3c133 100644
--- a/recipes/glib-2.0/glib-2.0_2.6.4.bb
+++ b/recipes/glib-2.0/glib-2.0_2.6.4.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS += "glib-2.0-native gtk-doc"
diff --git a/recipes/glib-2.0/glib-2.0_2.8.6.bb b/recipes/glib-2.0/glib-2.0_2.8.6.bb
index f025046..f03072a 100644
--- a/recipes/glib-2.0/glib-2.0_2.8.6.bb
+++ b/recipes/glib-2.0/glib-2.0_2.8.6.bb
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2+"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS += "glib-2.0-native gtk-doc"
diff --git a/recipes/glib-2.0/glib.inc b/recipes/glib-2.0/glib.inc
index 5cc697f..52c2f89 100644
--- a/recipes/glib-2.0/glib.inc
+++ b/recipes/glib-2.0/glib.inc
@@ -3,7 +3,7 @@ which provides many useful data types, macros, \
 type conversions, string utilities, file utilities, a main \
 loop abstraction, and so on. It works on many \
 UNIX-like platforms, Windows, OS/2 and BeOS."
-LICENSE = "LGPL"
+LICENSE = "LGPLv2"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS += "glib-2.0-native gtk-doc"
-- 
1.7.0.4



