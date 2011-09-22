Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktJ-0007JT-IC
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:45 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:26 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:26 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/u8bJktQHu5V082OR10szGvJKnsl5rIePXBslx9H
	3TOLUf4u0Q8C9h
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:44 +0200
Message-Id: <1316704004-19647-14-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 13/13] xfce4-panel: Bump to version 4.8.6
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../{xfce4-panel_4.8.5.bb => xfce4-panel_4.8.6.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.8.5.bb => xfce4-panel_4.8.6.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index d99f332..c30abb0 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -30,5 +30,5 @@ FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
 FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
                    "
 
-SRC_URI[md5sum] = "3c00e92821709baa2a71b166a32d46a2"
-SRC_URI[sha256sum] = "df8379a18d337481b847cf232eec907a927287917788e7b730deef4a535deada"
+SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
+SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
-- 
1.7.4.4



