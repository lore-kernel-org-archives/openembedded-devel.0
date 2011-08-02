Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qo97b-0003Hf-M8
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 09:10:35 +0200
Received: (qmail invoked by alias); 02 Aug 2011 07:06:14 -0000
Received: from p4FDF0FCF.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.15.207]
	by mail.gmx.net (mp002) with SMTP; 02 Aug 2011 09:06:14 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+MdI5ufYeM3C2B68tw9aYjExBPypXEXnqA3tlCir
	eGsmDar8x9/VuE
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 09:09:08 +0200
Message-Id: <1312268948-5879-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312268948-5879-1-git-send-email-schnitzeltony@gmx.de>
References: <1312268948-5879-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe v2 1/1] iceauth: Import 1.0.4 from oe.dev
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
X-List-Received-Date: Tue, 02 Aug 2011 07:10:35 -0000

The patch was imported from the OpenEmbedded git server
(git://github.com/openembedded/openembedded.git) as of commit id
033af22d565adabc05303f88e76e31e7d239756c.

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
new file mode 100644
index 0000000..168afc2
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.4.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+DESCRIPTION = "Tool for manipulating ICE protocol authorization records"
+LIC_FILES_CHKSUM = "file://COPYING;md5=13f70acf3c27f5f834bbc954df775f8e"
+DEPENDS += "libice"
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "bb2e4d2611047f7c5a1a82ec956a9de4"
+SRC_URI[sha256sum] = "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb70fb51448848ef2f349938d"
-- 
1.7.4.4



