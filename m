Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C534B7FA2B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:07:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,248,1571673600"; d="scan'208";a="79143657"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2019 16:07:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 35F1B4CE1BF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 15:59:08 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 27 Nov 2019 16:07:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Nov 2019 16:08:17 +0800
Message-ID: <20191127080817.11442-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 35F1B4CE1BF2.AA302
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] links-x11: upgrade 2.16 -> 2.20.2
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
X-List-Received-Date: Wed, 27 Nov 2019 08:07:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../links/{links-x11_2.16.bb => links-x11_2.20.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/links/{links-x11_2.16.bb => links-x11_2.20.2.bb} (93%)

diff --git a/meta-oe/recipes-support/links/links-x11_2.16.bb b/meta-oe/recipes-support/links/links-x11_2.20.2.bb
similarity index 93%
rename from meta-oe/recipes-support/links/links-x11_2.16.bb
rename to meta-oe/recipes-support/links/links-x11_2.20.2.bb
index 90fa20084..645fe3b26 100644
--- a/meta-oe/recipes-support/links/links-x11_2.16.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.20.2.bb
@@ -47,7 +47,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
 }
 
-SRC_URI[md5sum] = "645fb0c0294e4c3268f94d307d394ffb"
-SRC_URI[sha256sum] = "82f03038d5e050a65681b9888762af41c40fd42dec7e59a8d630bfb0ee134a3f"
+SRC_URI[md5sum] = "ee39e612249440d0497535d0dafc3c0e"
+SRC_URI[sha256sum] = "4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424"
 SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
-- 
2.20.1




