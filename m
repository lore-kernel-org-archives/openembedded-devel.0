Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOPPj-0008OS-1d
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:55:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2012 01:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,599,1344236400"; d="scan'208";a="207060479"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2012 01:42:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:42:18 +0100
Message-Id: <824b12b942eab77352cc6d90c1af1d63bbea607b.1350463306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 4/4] iso-codes: set SUMMARY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 08:55:43 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
index c9b9113..9502923 100644
--- a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
+++ b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
@@ -1,7 +1,8 @@
+SUMMARY = "ISO language, territory, currency, script codes and their translations"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4073466e57df23d39721513219e4f7ae"
-- 
1.7.9.5



