Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id E96546CED1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:46:37 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 514CCA626F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:46:35 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:46:08 +0200
Message-Id: <1381221981-1585-8-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381221981-1585-1-git-send-email-eric@eukrea.com>
References: <1381221981-1585-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 08/21] qtimageformats: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtimageformats_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtimageformats_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtimageformats_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtimageformats_5.1.1.bb

diff --git a/recipes-qt/qt5/qtimageformats_5.1.0.bb b/recipes-qt/qt5/qtimageformats_5.1.0.bb
deleted file mode 100644
index b7a8b08..0000000
--- a/recipes-qt/qt5/qtimageformats_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "6dfab2e481e90ce74e89c646b91a11ca"
-SRC_URI[sha256sum] = "c740442a46715e32a45f60e42fda76afd8430bf0004ee1f7147aa77cf92ed846"
diff --git a/recipes-qt/qt5/qtimageformats_5.1.1.bb b/recipes-qt/qt5/qtimageformats_5.1.1.bb
new file mode 100644
index 0000000..ccb539a
--- /dev/null
+++ b/recipes-qt/qt5/qtimageformats_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "209edddd5899b36ea7ea7ad52204a593"
+SRC_URI[sha256sum] = "3bbb7825c0298c7d95d26b205e48da02c5bac3b35d66a601f939f8ee8b3463a4"
-- 
1.8.4.rc3


