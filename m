Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7906C7FA20
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 07:15:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78053182"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 15:15:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 969B04B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 15:07:03 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:15:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 15:15:39 +0800
Message-ID: <20191108071539.26958-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 969B04B6EC6D.AB738
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyroute2: upgrade 0.5.2 -> 0.5.7
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
X-List-Received-Date: Fri, 08 Nov 2019 07:15:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyroute2.inc       | 4 ++--
 .../{python-pyroute2_0.5.2.bb => python-pyroute2_0.5.7.bb}    | 0
 .../{python3-pyroute2_0.5.2.bb => python3-pyroute2_0.5.7.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyroute2_0.5.2.bb => python-pyroute2_0.5.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.2.bb => python3-pyroute2_0.5.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index ed1981e49..7a14b9efb 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "2f6f951e94356ae9d224f417dc6ebed2"
-SRC_URI[sha256sum] = "42bf74495d95a0196a74dd171357f660175aba2bfc23f9b5f63e3830ccbef9ac"
+SRC_URI[md5sum] = "371683b62314211b8bc9807ac8ef1144"
+SRC_URI[sha256sum] = "963fce07da2841456d39e3b932b071f6de28d23dadfae014022d67a752916f98"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
 
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.5.2.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyroute2_0.5.2.bb
rename to meta-python/recipes-devtools/python/python-pyroute2_0.5.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.2.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.7.bb
-- 
2.20.1




