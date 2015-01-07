Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD7A57213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825827"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:27 +0000
Message-Id: <7c3b03d569b028a10560b94d203d3057e2d7165c.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v4 12/13] xdebug: update to 2.2.6
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:52 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-php/xdebug/{xdebug_2.2.5.bb => xdebug_2.2.6.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.5.bb => xdebug_2.2.6.bb} (85%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb
similarity index 85%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb
index 6f472fb..1ecac88 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb
@@ -6,8 +6,8 @@ DEPENDS = "php"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "7e571ce8eb6fa969fd8263969019849d"
-SRC_URI[sha256sum] = "adc6fe92dcff2368be94d20a5997aadb4d46d74551e2dd6602a704a35a195a6f"
+SRC_URI[md5sum] = "f216356861e27284580d0208060ea7fa"
+SRC_URI[sha256sum] = "6dd1cba0605e75009331aa3625a19ef49ade5a75aa9fe2ff8a818108d2cce84e"
 
 inherit autotools
 
-- 
1.9.3


