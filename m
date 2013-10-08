Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 84F286CF09
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:05 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E798BA62E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:03 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:34 +0200
Message-Id: <1381222066-2737-9-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 09/21] qtmultimedia: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtmultimedia_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtmultimedia_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtmultimedia_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtmultimedia_5.1.1.bb

diff --git a/recipes-qt/qt5/qtmultimedia_5.1.0.bb b/recipes-qt/qt5/qtmultimedia_5.1.0.bb
deleted file mode 100644
index 97ef3ba..0000000
--- a/recipes-qt/qt5/qtmultimedia_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "ae0301809ca504b4b67d817fd46f9a2e"
-SRC_URI[sha256sum] = "1df262e4d8d16f83511a096974a5a14af21d366493c5302d549e3dc52fa0b00f"
diff --git a/recipes-qt/qt5/qtmultimedia_5.1.1.bb b/recipes-qt/qt5/qtmultimedia_5.1.1.bb
new file mode 100644
index 0000000..f8b61ce
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "4b6e74bd7752bc241617f41539632bba"
+SRC_URI[sha256sum] = "df907a81c4ef15c9aec216c1f57aa72a7a7b274ea3cb3950f87fa1b04e369ebe"
-- 
1.8.4.rc3


