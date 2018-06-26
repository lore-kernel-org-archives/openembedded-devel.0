Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3262746FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:01:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q61E9j003203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:01:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:01:13 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:01:02 +0800
Message-ID: <1529992863-24711-19-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 19/20] python(3)-requests: upgrade 2.18.4 -> 2.19.1
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
X-List-Received-Date: Tue, 26 Jun 2018 06:01:13 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-requests.inc             | 6 +++---
 .../python/{python-requests_2.18.4.bb => python-requests_2.19.1.bb} | 0
 .../{python3-requests_2.18.4.bb => python3-requests_2.19.1.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.18.4.bb => python-requests_2.19.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.18.4.bb => python3-requests_2.19.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 5d6dca5d3..efc652d94 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=979d6a23b143e13ea0e5e3aa81248820"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bfbeafb85a2cee261510d65d5ec19156"
 
-SRC_URI[md5sum] = "081412b2ef79bdc48229891af13f4d82"
-SRC_URI[sha256sum] = "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
+SRC_URI[md5sum] = "6c1a31afec9d614e2e71a91ee6ca2878"
+SRC_URI[sha256sum] = "ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python-requests_2.19.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.18.4.bb
rename to meta-python/recipes-devtools/python/python-requests_2.19.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.19.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.19.1.bb
-- 
2.11.0


