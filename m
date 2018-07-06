Return-Path: <ueba.takuma@jp.fujitsu.com>
X-Greylist: delayed 675 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Jul 2018 06:37:43 UTC
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id BCC4A7489E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 06:37:43 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 4f41_c5ec_5a7d41de_37eb_46f3_8759_28480036b112;
	Fri, 06 Jul 2018 15:26:28 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47EAAAC0081
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:26:27 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 1D064185;
	Fri,  6 Jul 2018 15:26:27 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2018 15:26:25 +0900
Message-Id: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Fri, 06 Jul 2018 06:37:44 -0000

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 5c379956f..660bf09a7 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
 HOMEPAGE = "https://github.com/pyca/pynacl"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
 
 PYPI_PACKAGE = "asn1crypto"
-- 
2.17.1



