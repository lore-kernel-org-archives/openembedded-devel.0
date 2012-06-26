Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SjcPI-0002aT-US
	for openembedded-devel@openembedded.org; Tue, 26 Jun 2012 22:30:40 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 8E2D6EA042;
	Tue, 26 Jun 2012 22:26:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 69DD864495; Tue, 26 Jun 2012 22:19:47 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Tue, 26 Jun 2012 22:19:47 +0200
Message-Id: <1340741987-29429-2-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340741987-29429-1-git-send-email-apelete@seketeli.net>
References: <1340741987-29429-1-git-send-email-apelete@seketeli.net>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 1/1] task-muffinman: remove phoneme-advanced-foundation
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
X-List-Received-Date: Tue, 26 Jun 2012 20:30:41 -0000

This patch removes phoneme-advanced-foundation from the task-muffinman
recipe, since it is not supported any longer.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/tasks/task-muffinman.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/tasks/task-muffinman.bb b/recipes/tasks/task-muffinman.bb
index 97ef1db..eef0abe 100644
--- a/recipes/tasks/task-muffinman.bb
+++ b/recipes/tasks/task-muffinman.bb
@@ -14,4 +14,4 @@ RDEPENDS_${PN} = "echinus ourico dzen2 matchbox-desktop net-tools xinit \
 		  fileselector feh imlib2-loaders mupdf stppc2x mplayer \
 		  gcalc psplash jlime-extras greq midpath-backend-sdl \
 		  midpath-core midpath-cldc libxmlpull-java netsurf-fb \
-		  phoneme-advanced-foundation"
+		  "
-- 
1.7.10



