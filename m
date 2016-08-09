Return-Path: <sven.ebenfeld@vaillant-group.com>
Received: from mailgw01.hp-net.de (mailgw01.hp-net.de [213.15.0.25])
	by mail.openembedded.org (Postfix) with ESMTP id 7432F77205
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailgw01.hp-net.de (Postfix) with ESMTP id BC50D229155
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:45:45 +0200 (CEST)
X-Virus-Scanned: Virusscanner at mailgw01
Received: from mailgw01.hp-net.de ([127.0.0.1])
	by localhost (mailgw01.hp-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-fQdqqW1PNj
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:45:45 +0200 (CEST)
Received: from jv-de-dc-fideas01.vaillant.vhgroup.lan
	(jv-de-dc-fideas01.vaillant.vhgroup.lan [10.107.7.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailgw01.hp-net.de (Postfix) with ESMTPS id AA94722905F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:45:45 +0200 (CEST)
Received: from vadeff07.vaillant.vhgroup.lan (unknown [10.107.77.149])
	by jv-de-dc-fideas01.vaillant.vhgroup.lan (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:45:45 +0200 (CEST)
Received: from ubuntu.vaillant.vhgroup.lan (10.107.185.224) by
	vadeff07.vaillant.vhgroup.lan (10.107.77.149) with Microsoft SMTP
	Server id 14.3.301.0; Tue, 9 Aug 2016 14:45:44 +0200
From: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Aug 2016 14:45:36 +0200
Message-ID: <1470746736-60315-1-git-send-email-sven.ebenfeld@vaillant-group.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OLX-Disclaimer: Done
Cc: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
Subject: [meta-oe][PATCH] libmicrohttpd: update 0.9.49 -> 0.9.50
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
X-List-Received-Date: Tue, 09 Aug 2016 12:45:45 -0000
Content-Type: text/plain

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
---
 .../{libmicrohttpd_0.9.49.bb => libmicrohttpd_0.9.50.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.49.bb => libmicrohttpd_0.9.50.bb} (85%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
similarity index 85%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
index 9abb200..421b78e 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.50.bb
@@ -6,8 +6,8 @@ SECTION = "net"
 DEPENDS = "libgcrypt gnutls file"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3209aa2ac6199b874a6325342b86edbc"
-SRC_URI[sha256sum] = "9407d8252548ab97ace3276e0032f073820073c0599d43baff832902a8dab11c"
+SRC_URI[md5sum] = "4a3f793d59f663a2b0fc62d44668fb66"
+SRC_URI[sha256sum] = "d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7"
 
 inherit autotools lib_package pkgconfig
 
-- 
1.9.1


