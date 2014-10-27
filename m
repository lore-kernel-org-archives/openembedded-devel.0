Return-Path: <milo-software@users.sourceforge.net>
X-Greylist: delayed 457 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Oct 2014 17:43:45 UTC
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5DC65D3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 17:43:45 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 6539566445;
	Mon, 27 Oct 2014 18:36:07 +0100 (CET)
Received: from phenom.local (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP;
	Mon, 27 Oct 2014 18:36:07 +0100 (CET)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Oct 2014 18:35:55 +0100
Message-Id: <1414431355-8764-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1413915135-20979-1-git-send-email-milo-software@users.sourceforge.net>
References: <1413915135-20979-1-git-send-email-milo-software@users.sourceforge.net>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: [meta-oe][PATCH v2] vlc/libdvdcss: Upgrade to 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Oct 2014 17:43:51 -0000

Tested and in use for a while in OpenPLi.

Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
---
 .../{libdvdcss_1.2.13.bb => libdvdcss_1.3.0.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.2.13.bb => libdvdcss_1.3.0.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
index 1a316d3..79e64ae 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.2.13.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.3.0.bb
@@ -8,5 +8,5 @@ inherit autotools
 
 EXTRA_OECONF = " --disable-doc "
 
-SRC_URI[md5sum] = "53cfc52a60a156763c425572e5179273"
-SRC_URI[sha256sum] = "84f1bba6cfef1df87f774fceaefc8e73c4cda32e8f6700b224ad0acb5511ba2c"
+SRC_URI[md5sum] = "7f0fdb3ff91d638f5e45ed7536f7eb67"
+SRC_URI[sha256sum] = "7c414acd520c4e4dd7267952f72d738ff50321a7869af4d75c65aefad44f1395"
-- 
1.7.9.5


