Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id F20AA6E257
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 20:43:08 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id D4409221D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 21:43:07 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2013 21:44:29 +0100
Message-Id: <1386621869-11905-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-oe][PATCH] libopus: upgrade to version 1.1
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
X-List-Received-Date: Mon, 09 Dec 2013 20:43:09 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/libopus/{libopus_1.0.3.bb => libopus_1.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.0.3.bb => libopus_1.1.bb} (72%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
similarity index 72%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
index 1889775..15782a0 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.bb
@@ -6,11 +6,11 @@ technology from Skype's SILK codec and Xiph.Org's CELT codec."
 HOMEPAGE = "http://www.opus-codec.org/"
 SECTION = "libs/multimedia"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=225b2f817ea798b7c705fe1214694891"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "86eedbd3c5a0171d2437850435e6edff"
-SRC_URI[sha256sum] = "191a089c92dbc403de6980463dd3604b65beb12d283c607e246c8076363cb49c"
+SRC_URI[md5sum] = "c5a8cf7c0b066759542bc4ca46817ac6"
+SRC_URI[sha256sum] = "b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
1.8.4.2


