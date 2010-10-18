Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uok-0004Xx-Vv
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:21 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id CF9FC275CE9E; Mon, 18 Oct 2010 20:51:47 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id E5128275CE2F;
	Mon, 18 Oct 2010 20:51:45 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:20 +0200
Message-Id: <1287427884-1517-12-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/15] linux-palmpre: bump git SRCREV for devtmpfs support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Oct 2010 18:52:21 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/linux/linux-palmpre_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-palmpre_git.bb b/recipes/linux/linux-palmpre_git.bb
index 47d71de..208b7bd 100644
--- a/recipes/linux/linux-palmpre_git.bb
+++ b/recipes/linux/linux-palmpre_git.bb
@@ -11,7 +11,7 @@ file://defconfig \
 
 S = "${WORKDIR}/git/"
 
-SRCREV = "96eba42952e860f652e66a72569319dfd35756dc"
+SRCREV = "33239e4074f4716a674b450a443b64add201bf39"
 KV = "2.6.24"
 PR="r2"
 PV = "${KV}+gitr${SRCPV}"
-- 
1.7.1



