Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 796E965CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:59:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5Q5wh2I013698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:58:58 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:58:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:49 +0800
Message-ID: <1529992863-24711-6-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 06/20] python-pip: upgrade 9.0.3 -> 10.0.1
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
X-List-Received-Date: Tue, 26 Jun 2018 05:59:07 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python/{python-pip_9.0.3.bb => python-pip_10.0.1.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_9.0.3.bb => python-pip_10.0.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.3.bb b/meta-python/recipes-devtools/python/python-pip_10.0.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pip_9.0.3.bb
rename to meta-python/recipes-devtools/python/python-pip_10.0.1.bb
index e3fc6ba65..5aaf818d0 100644
--- a/meta-python/recipes-devtools/python/python-pip_9.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pip_10.0.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
 HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3f8d33acaac5c5dac8c613904bd56a6f"
 
-SRC_URI[md5sum] = "b15b33f9aad61f88d0f8c866d16c55d8"
-SRC_URI[sha256sum] = "7bf48f9a693be1d58f49f7af7e0ae9fe29fd671cde8a55e6edca3581c4ef5796"
+SRC_URI[md5sum] = "83a177756e2c801d0b3a6f7b0d4f3f7e"
+SRC_URI[sha256sum] = "f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdbd7ee68"
 
 inherit pypi setuptools
 
-- 
2.11.0


