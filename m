Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMLjV-0000Ll-6k
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 15:26:35 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 6A5171B421;
	Sat, 27 Nov 2010 15:26:35 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 15:25:14 +0100
Message-Id: <1290867914-14359-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dircproxy_1.1.0: fixed download url
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
X-List-Received-Date: Sat, 27 Nov 2010 14:26:35 -0000

new src url
---
 recipes/dircproxy/dircproxy_1.1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/dircproxy/dircproxy_1.1.0.bb b/recipes/dircproxy/dircproxy_1.1.0.bb
index ec2a802..e9cc46b 100644
--- a/recipes/dircproxy/dircproxy_1.1.0.bb
+++ b/recipes/dircproxy/dircproxy_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://dircproxy.securiweb.net/"
 LICENSE = "GPLv2"
 PR = "r1"
 
-SRC_URI = "http://dircproxy.securiweb.net/pub/1.1/dircproxy-${PV}.tar.gz\
+SRC_URI = "http://dircproxy.googlecode.com/files/dircproxy-${PV}.tar.gz\
            file://dircproxy.patch"
 
 inherit autotools
-- 
1.7.0.4



