Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13402.1590676581811397210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 07:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57850 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jeJdp-0003xq-RW; Thu, 28 May 2020 17:36:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-colorama: Upgrade 0.4.1 -> 0.4.3
Date: Thu, 28 May 2020 17:36:09 +0300
Message-Id: <20200528143610.30650-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.4.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.1.bb => python3-colorama_0.4.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
index 9cfca094e..7a3f533f2 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
-SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
+SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
+SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
 
-- 
2.17.1

