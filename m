Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5313C60AF4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 01:49:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,565,1574092800"; d="scan'208";a="86504530"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 09:49:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 97FCC50A9984
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:39:33 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 09:49:37 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 09:49:47 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 00:19:50 -0700
Message-ID: <1584515992-22564-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 97FCC50A9984.A49C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] irssi: upgrade 1.1.2 -> 1.2.2
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
X-List-Received-Date: Wed, 18 Mar 2020 01:49:40 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../irssi/{irssi_1.1.2.bb => irssi_1.2.2.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.1.2.bb => irssi_1.2.2.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
index cd797e093..da5403e5c 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.1.2.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "271d2fd875cddd34526234d8a766d82c"
-SRC_URI[sha256sum] = "5ccc2b89a394e91bea0aa83a951c3b1d471c76da87b4169ec435530a31bf9732"
+SRC_URI[md5sum] = "8547f89e014e23e1bbbb665bcf7e2f70"
+SRC_URI[sha256sum] = "6727060c918568ba2ff4295ad736128dba0b995d7b20491bca11f593bd857578"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.17.1




