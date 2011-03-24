Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mCB-0007Ly-M5
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:52 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAN-0002QJ-OH by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:41 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAM-0008KU-PQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:38 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:38 +0100
Message-Id: <7858ebb73c49cb77148a6d16302b24c2b2ac877b.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300979039.git.stefan@buglabs.net>
References: <cover.1300979039.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 2/7] cacao-hg: update to latest revision
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
X-List-Received-Date: Thu, 24 Mar 2011 15:11:56 -0000

From: Henning Heinold <h.heinold@tarent.de>

Signed-off-by: Henning Heinold <h.heinold@tarent.de>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/cacao/cacao-native_hg.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cacao/cacao-native_hg.bb b/recipes/cacao/cacao-native_hg.bb
index 0f0df64..6ece8dd 100644
--- a/recipes/cacao/cacao-native_hg.bb
+++ b/recipes/cacao/cacao-native_hg.bb
@@ -3,7 +3,7 @@ require cacao-native.inc
 PV = "1.1.0+hgr${SRCPV}"
 PR = "r2"
 
-SRCREV = "1ac977fe271c"
+SRCREV = "c7bf150bfa46"
 SRC_URI = "hg://mips.complang.tuwien.ac.at/hg/;module=cacao;rev=${SRCREV}"
 
 S = "${WORKDIR}/cacao"
-- 
1.7.4.1



