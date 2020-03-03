Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC4C6160F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:28:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488831"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:28:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1958950A997D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:19:04 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:28:49 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:28:57 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:56 -0800
Message-ID: <1583236320-114088-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1958950A997D.A102B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libio-pty-perl: upgrade 1.12 -> 1.14
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
X-List-Received-Date: Tue, 03 Mar 2020 05:28:58 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../perl/{libio-pty-perl_1.12.bb => libio-pty-perl_1.14.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.12.bb => libio-pty-perl_1.14.bb} (73%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb
similarity index 73%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb
index b1a95e577..1ab21d1dc 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.12.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "11695a1a516b3bd1b90ce75ff0ce3e6d"
-SRC_URI[sha256sum] = "a2ef8770d3309178203f8c8ac25e623e63cf76e97830fd3be280ade1a555290d"
+SRC_URI[md5sum] = "70bcec4b1b19838ed209fb96a13f3e89"
+SRC_URI[sha256sum] = "51f3e4e311128bdb2c6a15f02c51376cb852ccf9df9bebe8dfbb5f9561eb95b5"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-- 
2.17.1




