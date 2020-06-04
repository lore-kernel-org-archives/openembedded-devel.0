Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12403.1591272768710342654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgojm-0002zK-AJ; Thu, 04 Jun 2020 15:12:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-requests-futures: Upgrade 0.9.5 -> 1.0.0
Date: Thu,  4 Jun 2020 15:12:21 +0300
Message-Id: <20200604121223.3818-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604121223.3818-1-leon.anavi@konsulko.com>
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...sts-futures_0.9.5.bb => python3-requests-futures_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-futures_0.9.5.bb => python3-requests-futures_1.0.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
rename to meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
index b94929d8c..2372ffa45 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_0.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ross/requests-futures"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
 
-SRC_URI[md5sum] = "e20dc6f063c70888a7f8225e349b6682"
-SRC_URI[sha256sum] = "33aa8a3b7892850701707d7e094b1e1ce7c4f7a36ff2a1dcc2da4e01a1a00f7e"
+SRC_URI[md5sum] = "601b5e90413bb00e06148752d31f0cc7"
+SRC_URI[sha256sum] = "35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148"
 
 inherit pypi setuptools3
 
-- 
2.17.1

