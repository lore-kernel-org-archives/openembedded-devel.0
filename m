Return-Path: <jose.bollo@iot.bzh>
X-Greylist: delayed 362 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Mar 2016 11:05:24 UTC
Received: from mx1a.lautre.net (mx1a.lautre.net [80.67.160.71])
	by mail.openembedded.org (Postfix) with ESMTP id 170AC606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 11:05:24 +0000 (UTC)
Received: from jobol.la-dameblanche.fr (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229]) (Authenticated sender: jobol@nonadev.net)
	by mx1a.lautre.net (Postfix) with ESMTPA id 2A81641324;
	Mon, 21 Mar 2016 11:59:21 +0100 (CET)
From: jose.bollo@iot.bzh
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 11:59:19 +0100
Message-Id: <1458557959-10500-1-git-send-email-jose.bollo@iot.bzh>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libmicrohttp: update to version 0.9.48
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
X-List-Received-Date: Mon, 21 Mar 2016 11:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 .../{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.48.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.48.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
index e3c833b..6e7ad26 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
@@ -6,8 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
-SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
+SRC_URI[md5sum] = "9c298c890088a91fe0d7ac3fec9d0097"
+SRC_URI[sha256sum] = "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143af0320c47cdf8a2a4"
 
 inherit autotools lib_package
 
-- 
2.1.4


