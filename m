Return-Path: <ulf@emagii.com>
Received: from mxf3.bahnhof.se (mxf3.bahnhof.se [213.80.101.27])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFC877072
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:55:29 +0000 (UTC)
Received: from localhost (mxf3.local [127.0.0.1])
	by mxf3-reinject (Postfix) with ESMTP id 5221A65108F;
	Thu,  1 Oct 2015 09:55:29 +0200 (CEST)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF1)
X-Spam-Score: 0.306
X-Spam-Level: 
X-Spam-Status: No, score=0.306 tagged_above=-99 required=5
	tests=[DNS_FROM_AHBL_RHSBL=0.306]
Received: from mxf3.bahnhof.se ([127.0.0.1])
	by localhost (mxf3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2Oruceeywxb; Thu,  1 Oct 2015 09:55:22 +0200 (CEST)
Received: from smtp-auth2.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf3.bahnhof.se (Postfix) with ESMTP id 790CA65108A;
	Thu,  1 Oct 2015 09:55:22 +0200 (CEST)
Received: from Thranduil.bahnhof.se (h-169-62.a454.priv.bahnhof.se
	[37.123.169.62]) (Authenticated sender: mb782575)
	by smtp-auth2.bahnhof.se (Postfix) with ESMTPA id 59DF028440;
	Thu,  1 Oct 2015 09:55:22 +0200 (CEST)
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 09:55:11 +0200
Message-Id: <1443686111-17209-2-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443686111-17209-1-git-send-email-ulf@emagii.com>
References: <1443686111-17209-1-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Thu, 01 Oct 2015 07:55:29 -0000

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb | 2 +-
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 972a4d4..fbcf76f 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME panel"
-LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
+LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
 
 BPN = "gnome-panel"
 PR = "r1"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 4957a99..30c42c9 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME panel"
-LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
+LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
-- 
1.9.1


