Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98830746FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:01:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q60vWh013745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:01:12 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:47 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:01:01 +0800
Message-ID: <1529992863-24711-18-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 18/20] python(3)-attrs: upgrade 17.4.0 -> 18.1.0
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
X-List-Received-Date: Tue, 26 Jun 2018 06:01:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc                  | 4 ++--
 .../python/{python-attrs_17.4.0.bb => python-attrs_18.1.0.bb}         | 0
 .../python/{python3-attrs_17.4.0.bb => python3-attrs_18.1.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attrs_17.4.0.bb => python-attrs_18.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-attrs_17.4.0.bb => python3-attrs_18.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index c29f058fa..fa73ea54d 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[md5sum] = "d7a89063b2e0fd36bd82389c4d82821d"
-SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83b54ec9"
+SRC_URI[sha256sum] = "e0d0eb91441a3b53dab4d9b743eafc1ac44476296a2053b6ca3af0b139faf87b"
+SRC_URI[md5sum] = "3f3f3e0750dab74cfa1dc8b0fd7a5f86"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.4.0.bb b/meta-python/recipes-devtools/python/python-attrs_18.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attrs_17.4.0.bb
rename to meta-python/recipes-devtools/python/python-attrs_18.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-attrs_17.4.0.bb b/meta-python/recipes-devtools/python/python3-attrs_18.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-attrs_17.4.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_18.1.0.bb
-- 
2.11.0


