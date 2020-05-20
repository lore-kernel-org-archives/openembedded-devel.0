Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13550.1589984118789587060
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 07:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47208 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbPV7-0004ak-Pv; Wed, 20 May 2020 17:15:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-appdirs: Upgrade to 1.4.4
Date: Wed, 20 May 2020 17:15:02 +0300
Message-Id: <20200520141502.28254-4-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.4.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-appdirs_1.4.3.bb => python3-appdirs_1.4.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index 2e183d888..eef5c0273 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -6,8 +6,8 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
-SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
-SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
+SRC_URI[md5sum] = "d6bca12613174185dd9abc8a29f4f012"
+SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

