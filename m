Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5536E3EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 16:55:03 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2014 16:54:54 +0000
Message-Id: <1391619294-13051-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.5.3
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCH] libsoc: update to 0.6
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
X-List-Received-Date: Wed, 05 Feb 2014 16:55:04 -0000

From: Jack Mitchell <jack@embed.me.uk>

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta-oe/recipes-support/libsoc/{libsoc_0.5.bb => libsoc_0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.5.bb => libsoc_0.6.bb} (87%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.5.bb b/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
similarity index 87%
rename from meta-oe/recipes-support/libsoc/libsoc_0.5.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.6.bb
index c381799..ceb2b86 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.5.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
 
 inherit autotools
 
-SRCREV = "e5846ca199316603f0fec0748c57a781ced46950"
+SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
-- 
1.8.5.3


