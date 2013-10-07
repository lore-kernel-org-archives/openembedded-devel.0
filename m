Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 58DC46CE57
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:33:15 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 180809400B2;
	Tue,  8 Oct 2013 01:33:12 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:32:17 +0200
Message-Id: <1381188738-29468-17-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381188738-29468-1-git-send-email-eric@eukrea.com>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 17/18] qtwebkit-examples: update to 5.1.1
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
X-List-Received-Date: Mon, 07 Oct 2013 23:33:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtwebkit-examples_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtwebkit-examples_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.1.1.bb

diff --git a/recipes-qt/qt5/qtwebkit-examples_5.1.0.bb b/recipes-qt/qt5/qtwebkit-examples_5.1.0.bb
deleted file mode 100644
index 1e671b6..0000000
--- a/recipes-qt/qt5/qtwebkit-examples_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "a27360f16e4ca31e3d1098d1b2feba73"
-SRC_URI[sha256sum] = "f8078a87df729103e6009432e5b784531842997197827f67db8a34f1715f8921"
diff --git a/recipes-qt/qt5/qtwebkit-examples_5.1.1.bb b/recipes-qt/qt5/qtwebkit-examples_5.1.1.bb
new file mode 100644
index 0000000..d0f61de
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "660b4e169a13074d2edcc3110a7b5ba8"
+SRC_URI[sha256sum] = "1297212198790f186cb647dcfa929fd2de0824bd04578cf041355e4eabb33ff2"
-- 
1.8.4.rc3


