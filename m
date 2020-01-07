Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8FA7FDB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:10:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81429022"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:10:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2633549E9338
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:01:15 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:10:14 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:10:21 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:19 -0800
Message-ID: <1578403399-45535-10-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2633549E9338.A0E47
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] rabbitmq-c: upgrade 0.9.0 -> 0.10.0
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
X-List-Received-Date: Tue, 07 Jan 2020 09:10:15 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.9.0.bb => rabbitmq-c_0.10.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.9.0.bb => rabbitmq-c_0.10.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
index 5096d6cd3..2ef6b187e 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.9.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.10.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git"
-# v0.9.0-master
-SRCREV = "7e693a23f7fb7120f85995d3c922814495be30db"
+# v0.10.0-master
+SRCREV = "ffe918a5fcef72038a88054dca3c56762b1953d4"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




