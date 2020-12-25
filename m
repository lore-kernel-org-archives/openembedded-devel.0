Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5669.1608860308755362328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102919757"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:38:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 321254CE6016
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 09:38:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:38:26 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] uthash: upgrade 2.1.0 -> 2.2.0
Date: Fri, 25 Dec 2020 09:38:24 +0800
Message-ID: <1608860304-71424-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 321254CE6016.AF2C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../uthash/{uthash_2.1.0.bb => uthash_2.2.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/uthash/{uthash_2.1.0.bb => uthash_2.2.0.bb} (90%)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb b/meta-oe/recipes-support/uthash/uthash_2.2.0.bb
similarity index 90%
rename from meta-oe/recipes-support/uthash/uthash_2.1.0.bb
rename to meta-oe/recipes-support/uthash/uthash_2.2.0.bb
index 09cef44a8..4ec7bc2f5 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.1.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.2.0.bb
@@ -8,8 +8,8 @@ DESCRIPTION = " uthash-dev provides a hash table implementation using C preproce
 HOMEPAGE = "https://troydhanson.github.io/uthash/"
 SECTION = "base"
 LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a2513f7d2291df840527b76b2a8f9718"
-SRCREV = "8b214aefcb81df86a7e5e0d4fa20e59a6c18bc02"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6891c324eb59289db33bac74d4cbb0d4"
+SRCREV = "66e2668795d0aaf4977523f828e548470a680c33"
 
 SRC_URI = "\
     git://github.com/troydhanson/${BPN}.git \
-- 
2.25.1



