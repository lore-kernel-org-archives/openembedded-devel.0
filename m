Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1TIguE-0007bx-QV
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:23:34 +0200
Received: by zeus (Postfix, from userid 996)
	id 7AE41520FAC; Mon,  1 Oct 2012 08:10:48 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 08:10:47 -0600
Message-Id: <1349100647-7189-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] media-ctl: Update to latest upstream to fix build with latest autotools
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
X-List-Received-Date: Mon, 01 Oct 2012 14:23:35 -0000

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index 1034d8c..d96c1f9 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -3,10 +3,10 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
 SRC_URI = "git://git.ideasonboard.org/media-ctl.git;protocol=git"
-SRCREV = "f2f1e160ce411a08836e31c36a09c9dd55ec9784"
+SRCREV = "a6ec4a37028952ffd6e62eb52648cf66248eb519"
 
 PV = "0.0.1"
-PR = "r2"
+PR = "r3"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
1.7.9.5



