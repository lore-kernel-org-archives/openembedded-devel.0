Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8A1471C0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 03:32:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14825282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 11:32:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A5EAC47B0CB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 11:32:54 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 11:32:54 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 11:33:04 +0800
Message-ID: <1484623984-26415-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: A5EAC47B0CB1.A9CD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyparsing: 2.1.4 -> 2.1.10
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
X-List-Received-Date: Tue, 17 Jan 2017 03:32:57 -0000
Content-Type: text/plain

Upgrade python-pyparsing from 2.1.4 to 2.1.10.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-pyparsing_2.1.4.bb => python-pyparsing_2.1.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.1.4.bb => python-pyparsing_2.1.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
index 9aa5473..06f9845 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
 
-SRC_URI[md5sum] = "322059c57f0c9f11da1c6c06a2ba2197"
-SRC_URI[sha256sum] = "a9234dea79b50d49b92a994132cd1c84e873f3936db94977a66f0a4159b1797c"
+SRC_URI[md5sum] = "065908b92904e0d3634eb156f44cc80e"
+SRC_URI[sha256sum] = "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"
 
 inherit pypi setuptools
-- 
2.7.4




