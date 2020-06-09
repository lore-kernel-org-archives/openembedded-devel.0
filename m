Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4808.1591701075519440337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jic9y-00081E-8F; Tue, 09 Jun 2020 14:11:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-waitress: Upgrade 1.4.3 -> 1.4.4
Date: Tue,  9 Jun 2020 14:10:47 +0300
Message-Id: <20200609111050.32307-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609111050.32307-1-leon.anavi@konsulko.com>
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.4.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-waitress_1.4.3.bb => python3-waitress_1.4.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.3.bb => python3-waitress_1.4.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
index 8ac3e928e..3e207de4f 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "4bffad7009d3824ae61ea6c0696e45f6"
-SRC_URI[sha256sum] = "045b3efc3d97c93362173ab1dfc159b52cfa22b46c3334ffc805dbdbf0e4309e"
+SRC_URI[md5sum] = "079c3c4902b1cb5d0a917276ee70f1df"
+SRC_URI[sha256sum] = "1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261"
 
 inherit setuptools3 pypi
-- 
2.17.1

