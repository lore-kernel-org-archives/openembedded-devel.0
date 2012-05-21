Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgE-00014D-N1
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:33:51 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LENgRZ031627
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:42 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENgis029972
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:23:42 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:23:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAoh008382;
	Mon, 21 May 2012 09:23:40 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:10 -0500
Message-ID: <1337610609-1173-12-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 11/70] hostap-daemon: Update LICENSE field version to GPLv2
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
X-List-Received-Date: Mon, 21 May 2012 14:33:51 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2 to
  reflect the real license version.
* This change was based on code inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/hostap/hostap-daemon-0.7.inc  |    2 +-
 recipes/hostap/hostap-daemon_0.7.3.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/hostap/hostap-daemon-0.7.inc b/recipes/hostap/hostap-daemon-0.7.inc
index 49f2650..187cec5 100644
--- a/recipes/hostap/hostap-daemon-0.7.inc
+++ b/recipes/hostap/hostap-daemon-0.7.inc
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DEPENDS = "libnl openssl"
 
 inherit update-rc.d
diff --git a/recipes/hostap/hostap-daemon_0.7.3.bb b/recipes/hostap/hostap-daemon_0.7.3.bb
index 5a8aee7..99297a9 100644
--- a/recipes/hostap/hostap-daemon_0.7.3.bb
+++ b/recipes/hostap/hostap-daemon_0.7.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
 
 require hostap-daemon-0.7.inc
 
-PR = "r3"
+PR = "r4"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.0.4



