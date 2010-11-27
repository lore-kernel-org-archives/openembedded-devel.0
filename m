Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMMrx-00026p-Py
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 16:39:23 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 04CAE1B421;
	Sat, 27 Nov 2010 16:39:23 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 16:38:05 +0100
Message-Id: <1290872285-19808-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] emelfm2_0.0.8: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 15:39:23 -0000

emelfm2 have a new homepage http://emelfm2.net/
---
 recipes/emelfm2/emelfm2_0.0.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/emelfm2/emelfm2_0.0.8.bb b/recipes/emelfm2/emelfm2_0.0.8.bb
index 855fcbb..4051036 100644
--- a/recipes/emelfm2/emelfm2_0.0.8.bb
+++ b/recipes/emelfm2/emelfm2_0.0.8.bb
@@ -4,8 +4,8 @@
 
 DESCRIPTION="emelFM2 is a GTK2+ file manager that implements the popular \
 	two-pane design."
-HOMEPAGE="http://dasui.prima.de/e2wiki/"
-SRC_URI="http://dasui.prima.de/~tooar/emelfm2-${PV}.tar.gz \
+HOMEPAGE="http://emelfm2.net/"
+SRC_URI="http://emelfm2.net/rel/emelfm2-${PV}.tar.gz \
 	file://makefile.patch"
 
 SRC_URI[md5sum] = "70baf819021f2d733c122e3350764483"
-- 
1.7.0.4



