Received: from 4.26.mail-out.ovh.net ([46.105.53.201] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLxy3-0007ZX-21
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 15:36:15 +0200
Received: (qmail 9856 invoked by uid 503); 16 May 2011 12:59:00 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 12:58:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 15:32:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 15:32:30 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 15:22:48 +0200
Message-Id: <1305552169-26917-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2840926941511396681
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: mickey@vanille-media.de
Subject: [PATCH 1/2] python-sip: update to 4.12.2
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
X-List-Received-Date: Mon, 16 May 2011 13:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.12.1 is no more fetchable

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/python/python-sip_4.12.1.bb |    7 -------
 recipes/python/python-sip_4.12.2.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)
 delete mode 100644 recipes/python/python-sip_4.12.1.bb
 create mode 100644 recipes/python/python-sip_4.12.2.bb

diff --git a/recipes/python/python-sip_4.12.1.bb b/recipes/python/python-sip_4.12.1.bb
deleted file mode 100644
index 541da44..0000000
--- a/recipes/python/python-sip_4.12.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-sip.inc
-PR = "r0"
-
-SRC_URI[md5sum] = "0f8e8305b14c1812191de2e0ee22fea9"
-SRC_URI[sha256sum] = "e9d66e8830c2a58e6c17b9952710f67d495ddb84ce6f3d89400c8b52913381b5"
-
-
diff --git a/recipes/python/python-sip_4.12.2.bb b/recipes/python/python-sip_4.12.2.bb
new file mode 100644
index 0000000..0578486
--- /dev/null
+++ b/recipes/python/python-sip_4.12.2.bb
@@ -0,0 +1,8 @@
+require python-sip.inc
+PR = "r0"
+
+SRC_URI[md5sum] = "9df80f88e0e4022cdd8a8891c6c38048"
+SRC_URI[sha256sum] = "3e42bea028a1713558b5b8a317af4195d3b0feaa6c179d99401a7048f1a3cec4"
+
+
+
-- 
1.7.0.4



