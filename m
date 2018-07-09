Return-Path: <ueba.takuma@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6822B60616
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 04:08:08 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 37a7_6a6d_b4ba8572_f633_463a_bca7_1a15aca97c02;
	Mon, 09 Jul 2018 13:08:06 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EE11AC005E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 13:08:05 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 76BE413C;
	Mon,  9 Jul 2018 13:08:05 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:08:03 +0900
Message-Id: <20180709040803.4239-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [meta-python][PATCH] python-asn1crypto: fix DESCRIPTION, HOMEPAGE and LICENSE.
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
X-List-Received-Date: Mon, 09 Jul 2018 04:08:08 -0000

Fix incorrect DESCRIPTION, HOMEPAGE, LICENSE.

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 5c379956f..43e468677 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -1,7 +1,7 @@
-DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
-HOMEPAGE = "https://github.com/pyca/pynacl"
+DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 structures"
+HOMEPAGE = "https://github.com/wbond/asn1crypto"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
 
 PYPI_PACKAGE = "asn1crypto"
-- 
2.17.1



