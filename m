Return-Path: <pbarker@toganlabs.com>
X-Greylist: delayed 5157 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Mar 2017 17:49:03 UTC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81E7C73129
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 17:49:03 +0000 (UTC)
Received: from mfilter10-d.gandi.net (mfilter10-d.gandi.net [217.70.178.139])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 5EFF6A8108;
	Mon, 13 Mar 2017 18:49:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter10-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter10-d.gandi.net (mfilter10-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id xLCj_V-W2SgW; Mon, 13 Mar 2017 18:49:01 +0100 (CET)
X-Originating-IP: 86.24.150.36
Received: from host0.betafive.co.uk
	(cpc15-shep11-2-0-cust35.8-3.cable.virginm.net [86.24.150.36])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 02327A80E6;
	Mon, 13 Mar 2017 18:49:00 +0100 (CET)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id 61F914265A60; Mon, 13 Mar 2017 17:49:00 +0000 (GMT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Mar 2017 17:48:58 +0000
Message-Id: <20170313174858.19815-2-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170313174858.19815-1-pbarker@toganlabs.com>
References: <20170313174858.19815-1-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 2/2] toybox: Upgrade to 0.7.3
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
X-List-Received-Date: Mon, 13 Mar 2017 17:49:04 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-core/toybox/{toybox_0.7.2.bb => toybox_0.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.7.2.bb => toybox_0.7.3.bb} (93%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.2.bb b/meta-oe/recipes-core/toybox/toybox_0.7.3.bb
similarity index 93%
rename from meta-oe/recipes-core/toybox/toybox_0.7.2.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.3.bb
index 84146584d..0cd44ff64 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.3.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "372d8fdf6ea3675edbf1f6a4109b6db6"
-SRC_URI[sha256sum] = "79da71c7c39cef0a5f7b834f0b17d0d436e7994dd33e912f581b4c12d3b1681f"
+SRC_URI[md5sum] = "6fa2a001402cb067ba541e0d8948da50"
+SRC_URI[sha256sum] = "e6469b508224e0d2e4564dda05c4bb47aef5c28bf29d6c983bcdc6e3a0cd29d6"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
-- 
2.11.0


