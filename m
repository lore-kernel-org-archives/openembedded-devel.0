Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7001C71AD4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:29:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 03 Jul 2017 04:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="874285049"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2017 04:29:10 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 01B3458028D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 04:29:09 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jul 2017 14:29:27 +0300
Message-Id: <1499081367-26318-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [meta-oe][PATCH] ser2net: upgrade to version 3.4
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
X-List-Received-Date: Mon, 03 Jul 2017 11:29:10 -0000

2.9.1 -> 3.4

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-connectivity/ser2net/{ser2net_2.9.1.bb => ser2net_3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_2.9.1.bb => ser2net_3.4.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb
index 288c586..708650f 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_3.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "80011ac0e60bbdcb65f1d7a86251e3f3"
-SRC_URI[sha256sum] = "fdee1e69903cf409bdc6f32403a566cbc6006aa9e2a4d6f8f12b90dfd5ca0d0e"
+SRC_URI[md5sum] = "562274d783534276a9feac913b7d8c4e"
+SRC_URI[sha256sum] = "d846066e27c3072565990745d030357aa0c278f96b7d1d4f59023347c1db8824"
 
 inherit autotools pkgconfig
 
-- 
2.4.0


