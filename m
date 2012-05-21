Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1SWTgk-0001xT-FM
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 16:34:22 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LEOE2A009693
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:14 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LEOCJW030491
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 09:24:14 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 09:24:14 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LENAot008382;
	Mon, 21 May 2012 09:24:12 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 May 2012 09:29:22 -0500
Message-ID: <1337610609-1173-24-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
References: <1337610609-1173-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 23/70] libgcrypt: Update LICENSE field version to GPLv2 and LGPLv2.1
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
X-List-Received-Date: Mon, 21 May 2012 14:34:23 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL/LGPL/FDL to
  GPLv2+ and LGPLv2.1+ to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libgcrypt/libgcrypt_1.4.1.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/libgcrypt/libgcrypt_1.4.1.bb b/recipes/libgcrypt/libgcrypt_1.4.1.bb
index bb7457d..58eacbe 100644
--- a/recipes/libgcrypt/libgcrypt_1.4.1.bb
+++ b/recipes/libgcrypt/libgcrypt_1.4.1.bb
@@ -1,5 +1,9 @@
 require libgcrypt.inc
 
+LICENSE = "GPLv2+ LGPLv2.1+"
+
+PR = "r1"
+
 
 SRC_URI[md5sum] = "555488ddfc81a6e0df1fb5112e7eee13"
 SRC_URI[sha256sum] = "7562042a6210947363bd6a9bbcdd03f8d02470c0347970b507f689d25a907844"
-- 
1.7.0.4



