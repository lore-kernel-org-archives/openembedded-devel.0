Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4680.1590064079355194007
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 05:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34608 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbkIl-0002Km-TI; Thu, 21 May 2020 15:27:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-gmqtt: Upgrade to 0.6.5
Date: Thu, 21 May 2020 15:27:50 +0300
Message-Id: <20200521122750.25059-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
index 8d4ac8830..379c7679c 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[md5sum] = "f763f12c5e6ba6f0fa0ec4a6dc8c3fd9"
-SRC_URI[sha256sum] = "3b3c12cb62bbc3ee0bd81da3d9fbd78c5414098aaf58236c3663edfeda5237e0"
+SRC_URI[md5sum] = "9388ec09b6536c4e68c5ac5c31de3dc9"
+SRC_URI[sha256sum] = "c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60"
 
 inherit pypi setuptools3
 
-- 
2.17.1

