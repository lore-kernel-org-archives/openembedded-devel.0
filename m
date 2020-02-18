Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACCD615AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480868"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 959A950A9975
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:12:11 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:47 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:54 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:40:40 -0800
Message-ID: <1582033240-93392-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582033240-93392-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582033240-93392-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 959A950A9975.AFB94
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl][PATCH] libnet-dns-perl: upgrade 1.21 -> 1.22
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
X-List-Received-Date: Tue, 18 Feb 2020 06:21:50 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.21.bb => libnet-dns-perl_1.22.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.21.bb => libnet-dns-perl_1.22.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb
index 58b8eec66..621908b3a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "91e8593eb6eed41995e6edc567fb6fec"
-SRC_URI[sha256sum] = "ddefe13b28084ffcc8f10a96b3c13c59449dbf6fc371c006d129630ea0ce767a"
+SRC_URI[md5sum] = "f9b4f0b2613398d27434d94b456583ef"
+SRC_URI[sha256sum] = "03cd6a733e1cab6f817b4c4dcb7b29575002f8c543fb85e94c6290bc224d4c12"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1




