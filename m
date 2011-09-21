Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6G45-0002hb-EZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 08:13:49 +0200
Received: (qmail invoked by alias); 21 Sep 2011 06:08:31 -0000
Received: from p4FDF1C6D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.109]
	by mail.gmx.net (mp011) with SMTP; 21 Sep 2011 08:08:31 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/XuUkQCvrXDREwCf89aNRr4R3TrkgFeGXR6Jz0T9
	/hnawE4h4Z1Nh/
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 08:11:52 +0200
Message-Id: <1316585520-18605-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
References: <1316585520-18605-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 03/11] libxfce4util: DEPENDS xfce4-dev-tools -> xfce4-dev-tools-native
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
X-List-Received-Date: Wed, 21 Sep 2011 06:13:49 -0000
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



