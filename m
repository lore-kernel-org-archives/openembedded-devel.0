Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 18AB06FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:15:58 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=Aj8BWvC2mpRg9fdmeayUEWd3LP+g6Nq9hx6ymHN+RXEW562kcc2tzbPrq7bkHAVhGiuIRJuSxXo9
	5HimhgAcWafr7BD3+zlUz5RYwR2K5FcpHrBn+UTY+Jv+QTSRZLLe  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395846958843449.5228037434323;
	Wed, 26 Mar 2014 08:15:58 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Mar 2014 16:14:58 +0100
Message-Id: <acea83f0a120745f2eb4c857b593d46976d53af9.1395846628.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395846628.git.diego.ml@zoho.com>
References: <cover.1395846628.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395846628.git.diego.ml@zoho.com>
References: <cover.1395846628.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCH 3/3] python-autobahn: upgrade to version 0.8.6
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
X-List-Received-Date: Wed, 26 Mar 2014 15:15:58 -0000

---
 ...autobahn_0.5.14.bb => python-autobahn_0.8.6.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-autobahn_0.5.14.bb => python-autobahn_0.8.6.bb} (87%)

diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
similarity index 87%
rename from meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
rename to meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
index 0208c8b..a1e8c5f 100644
--- a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
+++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "http://autobahn.ws/python"
 SECTION = "console/network"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=81964ceb3ab93bfb5e8cfbcd26f3af9c"
+LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=1fdeccf6e5b70cda64cc1345597c18e3"
 
 SRC_URI = "https://pypi.python.org/packages/source/a/autobahn/autobahn-${PV}.zip"
-SRC_URI[md5sum] = "e2c80ba3e46428b32837537609d4d582"
+SRC_URI[md5sum] = "160429e7fb043940e79aa7f4ebbab57a"
 
 S = "${WORKDIR}/autobahn-${PV}"
 
-- 
1.7.9.5



