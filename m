Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF0A7FA47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:01:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82106517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 15:01:53 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 272B34CE26C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 14:52:42 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 15:01:50 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 15:01:49 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 15:03:19 +0800
Message-ID: <20200117070319.21661-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 272B34CE26C8.A7316
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-wheel: upgrade 0.32.3 -> 0.33.6
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
X-List-Received-Date: Fri, 17 Jan 2020 07:01:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-wheel_0.32.3.bb => python3-wheel_0.33.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.32.3.bb => python3-wheel_0.33.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.32.3.bb b/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-wheel_0.32.3.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
index e8c08a7dd..025b2eea9 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.32.3.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.33.6.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752"
 
 SRC_URI = "git://github.com/pypa/wheel.git"
-SRCREV ?= "11584b78a56b4eedba4eedc55c9dac8aa2dd7070"
+SRCREV ?= "b227ddd5beaba49294017d061d501f6d433393b0"
 
 
 inherit setuptools3
-- 
2.20.1




