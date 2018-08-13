Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5DF278F5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:50:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Aug 2018 10:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,234,1531810800"; d="scan'208";a="83030453"
Received: from kkurdej-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.36.13])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2018 10:50:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 19:50:27 +0200
Message-Id: <92c49e49fe80ecaa5eccbdb91e444ead321d1492.1534182463.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534182463.git.paul.eggleton@linux.intel.com>
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
Subject: [meta-multimedia][PATCH 1/4] faac: set HOMEPAGE
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
X-List-Received-Date: Mon, 13 Aug 2018 17:50:34 -0000

Set HOMEPAGE so there is a place to go for more information.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-multimedia/recipes-multimedia/faac/faac_1.29.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
index 4765c6c9c..9f11dbdaa 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
 SECTION = "libs"
 LICENSE = "LGPLv2+"
+HOMEPAGE = "http://www.audiocoding.com/faac.html"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
 
-- 
2.17.1


