Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BBBFB7FC8A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 09:06:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,229,1571673600"; d="scan'208";a="78912375"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 17:06:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 573D24CE1BF0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:57:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 17:06:15 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2019 08:12:14 -0800
Message-ID: <1574439135-28586-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 573D24CE1BF0.A70F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v2] mcelog: upgrade 1.65 -> 1.66
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
X-List-Received-Date: Fri, 22 Nov 2019 09:06:16 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_165.bb => mcelog_166.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_165.bb => mcelog_166.bb} (95%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_165.bb b/meta-oe/recipes-support/mcelog/mcelog_166.bb
similarity index 95%
rename from meta-oe/recipes-support/mcelog/mcelog_165.bb
rename to meta-oe/recipes-support/mcelog/mcelog_166.bb
index 8af919f..3b4ea1f 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_165.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_166.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
     file://run-ptest \
 "
 
-SRCREV = "6b6a8a571b5b0967cadbee770bf444f4e8634cca"
+SRCREV = "ee90ff20ce6a4d5e016aa249ce8b37f359f9fda4"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
-- 
2.7.4




