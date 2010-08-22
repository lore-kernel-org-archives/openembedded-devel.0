Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OnDD8-00044T-92
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 18:15:54 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 6D07223EFA; Sun, 22 Aug 2010 20:15:30 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:15:27 +0400
Message-Id: <1282493728-2421-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] ethtool: add version 2.6.35
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
X-List-Received-Date: Sun, 22 Aug 2010 16:15:54 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/ethtool/ethtool_2.6.35.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ethtool/ethtool_2.6.35.bb

diff --git a/recipes/ethtool/ethtool_2.6.35.bb b/recipes/ethtool/ethtool_2.6.35.bb
new file mode 100644
index 0000000..b4473d5
--- /dev/null
+++ b/recipes/ethtool/ethtool_2.6.35.bb
@@ -0,0 +1,5 @@
+require ethtool.inc
+PR = "r0"
+
+SRC_URI[md5sum] = "e0f617779a58b77af061a9e5178d0b25"
+SRC_URI[sha256sum] = "be0a7b0fbe56fd455bcef24af7f047b02cefecfb422f4ebc3e4e924bce30e891"
\ No newline at end of file
-- 
1.6.4.2



