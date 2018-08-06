Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF385753E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:24 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sPCE011197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:25 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:05 -0700
Message-Id: <20180806085408.44739-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 07/10] exo: 0.12.1 -> 0.12.2
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:25 -0000

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.1.bb => exo_0.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.1.bb => exo_0.12.2.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.1.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.1.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.2.bb
index 1210e256d..ea25cca3c 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.2.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "a7bb4e61c54f5168ee21902b0ed70533"
-SRC_URI[sha256sum] = "6b7e00d8cb24e0b3472c2514736d3aaf7c46d2a4eea0e07755d64f20d8666741"
+SRC_URI[md5sum] = "15b66320dd89e04fbd07a47f1c4b1cb1"
+SRC_URI[sha256sum] = "6d4b0a88c1e1d3d5ed612cbf012c7511ef67b1636f4f85caa9dc68649b7e6350"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.11.0


