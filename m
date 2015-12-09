Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Dec 2015 11:33:20 UTC
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 545686FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 11:33:20 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 2CB04DC8B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 11:20:41 +0000 (UTC)
Received: from localhost ([127.0.0.1]:33156 helo=owm.eumx.net)
	by owm.eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@embed.me.uk>) id 1a6cr4-0004Jd-7K
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2015 11:24:18 +0000
Received: from [109.224.219.180] (port=58426 helo=arch-omg.localdomain)
	by owm.eumx.net with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <ml@embed.me.uk>)
	id 1a6cr0-0004JD-R3; Wed, 09 Dec 2015 11:24:14 +0000
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2015 11:25:14 +0000
Message-Id: <1449660314-21826-1-git-send-email-ml@embed.me.uk>
X-Mailer: git-send-email 2.6.3
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCH] libsoc: update to 0.7.1
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
X-List-Received-Date: Wed, 09 Dec 2015 11:33:21 -0000

From: Jack Mitchell <jack@embed.me.uk>

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.1.bb} (90%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
similarity index 90%
rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
index 79c171a..911e0ba 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
 
 inherit autotools
 
-SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
+SRCREV = "2919c35e706fe7c311f83f9343865420fa4b37fe"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
-- 
2.6.3


