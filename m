Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id C0F4D7E7EF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:44 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f21so3420411pgi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UDmw4HRzVkFQaGbRMiSOLyQCZW7RVrHRFyfg5uIS10Q=;
	b=jDFCGsSb08UqvqaZUYttoi4ppORIrUSsgyAB+MxrH4GDKn+CFJ4r64rVJoS30gl09X
	MrXNXVOveYx0px9mKXAxC0yRwPdb0w2Sv7+gixGlUXlj/d4apPYAc/UyXsRC8ltCsOZ3
	QP/R3VfSkkU0jkE7vwLbs6/HUF9a4+3KL7DSU7AW+05NQakLsXo/JbS7hWV7Z8+jZr8t
	wvPv1oTn1rooP0OzX/ByASHlbXrUx5acN9bPCQE5rY4eGimdmjfW8ZfzPXwfITcGWATB
	2tQqj/pAgm2cMQCQc1fBD6RN+zOoY0Z4/Za1J98GTdZG2zNWdGCTUcw9IGFQ7J/PnCsV
	Q5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UDmw4HRzVkFQaGbRMiSOLyQCZW7RVrHRFyfg5uIS10Q=;
	b=dCPx44qkA7kxMgMYa9oiEpaf94GpgLJkhvdeGpBcYGe2aZRJ+Rviqf3TL5JZo7DPPC
	uK4oAsk5CcFHoyJL5LrizXY9+pl+X3m2p3XpX1mDIv9owah0RwoQllFoMudeGGFrTe9m
	gapmgPiuapVlbH+nLFaZlXQPEoRh1D2sFpGMpYsnh0GHywNrFsKq3/iyLekfhczFM0qr
	k9mp/gobUTYkkiH98acTKCHpK61UetOPu4D+QvNfRIbNtG9T7wgXYjT+ehBCMiiMuMbW
	s5GeI/v0H7xtj7nEe5sHkDssq+JwKM8H7u6Rgzb3PbGuG6DThTXCT9B3ku/QD/KX1BKH
	b4Cg==
X-Gm-Message-State: APjAAAWQlopDKFQukDx1XCq4eLk11CSjO6bR+yqsF3uNW8Y+Gy1sz47M
	bP9zanzlZC8tYThuF25sx2c81EZ5
X-Google-Smtp-Source: APXvYqyDDnvpnKUX/HatGHCXuY/MOvINC1ZomYMuBiRPXA8kKdwumO/D5jfwjzQso1S9XHuC8LrIkw==
X-Received: by 2002:a63:eb0d:: with SMTP id t13mr42541989pgh.37.1560621465699; 
	Sat, 15 Jun 2019 10:57:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:19 -0700
Message-Id: <d37d0857592a709e1e0a290da0d44bae9fdd6971.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 15/23] ttf-mplus, ttf-vlgothic: add ttf-mplus license
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:44 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* add meta-oe/licenses/ttf-mplus from ttf-mplus/027-r4/mplus-TESTFLIGHT-027/LICENSE_E
* use BPN to use the same LICENSE even with multilib
* use the same license name from ttf-vlgothic
* fixes following warnings:
  WARNING: ttf-mplus-027-r4 do_populate_lic: ttf-mplus: No generic license file exists for: ttf-mplus in any provider
  WARNING: ttf-vlgothic-20141206-r0 do_populate_lic: ttf-vlgothic: No generic license file exists for: mplus in any provider

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/ttf-mplus                               | 16 ++++++++++++++++
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb      |  2 +-
 .../recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb  |  2 +-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/licenses/ttf-mplus

diff --git a/meta-oe/licenses/ttf-mplus b/meta-oe/licenses/ttf-mplus
new file mode 100644
index 0000000..c9cdca3
--- /dev/null
+++ b/meta-oe/licenses/ttf-mplus
@@ -0,0 +1,16 @@
+M+ FONTS                                Copyright (C) 2002-2009 M+ FONTS PROJECT
+
+-
+
+LICENSE_E
+
+
+
+
+These fonts are free softwares.
+Unlimited permission is granted to use, copy, and distribute it, with
+or without modification, either commercially and noncommercially.
+THESE FONTS ARE PROVIDED "AS IS" WITHOUT WARRANTY.
+
+
+http://mplus-fonts.sourceforge.jp/mplus-outline-fonts/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 9ad348d..efcf1b6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "MPlus font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
-LICENSE = "${PN}"
+LICENSE = "${BPN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
index 62f2bb2..e522810 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
@@ -4,7 +4,7 @@ SUMMARY = "Japanese TrueType fonts from Vine Linux"
 AUTHOR = "Contributor: noonov <noonov@gmail.com>"
 HOMEPAGE = "http://vlgothic.dicey.org/"
 
-LICENSE = "mplus & BSD"
+LICENSE = "ttf-mplus & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.en;md5=66ecd0fd7e4da6246fa30317c7b66755 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
-- 
2.7.4


