Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.13345.1604063329982272280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 06:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59628 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kYU98-0005mn-Mi; Fri, 30 Oct 2020 15:08:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-regex: Upgrade 2020.10.23 -> 2020.10.28
Date: Fri, 30 Oct 2020 15:08:38 +0200
Message-Id: <20201030130840.9169-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.10.28:

- Added Apache 2.0 licence file to the files in the git repository

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-regex_2020.10.23.bb => python3-regex_2020.10.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.23.bb => python3-regex_2020.10.28.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
index c8cbdd11f2..c3cddd8f15 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.23.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "13fb62a1b276623e38931f7217f080d8"
-SRC_URI[sha256sum] = "2278453c6a76280b38855a263198961938108ea2333ee145c5168c36b8e2b376"
+SRC_URI[md5sum] = "8150da7f676e73751b4e3c7b1ba79a34"
+SRC_URI[sha256sum] = "dd3e6547ecf842a29cf25123fbf8d2461c53c8d37aa20d87ecee130c89b7079b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

