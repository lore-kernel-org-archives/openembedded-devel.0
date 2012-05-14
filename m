Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxyN-0004iY-Bw
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:18:11 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG8CM2024697
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:12 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG8Cx2008981
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:08:12 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:08:12 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIM028612;
	Mon, 14 May 2012 11:08:09 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:10:09 -0500
Message-ID: <1337011834-24879-45-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 44/69] x264: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:18:12 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic GPL to GPLv2+ to
  reflect the real license version.
* This change was based on code inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/vlc/x264_r2245.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
index 0cffea3..bc4b584 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "H.264 encoder"
-LICENSE = "GPL"
-PR = "r8"
+LICENSE = "GPLv2+"
+PR = "r9"
 
 X264PV = "snapshot-20100531-2245"
 
-- 
1.7.0.4



