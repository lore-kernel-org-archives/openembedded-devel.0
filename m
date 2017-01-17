Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7362A71A74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 05:11:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14827899"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 13:11:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 516E247B0CAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 13:11:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 13:11:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 13:11:32 +0800
Message-ID: <1484629892-26594-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 516E247B0CAC.A5EA8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytz: 2016.7 -> 2016.10
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
X-List-Received-Date: Tue, 17 Jan 2017 05:11:50 -0000
Content-Type: text/plain

Upgrade python-pytz from 2016.7 to 2016.10.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-pytz_2016.7.bb => python-pytz_2016.10.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2016.7.bb => python-pytz_2016.10.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python-pytz_2016.10.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python-pytz_2016.7.bb
rename to meta-python/recipes-devtools/python/python-pytz_2016.10.bb
index 508fd3b..33cb140 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.10.bb
@@ -3,8 +3,8 @@ HOMEPAGE = " http://pythonhosted.org/pytz"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
 
-SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
-SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
+SRC_URI[md5sum] = "cc9f16ba436efabdcef3c4d32ae4919c"
+SRC_URI[sha256sum] = "9a43e20aa537cfad8fe7a1715165c91cb4a6935d40947f2d070e4c80f2dcd22b"
 
 inherit pypi setuptools
 
-- 
2.7.4




