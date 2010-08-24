Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Onoj5-0006Mi-TX
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 10:19:25 +0200
Received: from frbg-5f732626.pool.mediaways.net ([95.115.38.38])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1Onoig-0005lF-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 10:18:58 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 10:18:46 +0200
Message-Id: <1282637926-4394-2-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282637926-4394-1-git-send-email-betheg@bitcloner.org>
References: <1282637926-4394-1-git-send-email-betheg@bitcloner.org>
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] db_{4.3.29, 5.0.21}.bb: increase PR to force a rebuild.
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
X-List-Received-Date: Tue, 24 Aug 2010 08:19:25 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/db/db_4.3.29.bb |    2 +-
 recipes/db/db_5.0.21.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/db/db_4.3.29.bb b/recipes/db/db_4.3.29.bb
index 1e54203..08ca12d 100644
--- a/recipes/db/db_4.3.29.bb
+++ b/recipes/db/db_4.3.29.bb
@@ -1,4 +1,4 @@
-PR = "r11"
+PR = "r12"
 
 # major version number
 PVM = "4.3"
diff --git a/recipes/db/db_5.0.21.bb b/recipes/db/db_5.0.21.bb
index cfa0154..a25b558 100644
--- a/recipes/db/db_5.0.21.bb
+++ b/recipes/db/db_5.0.21.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 # major version number
 PVM = "5.0"
-- 
1.7.1



