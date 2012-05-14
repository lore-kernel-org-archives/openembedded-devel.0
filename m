Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyP-0004ll-SW
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:14 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8EWl028062
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:14 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8E1H009005
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:14 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:14 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIN028612;
	Mon, 14 May 2012 11:08:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:10 -0500
Message-ID: <1337011834-24879-46-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 45/69] libxv: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:15 -0000
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



