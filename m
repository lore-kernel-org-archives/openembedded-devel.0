Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIgPA-0000Ba-Sy
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 12:05:37 +0200
Received: (qmail 27934 invoked by uid 813007); 22 Jun 2009 09:54:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 09:54:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 11:53:53 +0200
Message-Id: <1245664435-30183-10-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 033/125] m4: 1.4.11 and 1.4.12 are GPLv3
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
X-List-Received-Date: Mon, 22 Jun 2009 10:05:37 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/m4/m4_1.4.11.bb |    2 +-
 recipes/m4/m4_1.4.12.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/m4/m4_1.4.11.bb b/recipes/m4/m4_1.4.11.bb
index 77d8e82..e267626 100644
--- a/recipes/m4/m4_1.4.11.bb
+++ b/recipes/m4/m4_1.4.11.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro \
 processor."
-LICENSE = "GPL"
+LICENSE = "GPLv3"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
 S = "${WORKDIR}/m4-${PV}"
 
diff --git a/recipes/m4/m4_1.4.12.bb b/recipes/m4/m4_1.4.12.bb
index 77d8e82..e267626 100644
--- a/recipes/m4/m4_1.4.12.bb
+++ b/recipes/m4/m4_1.4.12.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro \
 processor."
-LICENSE = "GPL"
+LICENSE = "GPLv3"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
 S = "${WORKDIR}/m4-${PV}"
 
-- 
1.6.3.1





