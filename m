Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0136D723
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 16:40:04 +0000 (UTC)
Received: from soylentgreen.sue.net
	(83-64-248-68.inzersdorf.xdsl-line.inode.at [83.64.248.68])
	by ptmx.org (Postfix) with ESMTPSA id 9BA182B3C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 17:40:05 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Nov 2013 17:39:38 +0100
Message-Id: <1383755978-16245-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1383755978-16245-1-git-send-email-dv@pseudoterminal.org>
References: <1383755978-16245-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH 2/2] libopus: upgrade to version 1.0.3
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
X-List-Received-Date: Wed, 06 Nov 2013 16:40:04 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../libopus/{libopus_0.9.14.bb => libopus_1.0.3.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_0.9.14.bb => libopus_1.0.3.bb} (72%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb
similarity index 72%
rename from meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb
index 7eb9779..1889775 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.0.3.bb
@@ -6,11 +6,11 @@ technology from Skype's SILK codec and Xiph.Org's CELT codec."
 HOMEPAGE = "http://www.opus-codec.org/"
 SECTION = "libs/multimedia"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6d9f9b3714db6bbcfb6e42170d9c664d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=225b2f817ea798b7c705fe1214694891"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "c7161b247a8437ae6b0f11dd872e69e8"
-SRC_URI[sha256sum] = "b1cad6846a8f819a141009fe3f8f10c946e8eff7e9c2339cd517bb136cc59eae"
+SRC_URI[md5sum] = "86eedbd3c5a0171d2437850435e6edff"
+SRC_URI[sha256sum] = "191a089c92dbc403de6980463dd3604b65beb12d283c607e246c8076363cb49c"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
1.8.3.2


