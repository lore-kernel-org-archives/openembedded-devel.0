Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13075.1590154825138621287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 06:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33024 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc7uQ-0003Rj-Td; Fri, 22 May 2020 16:40:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pid: Upgrade 2.2.5 -> 3.0.3
Date: Fri, 22 May 2020 16:40:07 +0300
Message-Id: <20200522134007.10925-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522134007.10925-1-leon.anavi@konsulko.com>
References: <20200522134007.10925-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pid_2.2.5.bb => python3-pid_3.0.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pid_2.2.5.bb => python3-pid_3.0.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
rename to meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
index ef1947888..170c99b93 100644
--- a/meta-python/recipes-devtools/python/python3-pid_2.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/trbs/pid/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
 
-SRC_URI[md5sum] = "ad352ee1dc28b9746a15451c0c53e9d7"
-SRC_URI[sha256sum] = "96eb7dba326b88f5164bc1afdc986c7793e0d32d7f62366256a3903c7b0614ef"
+SRC_URI[md5sum] = "5c011ebebbdfd529f6e85d2e0396dae8"
+SRC_URI[sha256sum] = "925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

