Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 0582E6F90B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:11:57 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=gHN/KjWOCqZkxxOgE5vnb0ICnIzBTDRVYzwcfzDiOHKXsOVSnhcnp4meaHfsIsITJPgM1IQyBlWj
	h8rvCKtuJeGwwo1pGnLNS8JNVZQn4Ti5L1Ha8YhpAgbx8CurqH7I  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395922318450435.5667391000827;
	Thu, 27 Mar 2014 05:11:58 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 13:10:41 +0100
Message-Id: <9d1513031e13b00debb7d9cf6a8cc8a08c13d06b.1395921944.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCHv3 3/3] python-autobahn: upgrade to version 0.8.6
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
X-List-Received-Date: Thu, 27 Mar 2014 12:11:58 -0000

Changes:
* upgraded python-autobahn to latest upstream
* updated license checksum because upstream increased copyright year from 2013 to 2014

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
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



