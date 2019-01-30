Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C46586B06D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:38:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0U2c77i021016
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 18:38:07 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 29 Jan 2019 18:38:06 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Jan 2019 21:38:04 -0500
Message-ID: <20190130023804.2337-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] irssi: Upgrade from 1.0.4 to 1.1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 02:38:06 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../irssi/{irssi_1.0.4.bb => irssi_1.1.2.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.0.4.bb => irssi_1.1.2.bb} (77%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb
similarity index 77%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb
index 10b04bb52..e2867e84b 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.0.4.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "46d4ac2a7ab472e5dc800e5d7bd9a879"
-SRC_URI[sha256sum] = "b85c07dbafe178213eccdc69f5f8f0ac024dea01c67244668f91ec1c06b986ca"
+SRC_URI[md5sum] = "271d2fd875cddd34526234d8a766d82c"
+SRC_URI[sha256sum] = "5ccc2b89a394e91bea0aa83a951c3b1d471c76da87b4169ec435530a31bf9732"
 
 inherit autotools pkgconfig
 
-- 
2.17.0


