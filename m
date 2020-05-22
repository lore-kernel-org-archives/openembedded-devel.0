Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9324.1590136425319972833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 01:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53908 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc37d-0000wd-97; Fri, 22 May 2020 11:33:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-setuptools-scm: Upgrade 3.3.3 -> 3.5.0
Date: Fri, 22 May 2020 11:33:28 +0300
Message-Id: <20200522083330.6934-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.5.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etuptools-scm_3.3.3.bb => python3-setuptools-scm_3.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_3.3.3.bb => python3-setuptools-scm_3.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
index a1fc3831f..036477d1e 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
-SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
+SRC_URI[md5sum] = "86ec1eb9ec02ba018b097787e98897c5"
+SRC_URI[sha256sum] = "5bdf21a05792903cafe7ae0c9501182ab52497614fa6b1750d9dbae7b60c1a87"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.17.1

