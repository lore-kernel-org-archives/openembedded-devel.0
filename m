Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 686726CED5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:46:33 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 12215A62C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:46:21 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:46:04 +0200
Message-Id: <1381221981-1585-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381221981-1585-1-git-send-email-eric@eukrea.com>
References: <1381221981-1585-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 04/21] qtsvg: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:46:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtsvg_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtsvg_5.1.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtsvg_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtsvg_5.1.1.bb

diff --git a/recipes-qt/qt5/qtsvg_5.1.0.bb b/recipes-qt/qt5/qtsvg_5.1.0.bb
deleted file mode 100644
index b54484d..0000000
--- a/recipes-qt/qt5/qtsvg_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "394d33cc5d6b7aafbaae5a4f1d9e6652"
-SRC_URI[sha256sum] = "50fc66ada43472e42245c18095e9eac84b496a634736cf55aac81326e4aad54a"
diff --git a/recipes-qt/qt5/qtsvg_5.1.1.bb b/recipes-qt/qt5/qtsvg_5.1.1.bb
new file mode 100644
index 0000000..4dcb243
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg_5.1.1.bb
@@ -0,0 +1,6 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "9db8209602b0ea942273e01a874ea5b7"
+SRC_URI[sha256sum] = "6bfe7705ff58391205ca797d84ca6dda57ebcce106fdff52d4908b0e443567bf"
+
-- 
1.8.4.rc3


