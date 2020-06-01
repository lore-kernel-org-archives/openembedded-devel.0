Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.35455.1591013069796347626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 05:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39878 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfjB4-00086p-GT; Mon, 01 Jun 2020 15:04:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-unidiff: Upgrade 0.5.5 -> 0.6.0
Date: Mon,  1 Jun 2020 15:04:16 +0300
Message-Id: <20200601120419.13396-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_0.5.5.bb => python3-unidiff_0.6.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.5.5.bb => python3-unidiff_0.6.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
index ded66f06f..75aa1bf79 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[md5sum] = "47f669d7273541fec45e4cc0fba8d8e9"
-SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc"
+SRC_URI[md5sum] = "ae9524079753df7b1239f0378ed326b7"
+SRC_URI[sha256sum] = "90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

