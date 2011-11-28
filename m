Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RUx0H-0005Y0-UX
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 09:55:58 +0100
Received: by localhost (Postfix, from userid 1000)
	id 2D22044A609; Mon, 28 Nov 2011 09:49:20 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 09:49:12 +0100
Message-Id: <1322470152-12440-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] live555: add version 2011.11.20
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
X-List-Received-Date: Mon, 28 Nov 2011 08:55:58 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/live555/live555_20111120.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 recipes/live555/live555_20111120.bb

diff --git a/recipes/live555/live555_20111120.bb b/recipes/live555/live555_20111120.bb
new file mode 100644
index 0000000..7256007
--- /dev/null
+++ b/recipes/live555/live555_20111120.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "8e5ebefdf7d12ca9cfd7175ff3d7eef2"
+SRC_URI[sha256sum] = "695cf22d43516f082e26ee9eb8373a0ae3b4ed472f1e224b51d881219f694f2e"
+
-- 
1.7.7



