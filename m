Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Q2Tzz-0008LO-AN
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 20:45:43 +0100
Received: (qmail invoked by alias); 23 Mar 2011 19:37:08 -0000
Received: from mail2.zera.de (EHLO localhost.localdomain) [62.225.102.139]
	by mail.gmx.net (mp006) with SMTP; 23 Mar 2011 20:37:08 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/bE5ZVE0DbF33moKHwdGPSUQtOwi3rXKwH/KEc2z
	2DRQU5ljLTUgtn
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 20:28:59 +0100
Message-Id: <1300908539-2442-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] xfce4-session_4.6.1.bb: fix typo lbwnck->libwnck
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
X-List-Received-Date: Wed, 23 Mar 2011 19:45:43 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/xfce-base/xfce4-session_4.6.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-base/xfce4-session_4.6.1.bb
index 09e34c5..4385ab8 100644
--- a/recipes/xfce-base/xfce4-session_4.6.1.bb
+++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
-DEPENDS = "lbwnck libxfcegui4 libxfce4util dbus xfce-utils"
+DEPENDS = "libwnck libxfcegui4 libxfce4util dbus xfce-utils"
 SECTION = "x11"
 
-PR = "r5"
+PR = "r6"
 
 inherit xfce46
 
-- 
1.7.2.3



