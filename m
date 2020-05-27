Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4890.1590582165631003209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 05:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47738 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jdv51-0007ch-NH; Wed, 27 May 2020 15:22:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-dbussy: Upgrade 1.2.1 -> 1.3
Date: Wed, 27 May 2020 15:22:29 +0300
Message-Id: <20200527122229.24023-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122229.24023-1-leon.anavi@konsulko.com>
References: <20200527122229.24023-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-dbussy_1.2.1.bb => python3-dbussy_1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbussy_1.2.1.bb => python3-dbussy_1.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index ac4b8c2aa..08f5e940f 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "git://github.com/ldo/dbussy.git"
 
-SRCREV = "d0ec0223f3797e1612d835e71694a1083881149f"
+SRCREV = "37ede4242b48def73ada46c2747a4c5cae6abf45"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

