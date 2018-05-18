Return-Path: <prvs=669850acc=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id DC6D674BBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 08:10:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,413,1520895600"; 
   d="scan'208";a="1449443"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 May 2018 10:10:11 +0200
Message-ID: <20180518081011.15815-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH] libmicrohttpd: update to version 0.9.59
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
X-List-Received-Date: Fri, 18 May 2018 08:10:37 -0000
Content-Type: text/plain

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../{libmicrohttpd_0.9.55.bb => libmicrohttpd_0.9.59.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.55.bb => libmicrohttpd_0.9.59.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
index 0930a277b..adbf831dd 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.55.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.59.bb
@@ -6,8 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "1c20f84a8b9cf692dd50b558b3571a3a"
-SRC_URI[sha256sum] = "0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8"
+SRC_URI[md5sum] = "8ab5123535549195aff19e91b4e49f48"
+SRC_URI[sha256sum] = "9b9ccd7d0b11b0e179f1f58dc2caa3e0c62c8609e1e1dc7dcaadf941b67d923c"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.11.0


