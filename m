Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C55A65CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:59:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q5xE6G013707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:59:29 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:59:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:52 +0800
Message-ID: <1529992863-24711-9-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 09/20] python(3)-certifi: upgrade 2018.1.18 -> 2018.4.16
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
X-List-Received-Date: Tue, 26 Jun 2018 05:59:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2018.1.18.bb => python-certifi_2018.4.16.bb}      | 0
 .../{python3-certifi_2018.1.18.bb => python3-certifi_2018.4.16.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2018.1.18.bb => python-certifi_2018.4.16.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2018.1.18.bb => python3-certifi_2018.4.16.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 26df5c115..a930ff99f 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "068fd5c3c690ae47504b3e0bf4e56c4c"
-SRC_URI[sha256sum] = "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"
+SRC_URI[sha256sum] = "13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7"
+SRC_URI[md5sum] = "f5d81d0048e84285611412b0dea0630a"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2018.1.18.bb b/meta-python/recipes-devtools/python/python-certifi_2018.4.16.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2018.1.18.bb
rename to meta-python/recipes-devtools/python/python-certifi_2018.4.16.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2018.1.18.bb b/meta-python/recipes-devtools/python/python3-certifi_2018.4.16.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2018.1.18.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2018.4.16.bb
-- 
2.11.0


