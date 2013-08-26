Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 705996BABF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 13:55:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2013 06:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,958,1367996400"; d="scan'208";a="351708259"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 06:55:18 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 16:54:47 +0300
Message-Id: <1377525287-9015-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] python-docutils: upgrade to 0.11
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
X-List-Received-Date: Mon, 26 Aug 2013 13:55:19 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 ...hon-docutils_0.5.bb => python-docutils_0.11.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-docutils_0.5.bb => python-docutils_0.11.bb} (55%)

diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb b/meta-oe/recipes-devtools/python/python-docutils_0.11.bb
similarity index 55%
rename from meta-oe/recipes-devtools/python/python-docutils_0.5.bb
rename to meta-oe/recipes-devtools/python/python-docutils_0.11.bb
index e4c8a7d..f435e1b 100644
--- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
+++ b/meta-oe/recipes-devtools/python/python-docutils_0.11.bb
@@ -2,14 +2,13 @@ DESCRIPTION = "Text processing system"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=ac6ee29ac0310c091afab5ac4bea2fa3"
-PR = "r2"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=da0d261d1db78ab21ce86c79364a4098"
 
 DEPENDS = "python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "dd72dac92fc8e3eb0f48c3effeef80f6"
-SRC_URI[sha256sum] = "747cf984edfca0575addbb42453274a1bdd98ec7780bd37a883dc8b2a66a610e"
+SRC_URI[md5sum] = "20ac380a18b369824276864d98ec0ad6"
+SRC_URI[sha256sum] = "9af4166adf364447289c5c697bb83c52f1d6f57e77849abcccd6a4a18a5e7ec9"
 
 S = "${WORKDIR}/docutils-${PV}"
 
-- 
1.7.9.5


