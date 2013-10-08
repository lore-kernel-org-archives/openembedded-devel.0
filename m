Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8F96CF4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:42 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 90FF3A6254
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:40 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:45 +0200
Message-Id: <1381222066-2737-20-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 20/21] qt: use 5.1.1 by default
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 conf/distro/include/qt5-versions.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index f534de7..7e2d76e 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,7 +1,7 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.1.0", "5.1.0+git%"
+# possible values now "5.1.1", "5.1.0+git%"
 
-QT5_VERSION ?= "5.1.0"
+QT5_VERSION ?= "5.1.1"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
-- 
1.8.4.rc3


