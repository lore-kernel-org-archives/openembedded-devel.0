Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DEC2760B3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 05:17:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,566,1574092800"; d="scan'208";a="86522493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 13:17:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DCC3A49DF125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:07:09 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 13:17:14 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 13:17:13 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 13:19:39 +0800
Message-ID: <20200318051939.4133-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: DCC3A49DF125.AAA9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] vboxguestdrivers: upgrade 6.1.2 -> 6.1.4
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
X-List-Received-Date: Wed, 18 Mar 2020 05:17:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{vboxguestdrivers_6.1.2.bb => vboxguestdrivers_6.1.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.2.bb => vboxguestdrivers_6.1.4.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb
index 62c2b509f..1227e42ea 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "f4f42fd09857556b04b803fb99cc6905"
-SRC_URI[sha256sum] = "4326576e8428ea3626194fc82646347576e94c61f11d412a669fc8a10c2a1e67"
+SRC_URI[md5sum] = "b3ffc51c1f082743f22bfcb71b75a396"
+SRC_URI[sha256sum] = "59f8f5774473f593e3eb5940e2a337e0674bcd9854164b2578fd43f896260c99"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.20.1




