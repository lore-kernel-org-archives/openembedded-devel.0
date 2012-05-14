Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxy4-00044J-TB
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:53 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7rwA026074
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:53 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7rcA008680
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:53 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:53 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIF028612;
	Mon, 14 May 2012 11:07:51 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:02 -0500
Message-ID: <1337011834-24879-38-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 37/69] schroedinger: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:54 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic MPL/GPL/LGPL/MIT to
  MPL-1.1 or LGPLv2 or GPLv2 or MIT to reflect the real license
  version.
* This change was based on code inspection

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/schroedinger/schroedinger_1.0.9.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/schroedinger/schroedinger_1.0.9.bb b/recipes/schroedinger/schroedinger_1.0.9.bb
index 2994428..7813083 100644
--- a/recipes/schroedinger/schroedinger_1.0.9.bb
+++ b/recipes/schroedinger/schroedinger_1.0.9.bb
@@ -1,6 +1,8 @@
 require schroedinger.inc
 
-PR = "${INC_PR}.0"
+LICENSE = "MPL-1.1 | LGPLv2 | GPLv2 | MIT"
+
+PR = "${INC_PR}.1"
 
 inherit autotools
 
-- 
1.7.0.4



