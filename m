Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.23356.1585170277493606268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 14:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02PL4bfI005576
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 14:04:37 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 14:04:36 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-werkzeug: upgrade 0.16.0 -> 1.0.0
Date: Wed, 25 Mar 2020 17:04:36 -0400
Message-ID: <20200325210436.8218-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc       | 4 ++--
 .../{python3-werkzeug_0.16.0.bb => python3-werkzeug_1.0.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.16.0.bb => python3-werkzeug_1.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e292d93bb..e4d3d38d7 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[md5sum] = "5b23b4953efc4f52b1d0b33af6f7cd2d"
-SRC_URI[sha256sum] = "7280924747b5733b246fe23972186c6b348f9ae29724135a6dfc1e53cea433e7"
+SRC_URI[md5sum] = "305f75c4a88c96dcdc5654bf2d01bc05"
+SRC_URI[sha256sum] = "169ba8a33788476292d04186ab33b01d6add475033dfc07215e6d219cc077096"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.16.0.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_1.0.0.bb
-- 
2.24.1

