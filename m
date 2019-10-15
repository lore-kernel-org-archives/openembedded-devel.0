Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CA4147F356
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:01:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76987457"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 16:01:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3C3E64CE14FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:01:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 16:01:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 16:02:02 +0800
Message-ID: <20191015080202.20441-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3C3E64CE14FF.A917A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-xxhash: upgrade 1.4.1 -> 1.4.2
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
X-List-Received-Date: Tue, 15 Oct 2019 08:02:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-xxhash.inc         | 4 ++--
 .../{python3-xxhash_1.4.1.bb => python3-xxhash_1.4.2.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.1.bb => python3-xxhash_1.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xxhash.inc b/meta-python/recipes-devtools/python/python-xxhash.inc
index 6b4448220..93b2a15a7 100644
--- a/meta-python/recipes-devtools/python/python-xxhash.inc
+++ b/meta-python/recipes-devtools/python/python-xxhash.inc
@@ -3,5 +3,5 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
-SRC_URI[md5sum] = "2e6c0bd69a540e15ff2222d6cb8da466"
-SRC_URI[sha256sum] = "6b5af8c37ff12745ae77f28e695c0d3a3327932fd229824e49382377e940fdf1"
+SRC_URI[md5sum] = "80461eff10ac62214fa788a6045aab43"
+SRC_URI[sha256sum] = "82cdc67b41da904aa2921107e9877814079d9b067a99f19852b5d85e8a40555d"
diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.1.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.2.bb
-- 
2.20.1




