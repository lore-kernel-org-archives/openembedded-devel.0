Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web12.52973.1600725242411591428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 14:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id AAD3924005;
	Mon, 21 Sep 2020 23:53:58 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eiqs5AJyOdmA; Mon, 21 Sep 2020 23:53:44 +0200 (CEST)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id CB8F024006;
	Mon, 21 Sep 2020 23:53:44 +0200 (CEST)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.20 -> 2.0.21
Date: Mon, 21 Sep 2020 23:53:45 +0200
Message-Id: <20200921215345.1434-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921215345.1434-1-jubalh@iodoru.org>
References: <20200921215345.1434-1-jubalh@iodoru.org>

---
 meta-oe/recipes-graphics/jasper/{jasper_2.0.20.bb => jasper_2.0.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.20.bb => jasper_2.0.21.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
rename to meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb
index c2e376df0..be87d07c0 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.21.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https"
-SRCREV = "d10a710f31da3d079a984d35ff6cc82a853d25d7"
+SRCREV = "2c3ab8c542a66eb5def030d30602fa455d1adbd9"
 
 S = "${WORKDIR}/git"
 
-- 
2.16.4

