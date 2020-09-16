Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web12.19339.1600251195951270859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 03:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136, mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id 92BCA1E003;
	Wed, 16 Sep 2020 12:13:08 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wj9izUdjR4kt; Wed, 16 Sep 2020 12:12:54 +0200 (CEST)
Received: from ymir.suse.de (unknown [195.135.221.27])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 9E43C20009;
	Wed, 16 Sep 2020 12:12:54 +0200 (CEST)
From: "Michael Vetter" <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [PATCH 1/1] jasper: use correct homepage
Date: Wed, 16 Sep 2020 12:12:57 +0200
Message-Id: <20200916101258.26430-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.16.4

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
index 356c78c0d..c2e376df0 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.20.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Jpeg 2000 implementation"
-HOMEPAGE = "https://github.com/jasper-software/jasper"
+HOMEPAGE = "https://jasper-software.github.io/jasper/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-- 
2.16.4

