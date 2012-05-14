Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STxxw-0003o9-FW
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 18:17:44 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EG7jf9024640
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:45 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG7j9h008566
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 11:07:45 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 14 May 2012 11:07:45 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EG6AIC028612;
	Mon, 14 May 2012 11:07:43 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 May 2012 11:09:59 -0500
Message-ID: <1337011834-24879-35-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 34/69] libproxy: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 16:17:45 -0000
Content-Type: text/plain

* Updated LICENSE field version from generic LGPL to LGPLv2.1+ to
  reflect the real license version.
* This change was based on setting in oe-core as well as code
  inspection.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/gnome/libproxy_0.2.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gnome/libproxy_0.2.3.bb b/recipes/gnome/libproxy_0.2.3.bb
index 1fb9f68..4a4ed7e 100644
--- a/recipes/gnome/libproxy_0.2.3.bb
+++ b/recipes/gnome/libproxy_0.2.3.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "A library handling all the details of proxy configuration"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1+"
 DEPENDS = "libxmu gconf virtual/libx11"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
 	   file://libproxy-move-define-__USE_BSD.patch \
-- 
1.7.0.4



