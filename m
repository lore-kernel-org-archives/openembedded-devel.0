Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyK-0004bv-F9
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG89ME026124
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:09 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG89LF008942
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:09 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIL028612;
	Mon, 14 May 2012 11:08:07 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:08 -0500
Message-ID: <1337011834-24879-44-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 43/69] libvisual: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:09 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL/GPL to LGPLv2.1+
  and GPLv2 to reflect the real license version.
* This change was based on code inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/libvisual/libvisual_0.4.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libvisual/libvisual_0.4.0.bb b/recipes/libvisual/libvisual_0.4.0.bb
index b8f6fd8..b7e898c 100644
--- a/recipes/libvisual/libvisual_0.4.0.bb
+++ b/recipes/libvisual/libvisual_0.4.0.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "A cross platform audio visualization library"
 HOMEPAGE = "http://libvisual.sf.net"
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "LGPL GPL"
-PR = "r1"
+LICENSE = "LGPLv2.1+ GPLv2"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libvisual/libvisual-${PV}.tar.gz \
            file://no-libdir.patch \
-- 
1.7.0.4



