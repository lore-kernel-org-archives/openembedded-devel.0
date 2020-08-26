Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15202.1598456434236940686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXI-0002yf-Qm; Wed, 26 Aug 2020 18:40:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-diskcache: Upgrade 5.0.1 -> 5.0.2
Date: Wed, 26 Aug 2020 18:40:15 +0300
Message-Id: <20200826154020.29208-1-leon.anavi@konsulko.com>
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

Stay up to date and upgrade to latest release following the recent
"bump version to 5.0.2" commit in the GitHub upstream repo.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-diskcache_5.0.1.bb => python3-diskcache_5.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_5.0.1.bb => python3-diskcache_5.0.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
index 9f92fde22..7eda65fa0 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
 
-SRC_URI[md5sum] = "5c8c5789f584a36eacc7240921eee35c"
-SRC_URI[sha256sum] = "b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633"
+SRC_URI[md5sum] = "b8061d293045b29b83201cf9a62b1da2"
+SRC_URI[sha256sum] = "6e350e795e197f979316a3f524a729edb13d1739959c6e9cb5df78a0a72c8255"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.17.1

