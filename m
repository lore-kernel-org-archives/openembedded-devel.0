Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.35459.1591013075803914061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 05:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39878 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfjBC-00086p-An; Mon, 01 Jun 2020 15:04:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-tzlocal: Upgrade 2.0.0 -> 2.1
Date: Mon,  1 Jun 2020 15:04:17 +0300
Message-Id: <20200601120419.13396-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200601120419.13396-1-leon.anavi@konsulko.com>
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tzlocal_2.0.0.bb => python3-tzlocal_2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_2.0.0.bb => python3-tzlocal_2.1.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
index 3573b29f0..56a8fc06f 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"
-SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
+SRC_URI[md5sum] = "c0877603ff9de71cd8ca6ee2b50d2ebd"
+SRC_URI[sha256sum] = "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
 
 inherit pypi setuptools3
-- 
2.17.1

