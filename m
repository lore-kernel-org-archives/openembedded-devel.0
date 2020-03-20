Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 945066080C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 01:42:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,573,1580745600"; d="scan'208";a="86638159"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 09:42:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E8BCB4CE34C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 09:32:45 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 09:42:52 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 20 Mar 2020 09:42:54 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2020 00:05:58 -0700
Message-ID: <1584687958-63336-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E8BCB4CE34C9.A79F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] civetweb: upgrade 1.11 -> 1.12
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
X-List-Received-Date: Fri, 20 Mar 2020 01:42:58 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/civetweb/civetweb_git.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index 71368c1a1..2820f9fa6 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -2,10 +2,10 @@ SUMMARY = "Civetweb embedded web server"
 HOMEPAGE = "https://github.com/civetweb/civetweb"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f28fdcba0dda735eed62bac6a397562"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=50bd1d7f135b50d7e218996ba28d0d88"
 
-SRCREV = "6423faea4800f6cd4055750a7af2da85cdbe4e96"
-PV = "1.11+git${SRCPV}"
+SRCREV = "4b440a339979852d5a51fb11a822952712231c23"
+PV = "1.12+git${SRCPV}"
 SRC_URI = "git://github.com/civetweb/civetweb.git \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
-- 
2.17.1




