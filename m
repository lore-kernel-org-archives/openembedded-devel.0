Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 89FFB6FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:15:47 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=oK6xWOBj8YApfFYDP3gzeP3D0vgsTlCYWPt8OM2e3VseOrCXEDo1Zov65w+5O27ld3MRYqQuisNI
	YexfUWCeVdCu1yHxi/YkFjb6DXcqjH1CKVd49B/zH7QxOVDaESNy  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395846948400891.0112836815456;
	Wed, 26 Mar 2014 08:15:48 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Mar 2014 16:14:56 +0100
Message-Id: <156960c12dbc26909b9d200cd312e71cd53dbd99.1395846628.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395846628.git.diego.ml@zoho.com>
References: <cover.1395846628.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395846628.git.diego.ml@zoho.com>
References: <cover.1395846628.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCH 1/3] python-zopeinterface: upgrade to version 4.1.1
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
X-List-Received-Date: Wed, 26 Mar 2014 15:15:48 -0000

---
 ...face_3.5.1.bb => python-zopeinterface_4.1.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-zopeinterface_3.5.1.bb => python-zopeinterface_4.1.1.bb} (84%)

diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
similarity index 84%
rename from meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
rename to meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
index d73a5be..4982ed7 100644
--- a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
+++ b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PR = "r1"
 
 SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
-SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
-SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
+SRC_URI[md5sum] = "edcd5f719c5eb2e18894c4d06e29b6c6"
+SRC_URI[sha256sum] = "91cba7b7cd7cb82f6f4e023fe77f94dc3df4ae5287fd55def2148dc232d0c7da"
 
 S = "${WORKDIR}/zope.interface-${PV}"
 
-- 
1.7.9.5



