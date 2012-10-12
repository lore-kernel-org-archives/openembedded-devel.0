Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TMj4v-0008G3-TT
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2012 19:31:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2012 10:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="226182318"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2012 10:18:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2012 18:17:56 +0100
Message-Id: <2c42284c1d36415b86f8b65482aaa4113d0f92ee.1350062247.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350062247.git.paul.eggleton@linux.intel.com>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350062247.git.paul.eggleton@linux.intel.com>
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/2] modphp: make LICENSE more accurate
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
X-List-Received-Date: Fri, 12 Oct 2012 17:31:18 -0000

PHP 5 is distributed under the PHP 3.01 license (which we identify as
PHP-3.0 as far as common license files go).

Fixes the following warning:

WARNING: modphp: No generic license file exists for: PHP in any provider

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 2a73e90..55e7c92 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
-LICENSE = "PHP"
+LICENSE = "PHP-3.0"
 DEPENDS = "apache2-native apache2 zlib"
 
 SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
-- 
1.7.9.5



