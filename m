Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RQ4Ci-0001fE-7y
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 22:36:36 +0100
Received: (qmail invoked by alias); 14 Nov 2011 21:30:13 -0000
Received: from p5B0A3A75.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.117]
	by mail.gmx.net (mp007) with SMTP; 14 Nov 2011 22:30:13 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19Uz0wxSMNUj9iPNQlJU1krLpV2D9hwBHMt3ikehx
	5XVOFCor3t34xs
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 22:35:11 +0100
Message-Id: <1321306512-9055-5-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
References: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 4/5] ristretto: update to 0.3.0
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
X-List-Received-Date: Mon, 14 Nov 2011 21:36:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{ristretto_0.2.2.bb => ristretto_0.3.0.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.2.2.bb => ristretto_0.3.0.bb} (68%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
similarity index 68%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
index 78d090c..a8c028f 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.2.2.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.0.bb
@@ -7,5 +7,5 @@ DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "ee812d1200674960c246a7e05a1cbc6d"
-SRC_URI[sha256sum] = "c43832d7e6e37b670c3dd04dcf406266ff5980dc80abed7b8a82aa7c7defaa69"
+SRC_URI[md5sum] = "124c4e98f837e35c728b0ff1d9078b1a"
+SRC_URI[sha256sum] = "a8bf0aa8a18af4ad8d53cbfc918bc92db51b5446cf7ff09e7b988fe5c7b986e4"
-- 
1.7.4.4



