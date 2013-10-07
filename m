Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 6F89C610EE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:32:51 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 32CFD940078;
	Tue,  8 Oct 2013 01:32:48 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:32:11 +0200
Message-Id: <1381188738-29468-11-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381188738-29468-1-git-send-email-eric@eukrea.com>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 11/18] qtscript: update to 5.1.1
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
X-List-Received-Date: Mon, 07 Oct 2013 23:32:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtscript_5.1.0.bb | 5 -----
 recipes-qt/qt5/qtscript_5.1.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtscript_5.1.0.bb
 create mode 100644 recipes-qt/qt5/qtscript_5.1.1.bb

diff --git a/recipes-qt/qt5/qtscript_5.1.0.bb b/recipes-qt/qt5/qtscript_5.1.0.bb
deleted file mode 100644
index d9bd00f..0000000
--- a/recipes-qt/qt5/qtscript_5.1.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require qt5-${PV}.inc
-require ${PN}.inc
-
-SRC_URI[md5sum] = "c9348cdc39826c717c75b930a7b5a3bf"
-SRC_URI[sha256sum] = "0cbe2e472657673ec8bd2f1ad133140b498292065159e67355f427e903c46d9b"
diff --git a/recipes-qt/qt5/qtscript_5.1.1.bb b/recipes-qt/qt5/qtscript_5.1.1.bb
new file mode 100644
index 0000000..d43e789
--- /dev/null
+++ b/recipes-qt/qt5/qtscript_5.1.1.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "5c0e8633fbf560f711b7af689f8bcb99"
+SRC_URI[sha256sum] = "d80061f7652ae3992e2b9ffbc7052d54872f6042a7a258b50d22eadf0175f364"
-- 
1.8.4.rc3


