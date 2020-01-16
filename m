Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1187F7E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 06:43:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,325,1574092800"; d="scan'208";a="81953212"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 14:43:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 19A6A4CE20F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 14:34:28 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 14:43:32 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 14:43:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 14:44:59 +0800
Message-ID: <20200116064459.31557-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 19A6A4CE20F0.A9B6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-perl] [PATCH] libencode-perl: upgrade 3.01 -> 3.02
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
X-List-Received-Date: Thu, 16 Jan 2020 06:43:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libencode-perl_3.01.bb => libencode-perl_3.02.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.01.bb => libencode-perl_3.02.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb
index be3a29683..b32bc023e 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.01.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.02.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "b0524ca1535ff6956cf1ff696616c94a"
-SRC_URI[sha256sum] = "d4555f570491648dbbd602bce7966672834b4c8f45acaa6757de474fca3a4d87"
+SRC_URI[md5sum] = "4eb07ba6db02d5b982316e1dd05f68bd"
+SRC_URI[sha256sum] = "5865be4951870f62f43722818d076d7724306c75c8f268346b282351cbc820a8"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.20.1




