Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4826.1591701081628570623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 04:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jicA3-00081E-V7; Tue, 09 Jun 2020 14:11:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-urllib3: Upgrade 1.25.7 -> 1.25.9
Date: Tue,  9 Jun 2020 14:10:48 +0300
Message-Id: <20200609111050.32307-4-leon.anavi@konsulko.com>
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

Upgrade to release 1.25.9.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-urllib3_1.25.7.bb => python3-urllib3_1.25.9.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.7.bb => python3-urllib3_1.25.9.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
index 34c15b6c2..8cbc1f9f9 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "85e1e3925f8c1095172bff343f3312ed"
-SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745"
+SRC_URI[md5sum] = "dbf9b868b90880b24b1ac278094e912e"
+SRC_URI[sha256sum] = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
 
 inherit pypi setuptools3
 
-- 
2.17.1

