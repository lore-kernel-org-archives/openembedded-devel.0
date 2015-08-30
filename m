Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D5B8E765DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:00:08 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so101659417pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2015 20:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+9+Nqeuld5jCFef0G/aCJ8xsoliJ571eUbvIQ1A/t+c=;
	b=SETh4CZDMPWTbru/pBylkv7pVcmsgV5scRSJUIwpLObrm9JK/52NbKF+BiTISmXxDm
	dUD885R/6ccbb1M5nxb4oX+8DcBKceS7/tpUTU5iExZCzVQnzffG9bW97VDYb1cfioYs
	1Ko4CtUBIaxpbEppfumx8L93aDqR9dKKNC8ojafkhVRJuBkUNoIrkesKXRu+5oXRW9o8
	uphsAahNKukAraEzZL4XMpmCFkAlCgrgyIsj6RciKKOl9eLJrOQYvyHb71AMhp16hjCR
	TixYeY7AXhbAK5AD3h0cahYl6xkR3bUJsiBAf0/7kyaIo+mANcwA7O3oUSN89jeviH8P
	1JqQ==
X-Received: by 10.66.252.72 with SMTP id zq8mr26854324pac.7.1440903608370;
	Sat, 29 Aug 2015 20:00:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id j1sm9996535pde.48.2015.08.29.20.00.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Aug 2015 20:00:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 13:00:29 +1000
Message-Id: <1440903629-22032-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target: add qttranslations-qtwebsockets
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Aug 2015 03:00:09 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 8e8f98e..41c467c 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -101,6 +101,7 @@ RDEPENDS_${PN} += " \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
     qtwebsockets-qmlplugins \
+    qttranslations-qtwebsockets \
     qtwebchannel-dev \
     qtwebchannel-mkspecs \
     qtwebchannel-qmlplugins \
-- 
2.5.0


