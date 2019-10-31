Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 671587F922
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:16:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,250,1569254400"; d="scan'208";a="77737889"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2019 17:16:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 463B54B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:08:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 31 Oct 2019 17:16:18 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 01:10:44 +0800
Message-ID: <1572541844-52967-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 463B54B6EC6E.A7D18
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] paho-mqtt-c: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Thu, 31 Oct 2019 09:16:21 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../paho-mqtt-c/{paho-mqtt-c_1.3.0.bb => paho-mqtt-c_1.3.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.0.bb => paho-mqtt-c_1.3.1.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb
index f308631..fa24967 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "9f715d0862a8e16099b5837c4e53a1bf6a6a0675"
+SRCREV = "d34c51214f4172f2e12bb17532c9f44f72a57dd4"
 
 DEPENDS = "openssl"
 
-- 
2.7.4




