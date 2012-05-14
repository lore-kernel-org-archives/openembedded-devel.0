Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy13-00084S-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:21:10 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7ILj026011
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:18 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7Iqn008176
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:18 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AI2028612;
	Mon, 14 May 2012 11:07:16 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:49 -0500
Message-ID: <1337011834-24879-25-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 24/69] libgpg-error: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:21:15 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL/LGPL/FDL to
  GPLv2 and LGPLv2.1 to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libgpg-error/libgpg-error_1.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libgpg-error/libgpg-error_1.4.bb b/recipes/libgpg-error/libgpg-error_1.4.bb
index 951bd28..38715aa 100644
--- a/recipes/libgpg-error/libgpg-error_1.4.bb
+++ b/recipes/libgpg-error/libgpg-error_1.4.bb
@@ -1,6 +1,8 @@
 require libgpg-error.inc
 
-PR = "${INC_PR}.1"
+LICENSE = "GPLv2 LGPLv2.1"
+
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "86e60e9a03205fb706e99be101a2387e"
 SRC_URI[sha256sum] = "fff67ec5ffc93cf91fc62350a19a9f677c9bc6eb2730395d22f9d40c754ed619"
-- 
1.7.0.4



