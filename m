Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B537C7F888
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 05:37:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,224,1571673600"; d="scan'208";a="78830634"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Nov 2019 13:37:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7EEAB4CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:29:26 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 21 Nov 2019 13:37:43 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2019 13:38:19 +0800
Message-ID: <20191121053819.16920-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7EEAB4CE1A05.A9BBC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libextutils-cppguess-perl: upgrade 0.12 -> 0.20
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
X-List-Received-Date: Thu, 21 Nov 2019 05:37:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ppguess-perl_0.12.bb => libextutils-cppguess-perl_0.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.12.bb => libextutils-cppguess-perl_0.20.bb} (89%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb
similarity index 89%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb
index 99df6f33f..594899b07 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.20.bb
@@ -12,8 +12,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[md5sum] = "28be49072585b25df87e54180f741a4d"
-SRC_URI[sha256sum] = "31c47b5b15e3e9fd5ae7b35881a0fffd26a2983b241e7e3a1bc340d6d446186b"
+SRC_URI[md5sum] = "d6ddd5568c84f4c7b11b996b65f2ea3b"
+SRC_URI[sha256sum] = "12bf914708885265b5c3b0b8bfb0a9294cf132d5ca30d54bda0e00335fb43e61"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.20.1




