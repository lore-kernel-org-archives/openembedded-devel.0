Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3613E6ADA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:12 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 8DF10A635F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:10 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:36 +0200
Message-Id: <1381222066-2737-11-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 11/21] qtsensors: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtsensors_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtsensors_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtsensors_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtsensors_5.1.1.bb

diff --git a/recipes-qt/qt5/qtsensors_5.1.0.bb b/recipes-qt/qt5/qtsensors_5.1.0.bb
deleted file mode 100644
index 9d314ea..0000000
--- a/recipes-qt/qt5/qtsensors_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "bcb4b546d1d39f2e27425b48bae90ac2"
-SRC_URI[sha256sum] = "5cfd74323e8145a282fe840c47c639c064e832263744a24270f326a1464830ee"
diff --git a/recipes-qt/qt5/qtsensors_5.1.1.bb b/recipes-qt/qt5/qtsensors_5.1.1.bb
new file mode 100644
index 0000000..a363d87
--- /dev/null
+++ b/recipes-qt/qt5/qtsensors_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "219607895e15348d723fa67324d7061a"
+SRC_URI[sha256sum] = "07f2d94964b47786a33ba1e24049c81b29e95b791647f9116ea350dc4cbc814f"
-- 
1.8.4.rc3


