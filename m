Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39F1165D4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:16:34 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so54622439pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tiAtySnXg2Pa/JpL6JXXqUwe7jU/O5jFNPFHoQ6evVo=;
	b=bFWMWUzn1LZeI+4SlHoPETP0uVid1lCTRt1M1JJlNhjm/eg0jQsV/QxXxod7IHli3v
	lXJ1Ey62Itd3KHt2ZtcJey3q8/r3ocWaR6P7H8aYHT05lPE25m69LFHVA5s9RW349/Bb
	yjfQ+e3dCO+F+AxtIuHJQ9yD3x7d/4q9u+ek9UMQB+NSLs/2wP7c0jfxXL2rAKpCoxjZ
	OuwaHXVRx1mjApf8hJ8B+yKiM2nP6REkIvD1j+mH2V/Agd2Epyz2ZF7WxCFVxKEd1S3l
	GT9EfEccI4oOqhkoTUH88nqok4/Gbm1OXLTxUDRti29NA+uJIkaEzjIaT/k1XQygyLVy
	Oj8g==
X-Received: by 10.70.55.105 with SMTP id r9mr4457330pdp.147.1422638196354;
	Fri, 30 Jan 2015 09:16:36 -0800 (PST)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	uc2sm11316859pbc.56.2015.01.30.09.16.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Jan 2015 09:16:35 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2015 09:16:34 -0800
Message-Id: <1422638194-21335-2-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1422638194-21335-1-git-send-email-ashcharles@gmail.com>
References: <1422638194-21335-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH 2/2] xfce4-diskperf-plugin: Specify BSD license
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
X-List-Received-Date: Fri, 30 Jan 2015 17:16:43 -0000

This software contains an older or slightly modified BSD license in
its COPYING file and assigns copyright to the specific authors.  The
code (see the About function) makes it clear that a BSD
license is intended:

      "license", xfce_get_license_text (XFCE_LICENSE_TEXT_BSD),

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
index 1aadd2c..2df9b9f 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin displaying instant disk/partition performance"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
-LICENSE = "RogerSeguin"
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
-- 
2.1.0


