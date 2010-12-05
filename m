Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPEwU-0006lA-3o
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 14:47:54 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 5B5261B40D;
	Sun,  5 Dec 2010 14:47:51 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 14:46:29 +0100
Message-Id: <1291556789-5681-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL, BAYES_00, TVD_SPACE_RATIO
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] uml-utilities_20040406: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 13:47:55 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/uml-utilities/uml-utilities_20040406.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/uml-utilities/uml-utilities_20040406.bb b/recipes/uml-utilities/uml-utilities_20040406.bb
index db5ad17..8bbad1c 100644
--- a/recipes/uml-utilities/uml-utilities_20040406.bb
+++ b/recipes/uml-utilities/uml-utilities_20040406.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Utilities for User-Mode-Linux"
 LICENSE = "GPL"
 DEPENDS = "zlib ncurses readline"
 PR = "r1"
-SRC_URI = "http://mirror.usermodelinux.org/uml/uml_utilities_${PV}.tar.bz2 \
+SRC_URI = "http://downloads.sourceforge.net/project/user-mode-linux/tools/1/uml_utilities_${PV}.tar.bz2  \
            file://fix-ldflags.patch"
 SRC_URI[md5sum] = "2c1ccd9efacbfb39e42d482b89b2550a"
 SRC_URI[sha256sum] = "4f179b1db021ef15ac7e9b2eed57c525db127a754c574f591c367460cded9f41"
-- 
1.7.0.4



