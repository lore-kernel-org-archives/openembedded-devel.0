Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9E357550F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:20:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6A3KbuQ006077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2018 20:20:38 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 20:20:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jul 2018 11:20:28 +0800
Message-ID: <1531192828-46910-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
References: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] xrdb: upgrade 1.1.0 -> 1.1.1
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
X-List-Received-Date: Tue, 10 Jul 2018 03:20:36 -0000
Content-Type: text/plain

From: Upgrade Helper <upgrade.helper@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>

---
 meta-oe/recipes-graphics/xorg-app/{xrdb_1.1.0.bb => xrdb_1.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrdb_1.1.0.bb => xrdb_1.1.1.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
rename to meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb
index 85957e056..e50c082d8 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.1.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 
 DEPENDS += "libxmu"
 
-SRC_URI[md5sum] = "b54c7e3e53b4f332d41ed435433fbda0"
-SRC_URI[sha256sum] = "73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641698d7dc541ca565b"
+SRC_URI[md5sum] = "96f9423eab4d0641c70848d665737d2e"
+SRC_URI[sha256sum] = "2d23ade7cdbb487996bf77cbb32cbe9bdb34d004748a53de7a4a97660d2217b7"
-- 
2.13.0


