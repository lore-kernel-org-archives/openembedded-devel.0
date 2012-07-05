Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCL-0003bc-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:37 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 77465EA04D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:14 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id B6A6E60CB2; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:27 +0200
Message-Id: <8825b28fc691265458acd273f03e1fdd55856ecb.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
In-Reply-To: <cover.1341438914.git.apelete@seketeli.net>
References: <cover.1341438914.git.apelete@seketeli.net>
Subject: [PATCH 09/14] gtk+: Rebase gtk+-2.20.1/no-demos.patch
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:37 -0000

This patch rebases the recipes/gtk+/gtk+-2.20.1/no-demos.patch file
against the version of the files of gtk+-2.20.1.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/gtk+/gtk+-2.20.1/no-demos.patch |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/gtk+/gtk+-2.20.1/no-demos.patch b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
index 0fc4c48..ac0730d 100644
--- a/recipes/gtk+/gtk+-2.20.1/no-demos.patch
+++ b/recipes/gtk+/gtk+-2.20.1/no-demos.patch
@@ -1,7 +1,8 @@
---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
-+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
-@@ -1,6 +1,6 @@
+--- gtk+-2.20.1/Makefile.am.orig	2012-06-18 22:40:19.348040648 +0200
++++ gtk+-2.20.1/Makefile.am	2012-06-18 22:40:41.272149318 +0200
+@@ -1,7 +1,7 @@
  ## Makefile.am for GTK+
+ include $(top_srcdir)/Makefile.decl
  
 -SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos tests perf contrib
 +SRC_SUBDIRS = gdk-pixbuf gdk gtk modules tests perf contrib
-- 
1.7.10



