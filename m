Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7510.1591710207148216724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38336 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jieXE-0005lr-MA; Tue, 09 Jun 2020 16:43:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-beautifulsoup4: Upgrade 4.8.2 -> 4.9.1
Date: Tue,  9 Jun 2020 16:43:09 +0300
Message-Id: <20200609134311.13299-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.9.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eautifulsoup4_4.8.2.bb => python3-beautifulsoup4_4.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.8.2.bb => python3-beautifulsoup4_4.9.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
index 63fbd0958..910de12f8 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "5dbdb56c009e4632bae7bed1b385804b"
-SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a"
+SRC_URI[md5sum] = "57502b5b34ccfd97b180260071f5799a"
+SRC_URI[sha256sum] = "73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

