Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13074.1590154819981088463
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 06:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33024 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jc7uK-0003Rj-OX; Fri, 22 May 2020 16:40:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-webcolors: Upgrade 1.8.1 -> 1.11.1
Date: Fri, 22 May 2020 16:40:06 +0300
Message-Id: <20200522134007.10925-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522134007.10925-1-leon.anavi@konsulko.com>
References: <20200522134007.10925-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.11.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-webcolors_1.8.1.bb => python3-webcolors_1.11.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-webcolors_1.8.1.bb => python3-webcolors_1.11.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index 65eed9e78..e567e0ba2 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=25b90379a52351261c51272e7923d240"
 
-SRC_URI[md5sum] = "40890db38b2a856e526a568864025fe6"
-SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59"
+SRC_URI[md5sum] = "54d28a7c80b3e4d974ec2fee86768be9"
+SRC_URI[sha256sum] = "76f360636957d1c976db7466bc71dcb713bb95ac8911944dffc55c01cb516de6"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

