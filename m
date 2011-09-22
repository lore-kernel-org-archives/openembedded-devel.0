Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6kt9-0007HU-Qg
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:35 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:14 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:14 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18JdPQPOSkJ4PZJPsW/o4ZpIo7flQfzP30Wz2NfD4
	5v15WF+ohxfY0D
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:34 +0200
Message-Id: <1316704004-19647-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 03/13] libxfce4util: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
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
 .../libxfce4util/libxfce4util_4.8.1.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
index 5d94b6c..bda79dd 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Basic utility library for Xfce4"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "intltool-native xfce4-dev-tools glib-2.0"
+DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 PR = "r0"
 
-- 
1.7.4.4



