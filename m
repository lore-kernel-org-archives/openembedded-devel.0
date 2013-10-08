Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id DF98D6CF1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:47:59 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 4AA49A6276
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:47:57 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:32 +0200
Message-Id: <1381222066-2737-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 07/21] qtgraphicaleffects: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtgraphicaleffects_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtgraphicaleffects_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.1.1.bb

diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.1.0.bb b/recipes-qt/qt5/qtgraphicaleffects_5.1.0.bb
deleted file mode 100644
index 3d24d7a..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "0e38ef686197fbf1207a9510f07d0656"
-SRC_URI[sha256sum] = "ea30ed7c3523d1a800a63cb888096cef89c61b590bfc81ba815ab9b12e283a89"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.1.1.bb b/recipes-qt/qt5/qtgraphicaleffects_5.1.1.bb
new file mode 100644
index 0000000..311f113
--- /dev/null
+++ b/recipes-qt/qt5/qtgraphicaleffects_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "40d0989d68fb08c1184b7d5088da9c48"
+SRC_URI[sha256sum] = "347c33ee496d67d98d64b6fa43797c45eae85752bb0026eb234bfb420f77febf"
-- 
1.8.4.rc3


