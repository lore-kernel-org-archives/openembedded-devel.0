Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RanJl-0004rd-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:48:13 +0100
Received: by localhost (Postfix, from userid 1000)
	id D0D94440BF6; Wed, 14 Dec 2011 12:41:13 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 12:40:58 +0100
Message-Id: <cb5b2fb31ea6ca6a5e6e994ed9b0a765cf906483.1323862499.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
References: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1323862499.git.sledz@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 3/5] live555: replace version 20110314 with 20111120
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
X-List-Received-Date: Wed, 14 Dec 2011 11:48:13 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/live555/live555_20110314.bb |    8 --------
 recipes/live555/live555_20111120.bb |    7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 recipes/live555/live555_20110314.bb
 create mode 100644 recipes/live555/live555_20111120.bb

diff --git a/recipes/live555/live555_20110314.bb b/recipes/live555/live555_20110314.bb
deleted file mode 100644
index 44664d2..0000000
--- a/recipes/live555/live555_20110314.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require live555.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "ff65b2c598e970b4b6c8219a1811de00"
-SRC_URI[sha256sum] = "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
-
-
diff --git a/recipes/live555/live555_20111120.bb b/recipes/live555/live555_20111120.bb
new file mode 100644
index 0000000..f6c4f63
--- /dev/null
+++ b/recipes/live555/live555_20111120.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "8e5ebefdf7d12ca9cfd7175ff3d7eef2"
+SRC_URI[sha256sum] = "695cf22d43516f082e26ee9eb8373a0ae3b4ed472f1e224b51d881219f694f2e"
+
-- 
1.7.7



