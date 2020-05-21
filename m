Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3557.1590102831535766965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 16:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbuNo-0003wj-KD; Fri, 22 May 2020 02:13:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-parallax: Upgrade 1.0.5 -> 1.0.6
Date: Fri, 22 May 2020 02:13:24 +0300
Message-Id: <20200521231325.685-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521231325.685-1-leon.anavi@konsulko.com>
References: <20200521231325.685-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 60631d43a..40876d352 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/krig/parallax/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
 
-SRC_URI[md5sum] = "f8d04e9e246291536b705df7f60a55c9"
-SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410b3c4ba"
+SRC_URI[md5sum] = "e312397b083426af84db7076dc2a28d7"
+SRC_URI[sha256sum] = "c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b338d9081"
 
 inherit pypi setuptools3
 
-- 
2.17.1

