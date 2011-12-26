Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rezz0-0000w0-RP
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Dec 2011 03:08:11 +0100
Received: (qmail invoked by alias); 26 Dec 2011 02:01:00 -0000
Received: from p4FDF1C30.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.48]
	by mail.gmx.net (mp072) with SMTP; 26 Dec 2011 03:01:00 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ZTgg765HZqnkp4yqPaekzKc5Rxk3eOU7sIqifZ+
	Tg65n747XVYv/S
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Dec 2011 03:01:57 +0100
Message-Id: <1324864919-17138-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/3] tumbler: update to 0.1.23
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
X-List-Received-Date: Mon, 26 Dec 2011 02:08:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested incremental & from empty build dir
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{tumbler_0.1.22.bb => tumbler_0.1.23.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.22.bb => tumbler_0.1.23.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb
index d06ae31..cd95a03 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.22.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb
@@ -28,5 +28,5 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
 
-SRC_URI[md5sum] = "e7ba3b8f21f8f7e736f1e214906b4ca9"
-SRC_URI[sha256sum] = "9e41fe8f76f9422fb4f804e9635f6734552f0d82361f9971c0442a2119d451b6"
+SRC_URI[md5sum] = "c6cf6821f5d884cbf2c26f45f2fecc74"
+SRC_URI[sha256sum] = "b3066d17b7e1fee5135eb876a7c2c50a1221bd0d447c3dd7c36efe6d7f3874cb"
-- 
1.7.4.4



