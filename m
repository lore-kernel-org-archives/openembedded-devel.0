Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8584866070
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:06:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 04:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="431437195"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 04:06:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 12:05:56 +0100
Message-Id: <6e9591cc23376bdf9779b337340f60adf6dd0ba1.1399979085.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 3/4] xdebug: update to 2.2.5
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
X-List-Received-Date: Tue, 13 May 2014 11:06:39 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-php/xdebug/{xdebug_2.2.3.bb => xdebug_2.2.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.3.bb => xdebug_2.2.5.bb} (85%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
similarity index 85%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
index 3c4d8e4..ffff135 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
@@ -7,8 +7,8 @@ DEPENDS = "modphp"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "e49cec9861b45dc0b36eae33bf8a14fa"
-SRC_URI[sha256sum] = "b351872da46ed8378dff90a87673f5ec1e0bdd94324558ebc898e1d115e9d71c"
+SRC_URI[md5sum] = "7e571ce8eb6fa969fd8263969019849d"
+SRC_URI[sha256sum] = "adc6fe92dcff2368be94d20a5997aadb4d46d74551e2dd6602a704a35a195a6f"
 
 inherit autotools
 
-- 
1.9.0


