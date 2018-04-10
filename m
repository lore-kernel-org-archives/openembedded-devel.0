Return-Path: <daniel@zonque.org>
X-Greylist: delayed 607 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Apr 2018 10:53:38 UTC
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id 9B52272EF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 10:53:38 +0000 (UTC)
Received: from localhost.localdomain (mue-88-130-49-171.dsl.tropolys.de
	[88.130.49.171])
	by mail.bugwerft.de (Postfix) with ESMTPSA id CCC75286B4C;
	Tue, 10 Apr 2018 10:41:44 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 12:43:26 +0200
Message-Id: <20180410104326.6432-1-daniel@zonque.org>
X-Mailer: git-send-email 2.14.3
Subject: [meta-qt5][PATCH] qt5: bump libconnman-qt5 to 1.2.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 10:53:38 -0000

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
index ecd295c..368510d 100644
--- a/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-connectivity/libconnman-qt/libconnman-qt5_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://git.merproject.org/mer-core/libconnman-qt"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
 DEPENDS += "qtbase qtdeclarative"
-PV = "1.2.4+git${SRCPV}"
+PV = "1.2.7+git${SRCPV}"
 
-SRCREV = "9d98e12ed60ae4fa9da62485cb8a82129ed1a464"
+SRCREV = "ad7fef1c35a3e897913965f73b879a14d65043dd"
 SRC_URI = "git://git.merproject.org/mer-core/libconnman-qt.git;protocol=https \
     file://0001-Don-t-use-MeeGo-as-prefix-in-order-to-make-this-a-co.patch \
 "
-- 
2.14.3


