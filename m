Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.12709.1599135967115636102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 05:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45678 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDoJX-0007Jp-S4; Thu, 03 Sep 2020 15:26:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 3/3] xscreensaver: Add HOMEPAGE
Date: Thu,  3 Sep 2020 15:25:52 +0300
Message-Id: <20200903122552.14524-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903122552.14524-1-leon.anavi@konsulko.com>
References: <20200903122552.14524-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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

Set https://www.jwz.org/xscreensaver/ as HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
index 6cad97f15..9131c754d 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.44.bb
@@ -1,5 +1,5 @@
 SUMMARY = "X screen saver and locker"
-
+HOMEPAGE = "https://www.jwz.org/xscreensaver/"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://driver/xscreensaver.h;endline=10;md5=2b97002f72fbfc9329b4336e798f2463"
 
-- 
2.17.1

