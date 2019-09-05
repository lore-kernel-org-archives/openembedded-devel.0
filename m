Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2396A6C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:40:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74876435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 14:40:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C67114CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:40:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 14:41:00 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 15:40:35 +0900
Message-ID: <20190905064035.40933-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: C67114CE14E4.A1050
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] uhubctl: upgrade 2.0.0 -> 2.1.0
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
X-List-Received-Date: Thu, 05 Sep 2019 06:40:58 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../uhubctl/{uhubctl_2.0.0.bb => uhubctl_2.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.0.0.bb => uhubctl_2.1.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb
index 62028a96e..b294d77ba 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "6e05aee30e348ae2fd13ce8bfaa10f4f7d45d66f"
+SRCREV = "c9fa3c68a1b2c9790c731602b8bae2b513e80605"
 SRC_URI = "git://github.com/mvp/${BPN}"
 S = "${WORKDIR}/git"
 
-- 
2.17.1




