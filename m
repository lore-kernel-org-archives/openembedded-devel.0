Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DF03E7F7E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 09:14:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,229,1571673600"; d="scan'208";a="78913038"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 17:14:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F33054CE2810
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:06:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 17:14:25 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2019 08:20:23 -0800
Message-ID: <1574439623-29012-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: F33054CE2810.A55EE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libdev-checklib-perl: upgrade 1.13 -> 1.14
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
X-List-Received-Date: Fri, 22 Nov 2019 09:14:23 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libdev-checklib-perl_1.13.bb => libdev-checklib-perl_1.14.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libdev-checklib-perl_1.13.bb => libdev-checklib-perl_1.14.bb} (83%)

diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb
similarity index 83%
rename from meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb
rename to meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb
index f5bdb20..a96e3ad 100644
--- a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.14.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://README;md5=7911cdbb572d25c5f2e2ea17f669efc2"
 SRC_URI = "https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-${PV}.tar.gz \
            file://0001-CheckLib.pm-don-t-execute-the-binary.patch \
 "
-SRC_URI[md5sum] = "930216c5abc0f016df8a7539d48c891a"
-SRC_URI[sha256sum] = "24adfd908705dfac4bb320711763f37126b75cf54b3566c2c27c7cdef9c429a8"
+SRC_URI[md5sum] = "3519cbf9fe5ec3404449d5330ee5537f"
+SRC_URI[sha256sum] = "f21c5e299ad3ce0fdc0cb0f41378dca85a70e8d6c9a7599f0e56a957200ec294"
 
 S = "${WORKDIR}/Devel-CheckLib-${PV}"
 
-- 
2.7.4




