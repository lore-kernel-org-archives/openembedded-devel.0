Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13428.1589984116526368942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 07:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47208 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbPV5-0004ak-4u; Wed, 20 May 2020 17:15:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-aiofiles: Upgrade to 0.5.0
Date: Wed, 20 May 2020 17:15:01 +0300
Message-Id: <20200520141502.28254-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520141502.28254-1-leon.anavi@konsulko.com>
References: <20200520141502.28254-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiofiles_0.4.0.bb => python3-aiofiles_0.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.4.0.bb => python3-aiofiles_0.5.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
index b21cade52..0559c01e4 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "cb33cf96c371fbd56fc27ab0bd81bd61"
-SRC_URI[sha256sum] = "021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee"
+SRC_URI[md5sum] = "2243eff06072115e8afe8907677ca51d"
+SRC_URI[sha256sum] = "98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.17.1

