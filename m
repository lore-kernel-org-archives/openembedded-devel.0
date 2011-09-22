Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktF-0007IO-Mm
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:41 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:21 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX195P75WLFJ5Y5V7ZAe+vGhPkRzz/qa2Jim/ycajjC
	TLm078vBniRWUb
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:42 +0200
Message-Id: <1316704004-19647-12-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 11/13] task-xfce-base: add xfce4-notifyd
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-base.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
index 7589f6d..782f30c 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-base.bb
@@ -29,6 +29,8 @@ RDEPENDS_${PN} = " \
     xfce4-panel-plugin-tasklist \
     xfce4-panel-plugin-windowmenu \   
     xfce4-settings \
+    \
+    xfce4-notifyd \
     xfce-terminal \
     thunar \
     thunar-volman \
-- 
1.7.4.4



