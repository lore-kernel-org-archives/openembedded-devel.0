Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 80DDD7F2EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 03:56:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,472,1559491200"; d="scan'208";a="74923511"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2019 11:56:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 90D0E4CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:56:52 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019 11:56:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Sep 2019 11:56:21 +0800
Message-ID: <20190906035621.16043-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 90D0E4CE14E4.A749B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.20 -> 1.21
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
X-List-Received-Date: Fri, 06 Sep 2019 03:56:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.20.bb => libnet-dns-perl_1.21.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.20.bb => libnet-dns-perl_1.21.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb
index c37b40d..58b8eec 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.20.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.21.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "565d3ae163591f3da7e1a20827b73c28"
-SRC_URI[sha256sum] = "7fd9692b687253baa8f2eb639f1dd7ff9c77fddd67167dc59b400bd25e4ce01b"
+SRC_URI[md5sum] = "91e8593eb6eed41995e6edc567fb6fec"
+SRC_URI[sha256sum] = "ddefe13b28084ffcc8f10a96b3c13c59449dbf6fc371c006d129630ea0ce767a"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.7.4




