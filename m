Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TKE3C-0008CV-TO for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 21:59:11 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 845DBE02A7;
	Fri,  5 Oct 2012 19:46:08 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 5AA61703B8B; Fri,  5 Oct 2012 21:46:08 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 21:46:01 +0200
Message-Id: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1349466172.git.sledz@dresearch-fe.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
Subject: [meta-java 1/5] icedtea6-native-1.7.10: add missing LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 19:59:11 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes-core/icedtea/icedtea6-native_1.7.10.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/icedtea/icedtea6-native_1.7.10.bb b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
index 77c6232..54ac87d 100644
--- a/recipes-core/icedtea/icedtea6-native_1.7.10.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
@@ -1,5 +1,7 @@
 require ${PN}.inc
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
 PR = "${INC_PR}.0"
 
 SRC_URI = "\
-- 
1.7.10.4



