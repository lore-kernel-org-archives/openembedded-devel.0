Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 526917FC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 03:10:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77774867"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 11:10:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2FE6B4CE1515
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 11:02:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 11:10:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:10:30 +0800
Message-ID: <20191101031030.19075-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2FE6B4CE1515.A84F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-parse: upgrade 1.8.4 -> 1.12.1
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
X-List-Received-Date: Fri, 01 Nov 2019 03:10:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-parse.inc        | 6 +++---
 .../{python-parse_1.8.4.bb => python-parse_1.12.1.bb}       | 0
 .../{python3-parse_1.8.4.bb => python3-parse_1.12.1.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-parse_1.8.4.bb => python-parse_1.12.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-parse_1.8.4.bb => python3-parse_1.12.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
index fa55a93c5..ccd5a9377 100644
--- a/meta-python/recipes-devtools/python/python-parse.inc
+++ b/meta-python/recipes-devtools/python/python-parse.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Parse strings using a specification based on the Python format() syntax"
 HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1317;endline=1337;md5=fa03bae3f51a2db25e239e869c647437"
 
-SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
-SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
+SRC_URI[md5sum] = "8fc634769f1d841f14a52dd731ca447a"
+SRC_URI[sha256sum] = "a5fca7000c6588d77bc65c28f3f21bfce03b5e44daa8f9f07c17fe364990d717"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python-parse_1.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-parse_1.8.4.bb
rename to meta-python/recipes-devtools/python/python-parse_1.12.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python3-parse_1.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.12.1.bb
-- 
2.20.1




