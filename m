Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 766C37FC16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:30:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79196036"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 10:30:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6FE9F4CE1C09
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:21:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 10:30:08 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Nov 2019 01:14:30 -0800
Message-ID: <1574932470-14682-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6FE9F4CE1C09.A98EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] python-cmd2: upgrade 0.9.19 -> 0.9.20
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
X-List-Received-Date: Thu, 28 Nov 2019 02:30:09 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cmd2.inc                   | 4 ++--
 .../python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.20.bb}           | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.20.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
index 3a6bf54..1a4249d 100644
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ b/meta-python/recipes-devtools/python/python-cmd2.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
 
-SRC_URI[md5sum] = "20f3f76b2aaf36a17372717b469ca969"
-SRC_URI[sha256sum] = "c81284083d993af18b8fef57d89d854d49d051d4c2c8a8e12d0281e369ac3682"
+SRC_URI[md5sum] = "38e573f0b1d868f21068b726c285e52b"
+SRC_URI[sha256sum] = "1ba349af127f9052363972adcbcfb921f9ca5e90f2bcbfba11b117500f11a845"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
-- 
2.7.4




