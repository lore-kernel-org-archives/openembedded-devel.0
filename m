Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7552.1591710211955822205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38336 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jieXK-0005lr-If; Tue, 09 Jun 2020 16:43:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 1.9.4 -> 2.0.1
Date: Tue,  9 Jun 2020 16:43:11 +0300
Message-Id: <20200609134311.13299-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609134311.13299-1-leon.anavi@konsulko.com>
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
index df69e007f..aa087c920 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
 
-SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
-SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
+SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
+SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
 
 inherit pypi setuptools3
 
-- 
2.17.1

