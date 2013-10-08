Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 88F596ADA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:35 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E3502A62E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:33 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:43 +0200
Message-Id: <1381222066-2737-18-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 18/21] qtserialport: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/{qtserialport_5.1.0.bb => qtserialport_5.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-qt/qt5/{qtserialport_5.1.0.bb => qtserialport_5.1.1.bb} (66%)

diff --git a/recipes-qt/qt5/qtserialport_5.1.0.bb b/recipes-qt/qt5/qtserialport_5.1.1.bb
similarity index 66%
rename from recipes-qt/qt5/qtserialport_5.1.0.bb
rename to recipes-qt/qt5/qtserialport_5.1.1.bb
index 11b5346..78c982a 100644
--- a/recipes-qt/qt5/qtserialport_5.1.0.bb
+++ b/recipes-qt/qt5/qtserialport_5.1.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528\
 "
 
-SRC_URI[md5sum] = "1f70621ae40cbda948106b070c6c37d2"
-SRC_URI[sha256sum] = "0f36803c480b2b7111b343e9dd871ffab1b4fd53147bd564125ef2994b09cfb9"
+SRC_URI[md5sum] = "83bba7e8f27d6d6d5a0d2fdcb5641d7f"
+SRC_URI[sha256sum] = "aee1a277b64dc70be6d7d0504e35f2df52a83b41ab65c344119e76222ceb063b"
-- 
1.8.4.rc3


