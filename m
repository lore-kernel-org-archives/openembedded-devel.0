Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.130051.1598000870774367884
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98384381"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:07:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 40E1E48990CE
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 17:07:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:07:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.9.0 -> 3.9.1
Date: Sat, 22 Aug 2020 05:07:30 +0800
Message-ID: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 40E1E48990CE.A1406
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{nlohmann-json_3.9.0.bb => nlohmann-json_3.9.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.9.0.bb => nlohmann-json_3.9.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb
index 0f5ef7052..359324266 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.0.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.9.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=dd0607f896f392c8b7d0290a676efc24"
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1 \
            "
 
-SRCREV = "d34771cafc87b358ba421faca28facc7f8080174"
+SRCREV = "db78ac1d7716f56fc9f1b030b715f872f93964e4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



