Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.35236.1591013081898601694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 05:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39878 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jfjBI-00086p-5c; Mon, 01 Jun 2020 15:04:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-python-vlc: Upgrade 3.0.7110 -> 3.0.9113
Date: Mon,  1 Jun 2020 15:04:19 +0300
Message-Id: <20200601120419.13396-4-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.9113.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-python-vlc_3.0.7110.bb => python3-python-vlc_3.0.9113.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.7110.bb => python3-python-vlc_3.0.9113.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
index be63fed02..6d53e3381 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[md5sum] = "e128abf7115d6513582bd460c0e74485"
-SRC_URI[sha256sum] = "821bca0dbe08fbff97a65e56ff2318ad7d499330876579c39f01f3fb38c7b679"
+SRC_URI[md5sum] = "a3a7d64bb4c6c1cd5569173ceef9cb67"
+SRC_URI[sha256sum] = "5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda"
 
 inherit pypi setuptools3
-- 
2.17.1

