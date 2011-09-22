Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktC-0007Ho-5C
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:40 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:18 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:18 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18Ano4BDRwA4rQeGVCJaYuclQ0ike9u4ZbcY2lrfg
	q2P7LBboFVwz2e
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:38 +0200
Message-Id: <1316704004-19647-8-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 07/13] libxfce4util: Bump to version 4.8.2
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
 ...libxfce4util_4.8.1.bb => libxfce4util_4.8.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.8.1.bb => libxfce4util_4.8.2.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb
index bda79dd..a9819fb 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.8.2.bb
@@ -10,5 +10,5 @@ inherit xfce
 
 EXTRA_OECONF += "--with-broken-putenv=yes"
 
-SRC_URI[md5sum] = "2be3af4c7db5ad293a7525e1021e6f0f"
-SRC_URI[sha256sum] = "732aeb4f845fb92efb5487e49662f5b8544ea5feb9f1e4bd7629e726aaa70c81"
+SRC_URI[md5sum] = "3376a77637a4292a863027d595548ee2"
+SRC_URI[sha256sum] = "05a149841575cb961588742c8c9795c6f0d09f27d59546dd8a933b010d2ac816"
-- 
1.7.4.4



