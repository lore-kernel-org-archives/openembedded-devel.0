Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 33AEB6CF47
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:32 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9048CA6222
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:30 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:42 +0200
Message-Id: <1381222066-2737-17-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 17/21] qtquickcontrols: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtquickcontrols_5.1.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.1.bb

diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
deleted file mode 100644
index fc880d7..0000000
--- a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "b3825124a173a36f63c2f8380dc61e81"
-SRC_URI[sha256sum] = "88d39421d78464c3900c37616e8369fc8d998c1b0f611980e6e082f46569646b"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.1.bb b/recipes-qt/qt5/qtquickcontrols_5.1.1.bb
new file mode 100644
index 0000000..ea6c7f9
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.1.1.bb
@@ -0,0 +1,6 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "6482ee0c4b11119ae5cb5080e61c18c0"
+SRC_URI[sha256sum] = "52fe58cb83f7b76d46abd12485713a7bd62a3b2739a7271098e0a1ea25d9fec3"
+
-- 
1.8.4.rc3


