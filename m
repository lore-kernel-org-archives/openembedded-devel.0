Return-Path: <michael.haener@siemens.com>
X-Greylist: delayed 634 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Nov 2019 20:06:04 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 12F1D7F8D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 20:06:04 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xARJtUSM020981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 20:55:30 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.7.25])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id xARJtTxh014909;
	Wed, 27 Nov 2019 20:55:29 +0100
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1EA3923CE8B8;
	Wed, 27 Nov 2019 20:55:29 +0100 (CET)
From: Michael Haener <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 20:55:25 +0100
Message-Id: <20191127195525.2608-1-michael.haener@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] libmbim: upgrade 1.20.0 -> 1.20.2
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
X-List-Received-Date: Wed, 27 Nov 2019 20:06:05 -0000

Update to current version.
---
 .../libmbim/{libmbim_1.20.0.bb => libmbim_1.20.2.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.20.0.bb => libmbim_1.20.2.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.2.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.20.2.bb
index 17d784766..2c4a59f7f 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.2.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "b5506db07fb2a0b118e0d6e59b3d5b8f"
-SRC_URI[sha256sum] = "2cf7c6c7aa9e962a589f61bff2766035b61792ef961131a21fcbbe043f91a866"
+SRC_URI[md5sum] = "988a6a7fd4a2f4e08c098992180e5b02"
+SRC_URI[sha256sum] = "550fb69e5e57f7646f8eb9ed8d24e44ea869ad846be9c162893f12e43528059b"
-- 
2.11.0


