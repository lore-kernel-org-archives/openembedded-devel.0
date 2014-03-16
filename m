Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A99B86E79A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 03:49:25 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id fp1so4205460pdb.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C8GQIJ+ModygHBvtsGRNPJnRojVmURca45ApPiV8R+Q=;
	b=KmAmUNmLbxd1eL59EBViJMayMdYbkBuG9rIQw1QcryrijRpES3/vY4086Dx1gok4+L
	y2bJ5tqC0hcC/7boIB+SfaX6Q3hTsAZCfudp6pNm0Iod9QT6J73TZesOs1R8bqo5q+Ep
	TJvnMI4/YLE63tErgJim4W9qdhS3ugbBI2hFwYEXbkKkVfgIsMAxUysiNQIufeW/s6Rq
	K4OKDoed88yOeqoggoP7EUbNE7Ztury4xfd5LMgNkVJd2os+jFRDewwl6CFyvvDh9M5W
	R15IRwWeWdQ3L7GNp6lewdocVZ5RvA8JJjjar/90xFso0LU20QDhFzYkLL152/sr4OT+
	Z9NA==
X-Received: by 10.68.178.1 with SMTP id cu1mr18034648pbc.34.1394941766893;
	Sat, 15 Mar 2014 20:49:26 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id kt8sm3378077pab.7.2014.03.15.20.49.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 20:49:25 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Mar 2014 20:51:16 -0700
Message-Id: <1394941876-9995-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] vlc: bump to v2.1.4
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
X-List-Received-Date: Sun, 16 Mar 2014 03:49:29 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/{vlc_2.1.2.bb => vlc_2.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_2.1.2.bb => vlc_2.1.4.bb} (59%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
similarity index 59%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
index 9dc2b10..46a2712 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
@@ -7,5 +7,5 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0002-glibc-does-not-provide-strlcpy.patch \
 "
 
-SRC_URI[md5sum] = "fb6787ad749aadcfaeab3471939b3426"
-SRC_URI[sha256sum] = "219b812be1bc2eba40faa86419d0aa2c479a7380af8af216e8bfa22eb6fc8ec4"
+SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
+SRC_URI[sha256sum] = "3e566c7525478167e18cc53dc75d621e4af91eb40aabb6231e47db25d682d5d3"
-- 
1.8.3.2


