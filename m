Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWThj-0003Ln-I0
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:35:24 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEPFv5005707
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:15 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEPFq7031457
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:25:15 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:25:15 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENApI008382;
	Mon, 21 May 2012 09:25:13 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:45 -0500
Message-ID: <1337610609-1173-47-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 46/70] libxv: Update LICENSE field version to MIT-style
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
X-List-Received-Date: Mon, 21 May 2012 14:35:25 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to MIT-style to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/xorg-lib/libxv_1.0.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-lib/libxv_1.0.6.bb b/recipes/xorg-lib/libxv_1.0.6.bb
index e8b94e2..c2a3788 100644
--- a/recipes/xorg-lib/libxv_1.0.6.bb
+++ b/recipes/xorg-lib/libxv_1.0.6.bb
@@ -1,8 +1,8 @@
 require xorg-lib-common.inc
 DESCRIPTION = "X11 Video extension library"
-LICENSE = "GPL"
+LICENSE = "MIT-style"
 DEPENDS += "libxext videoproto"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[archive.md5sum] = "e292445a64b63e918bbc8b6aae6391dd"
 SRC_URI[archive.sha256sum] = "e20f8e594bb0f44f3fbd25996945730391d72acbe5eaac760429fd6579caf5ee"
-- 
1.7.0.4



