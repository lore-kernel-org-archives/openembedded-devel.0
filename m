Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RPhX4-0000De-0h
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Nov 2011 22:24:06 +0100
Received: (qmail invoked by alias); 13 Nov 2011 21:17:45 -0000
Received: from p5B0A37D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.209]
	by mail.gmx.net (mp060) with SMTP; 13 Nov 2011 22:17:45 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+oHyY07MKoW3DyXUdWJPTSF1Hv5XaSEKuBNB/68w
	OGa75goP5VLh6A
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Nov 2011 22:22:42 +0100
Message-Id: <1321219363-17855-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321219363-17855-1-git-send-email-schnitzeltony@gmx.de>
References: <1321219363-17855-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 4/5] ristretto: update to 0.3.0
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
X-List-Received-Date: Sun, 13 Nov 2011 21:24:06 -0000
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



