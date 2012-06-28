Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SkLe9-0004jT-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 22:49:01 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 979FFEA040
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 22:44:40 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7A0EE603C4; Thu, 28 Jun 2012 22:26:10 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2012 22:26:09 +0200
Message-Id: <1340915170-26873-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340915170-26873-1-git-send-email-apelete@seketeli.net>
References: <1340915170-26873-1-git-send-email-apelete@seketeli.net>
Subject: [meta-oe][PATCH 1/1] xcursor-transparent-theme_0.1.1: update SRC_URI
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
X-List-Received-Date: Thu, 28 Jun 2012 20:49:01 -0000

This patch updates the SRC_URI of xcursor-transparent-theme_0.1.1.bb
to projects.o-hand.com since the matchbox-project.org repository seems
to be down.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index 824c295..0f5808c 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SECTION = "x11/base"
 PR = "r4"
 
-SRC_URI = "http://matchbox-project.org/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
+SRC_URI = "http://projects.o-hand.com/matchbox/sources/utils/xcursor-transparent-theme-${PV}.tar.gz \
 	   file://use-relative-symlinks.patch \
 	   file://fix_watch_cursor.patch"
 
-- 
1.7.10



