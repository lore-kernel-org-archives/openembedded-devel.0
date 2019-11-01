Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 178E07FC0A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 07:13:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77785043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 15:13:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3EF4A4CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 15:05:46 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 15:13:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 15:13:47 +0800
Message-ID: <20191101071347.24675-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3EF4A4CE1508.A963D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyexpect: upgrade 1.0.17 -> 1.0.19
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
X-List-Received-Date: Fri, 01 Nov 2019 07:13:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyexpect.inc       | 4 ++--
 .../{python-pyexpect_1.0.17.bb => python-pyexpect_1.0.19.bb}  | 0
 ...{python3-pyexpect_1.0.17.bb => python3-pyexpect_1.0.19.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyexpect_1.0.17.bb => python-pyexpect_1.0.19.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.17.bb => python3-pyexpect_1.0.19.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyexpect.inc b/meta-python/recipes-devtools/python/python-pyexpect.inc
index d2d41d51d..85d9588a8 100644
--- a/meta-python/recipes-devtools/python/python-pyexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pyexpect.inc
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
 
 inherit pypi
 
-SRC_URI[md5sum] = "c71307d6c7096fdbde0813018dfa0092"
-SRC_URI[sha256sum] = "d656ef7e07a8aa539ce0a4883a683341037b6fc1c329bf55b63bffbf2cce9582"
+SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
+SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
diff --git a/meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb b/meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyexpect_1.0.17.bb
rename to meta-python/recipes-devtools/python/python-pyexpect_1.0.19.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.17.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
-- 
2.20.1




