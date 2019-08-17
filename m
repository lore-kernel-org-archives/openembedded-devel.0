Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4097F317
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:58:26 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id BC8A1103755;
	Sat, 17 Aug 2019 21:58:27 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 23:58:07 +0200
Message-Id: <20190817215808.6585-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] telepathy-glib: Update to version 0.24.1
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
X-List-Received-Date: Sat, 17 Aug 2019 21:58:27 -0000
Content-Transfer-Encoding: 8bit

This is the latest upstream bugfix release.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../{telepathy-glib_0.24.0.bb => telepathy-glib_0.24.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/telepathy/{telepathy-glib_0.24.0.bb => telepathy-glib_0.24.1.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
rename to meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 01c6e3781..8bbfcc085 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -5,8 +5,8 @@ DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt
 LICENSE = "LGPLv2.1+"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "93c429e37750b25dcf8de86bb514664f"
-SRC_URI[sha256sum] = "ae0002134991217f42e503c43dea7817853afc18863b913744d51ffa029818cf"
+SRC_URI[md5sum] = "cbeb0a24acc26e7f095be281c324da69"
+SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7f7d5eb"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
2.21.0


