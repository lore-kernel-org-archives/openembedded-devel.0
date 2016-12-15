Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AD35871C8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:32:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13941433"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 14:32:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F131B477B1C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:32:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 14:32:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Dec 2016 14:31:28 +0800
Message-ID: <1481783488-31329-3-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1481783488-31329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1481783488-31329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: F131B477B1C3.A8305
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH 2/2] libldb 1.1.27 -> 1.1.29
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
X-List-Received-Date: Thu, 15 Dec 2016 06:32:53 -0000
Content-Type: text/plain

Upgrade libldb from 1.1.27 to 1.1.29

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/libldb/{libldb_1.1.27.bb => libldb_1.1.29.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.27.bb => libldb_1.1.29.bb} (94%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
similarity index 94%
rename from meta-networking/recipes-support/libldb/libldb_1.1.27.bb
rename to meta-networking/recipes-support/libldb/libldb_1.1.29.bb
index f4370ef..378bb89 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.27.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
@@ -29,8 +29,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "50a194dea128d062cf4b44c59130219b"
-SRC_URI[sha256sum] = "cdb8269cba09006ddf3766eb7721192b52ae3fdc8a6b95f4318b6b740b9d35ac"
+SRC_URI[md5sum] = "9c90abfb94c1e2a693399392cf4cddb9"
+SRC_URI[sha256sum] = "59d84f9a5b799f519ba7b2685bb46f5a26f1bbf05b7a144b2f5e017d01d80f97"
 
 inherit waf-samba
 
-- 
2.7.4




