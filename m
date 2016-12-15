Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C919F73281
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:43:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13939644"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 13:43:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AB704477B1C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:43:23 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 13:43:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Dec 2016 05:43:23 -0800
Message-ID: <1481809403-5742-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: AB704477B1C3.A6503
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] libtevent: 0.9.29 -> 0.9.31
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
X-List-Received-Date: Thu, 15 Dec 2016 05:43:32 -0000
Content-Type: text/plain

Upgrade libtevent from 0.9.29 to 0.9.31.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libtevent/{libtevent_0.9.29.bb => libtevent_0.9.31.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.9.29.bb => libtevent_0.9.31.bb} (91%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
similarity index 91%
rename from meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
index 9f4e235..975f8f6 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.9.29.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.9.31.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
-SRC_URI[md5sum] = "4372c1430a1ecb7ea0adddfdf21c0d55"
-SRC_URI[sha256sum] = "a4f519b0bbb718fe2175bee9011ee4d199675f28c2ef80531be38e7bbaa1c42b"
+SRC_URI[md5sum] = "5453847664ae6bc4ec0153e59ac635b9"
+SRC_URI[sha256sum] = "4a13f2256ad804c860e84068258bd0f8be31cf0c79aa8f3019fa32f6928c2bfc"
 
 inherit waf-samba
 
-- 
2.7.4




