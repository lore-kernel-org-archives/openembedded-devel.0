Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgC-0000yK-CV
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:33:48 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENehj005383
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:40 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENeU2029929
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:40 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:39 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAog008382;
	Mon, 21 May 2012 09:23:38 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:09 -0500
Message-ID: <1337610609-1173-11-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 10/70] hicolor-icon-theme: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:33:48 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.11.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
index a980570..f8f8677 100644
--- a/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
+++ b/recipes/hicolor-icon-theme/hicolor-icon-theme_0.11.bb
@@ -1,11 +1,11 @@
 SECTION = "unknown"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 inherit autotools gtk-icon-cache
 
 # Override RDEPENDS_${PN} = hicolor-icon-theme from gtk-icon-cache
 RDEPENDS_${PN} = ""
 RDEPENDS_${PN} = ""
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${P}.tar.gz"
 
-- 
1.7.0.4



