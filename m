Return-Path: <ueba.takuma@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id D048578CA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:20:20 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 127a_4772_4b05b722_4dbc_4680_a763_64f071c628cc;
	Fri, 27 Jul 2018 18:20:16 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 1056AAC02BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:20:15 +0900 (JST)
Received: from ueba-FMVA09006.utsfd.cs.fujitsu.co.jp
	(ubi186.utsfd.cs.fujitsu.co.jp [10.24.19.186])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id DCF48340;
	Fri, 27 Jul 2018 18:20:14 +0900 (JST)
From: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 18:20:08 +0900
Message-Id: <20180727092008.3528-1-ueba.takuma@jp.fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-MML: disable
Subject: [meta-python][PATCH] python-mock: fix license from Apache-2.0 to BSD-2-Clause
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
X-List-Received-Date: Fri, 27 Jul 2018 09:20:21 -0000

This packages license shold be not Apache-2.0 but BSD-2-Clause.
I judgetd by LICENSE file and SPDX file.

Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-mock_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
index 840c36efe..210502ff5 100644
--- a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A Python Mocking and Patching Library for Testing"
-LICENSE = "Apache-2.0"
+LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
 SRC_URI[md5sum] = "0febfafd14330c9dcaa40de2d82d40ad"
-- 
2.17.1



