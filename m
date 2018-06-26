Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA1865CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:57:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5vvgv002736
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:57:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:57:56 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:44 +0800
Message-ID: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 01/20] python(3)-hyperlink: upgrade 17.3.1 -> 18.0.0
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
X-List-Received-Date: Tue, 26 Jun 2018 05:57:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-hyperlink.inc              | 4 ++--
 .../python/{python-hyperlink_17.3.1.bb => python-hyperlink_18.0.0.bb} | 0
 .../{python3-hyperlink_17.3.1.bb => python3-hyperlink_18.0.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-hyperlink_17.3.1.bb => python-hyperlink_18.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_17.3.1.bb => python3-hyperlink_18.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
index 2b5b0a0ff..78e3ee830 100644
--- a/meta-python/recipes-devtools/python/python-hyperlink.inc
+++ b/meta-python/recipes-devtools/python/python-hyperlink.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/python-hyper/hyperlink"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
 
-SRC_URI[md5sum] = "eaccb9845b559817e838846669cbc68a"
-SRC_URI[sha256sum] = "bc4ffdbde9bdad204d507bd8f554f16bba82dd356f6130cb16f41422909c33bc"
+SRC_URI[sha256sum] = "f01b4ff744f14bc5d0a22a6b9f1525ab7d6312cb0ff967f59414bbac52f0a306"
+SRC_URI[md5sum] = "f41a96779b324d824864696a94b24823"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python-hyperlink_18.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
rename to meta-python/recipes-devtools/python/python-hyperlink_18.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_18.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_18.0.0.bb
-- 
2.11.0


