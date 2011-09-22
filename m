Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktA-0007Ha-HZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:36 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:13 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:13 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+L65lzhGyLX/j2y/bnLUXYeh2vud43cgSX4iYTjh
	mbUJZlEbtArjmY
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:33 +0200
Message-Id: <1316704004-19647-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 02/13] garcon: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
index 63825fe..344f2d4 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.1.8.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
-DEPENDS = "glib-2.0 xfce4-dev-tools"
+DEPENDS = "glib-2.0 xfce4-dev-tools-native"
 
 PR = "r0"
 
-- 
1.7.4.4



