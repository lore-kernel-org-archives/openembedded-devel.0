Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 144A56CCD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 18:29:07 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 19:29:00 +0100
Message-Id: <1381256940-772-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCH] libsoc: update to 0.4
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
X-List-Received-Date: Tue, 08 Oct 2013 18:29:07 -0000

From: Jack Mitchell <jack@embed.me.uk>

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta-oe/recipes-support/libsoc/{libsoc_0.3.bb => libsoc_0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.3.bb => libsoc_0.4.bb} (87%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb b/meta-oe/recipes-support/libsoc/libsoc_0.4.bb
similarity index 87%
rename from meta-oe/recipes-support/libsoc/libsoc_0.3.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.4.bb
index 1bf2782..da3c442 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
 
 inherit autotools
 
-SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
+SRCREV = "f6827b7b5c581b586d3bcc4813d418101ae1e85b"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
-- 
1.8.4


