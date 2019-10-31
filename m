Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 055087F95E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 06:29:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77727379"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 14:29:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 14BDA4CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 14:21:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 14:29:37 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 14:29:47 +0800
Message-ID: <20191031062947.17265-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 14BDA4CE1511.ABB5E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-intervals: upgrade 1.5.4 -> 1.10.0
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
X-List-Received-Date: Thu, 31 Oct 2019 06:29:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-intervals.inc      | 4 ++--
 .../{python-intervals_1.5.4.bb => python-intervals_1.10.0.bb} | 0
 ...python3-intervals_1.5.4.bb => python3-intervals_1.10.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-intervals_1.5.4.bb => python-intervals_1.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-intervals_1.5.4.bb => python3-intervals_1.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
index a915e09f9..4489aa59d 100644
--- a/meta-python/recipes-devtools/python/python-intervals.inc
+++ b/meta-python/recipes-devtools/python/python-intervals.inc
@@ -9,7 +9,7 @@ PYPI_PACKAGE := "python-intervals"
 
 inherit pypi
 
-SRC_URI[md5sum] = "a35dd44269fdb134bf19cfd80cb2c120"
-SRC_URI[sha256sum] = "a8a15b7c2fadb8465310f44aa96e384828b35a29de38ac74738cd665924cb8ac"
+SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
+SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-intervals_1.5.4.bb b/meta-python/recipes-devtools/python/python-intervals_1.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-intervals_1.5.4.bb
rename to meta-python/recipes-devtools/python/python-intervals_1.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
-- 
2.20.1




