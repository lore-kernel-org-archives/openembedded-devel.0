Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STy1K-00084S-UZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:21:15 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG6WZS025902
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:32 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6WQP007472
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:06:32 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:06:32 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AHj028612;
	Mon, 14 May 2012 11:06:30 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:32 -0500
Message-ID: <1337011834-24879-8-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 07/69] gnome-keyring: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:21:35 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+,
  LGPLv2+, and LGPLv2.1+ to reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/gnome-keyring_2.28.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/gnome-keyring_2.28.2.bb b/recipes/gnome/gnome-keyring_2.28.2.bb
index dceb070..8e63e7e 100644
--- a/recipes/gnome/gnome-keyring_2.28.2.bb
+++ b/recipes/gnome/gnome-keyring_2.28.2.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "GNOME security credential management"
-LICENSE = "GPL"
+LICENSE = "GPLv2+ LGPLv2+ LGPLv2.1+"
 SECTION = "x11/gnome"
 DEPENDS = " gtk+-native libpam gconf gtk+ libtasn1 libtasn1-native libgcrypt"
-PR = "r1"
+PR = "r2"
 
 inherit gnome pkgconfig
 
-- 
1.7.0.4



