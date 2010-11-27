Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMNo0-00037f-78
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 17:39:20 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 667181B421;
	Sat, 27 Nov 2010 17:39:22 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 17:38:03 +0100
Message-Id: <1290875883-20882-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libdessert: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 16:39:20 -0000

---
 recipes/libdessert/libdessert_0.86.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libdessert/libdessert_0.86.14.bb b/recipes/libdessert/libdessert_0.86.14.bb
index 1308f71..42548c1 100644
--- a/recipes/libdessert/libdessert_0.86.14.bb
+++ b/recipes/libdessert/libdessert_0.86.14.bb
@@ -6,7 +6,7 @@ PR = "r2"
 
 DEPENDS = "net-snmp libpcap libcli"
 
-SRC_URI = "http://www.des-testbed.net/sites/default/files/${PN}${PV}.tar.gz \
+SRC_URI = "http://www.des-testbed.net/sites/default/files/DES-SERT/${PN}${PV}.tar.gz \
 	   file://0001-big-fat-autotools-patch.patch \
 	  "
 
-- 
1.7.0.4



