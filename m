Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 78DDA7FE22
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:10:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81538108"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 17:10:05 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3685B49E933F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 17:00:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 17:09:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 Jan 2020 17:10:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 05:16:09 -0800
Message-ID: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3685B49E933F.A39FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] gnuplot: upgrade 5.2.2 -> 5.2.8
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
X-List-Received-Date: Thu, 09 Jan 2020 09:10:05 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnuplot/{gnuplot_5.2.2.bb => gnuplot_5.2.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_5.2.2.bb => gnuplot_5.2.8.bb} (94%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
similarity index 94%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
index 898627bc1..926d8851d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.8.bb
@@ -22,8 +22,8 @@ SRC_URI_append_class-target = " \
     file://0004-Add-configure-option-to-find-qt5-native-tools.patch \
 "
 
-SRC_URI[archive.md5sum] = "60aedd08998160593199459dea8467fe"
-SRC_URI[archive.sha256sum] = "a416d22f02bdf3873ef82c5eb7f8e94146795811ef808e12b035ada88ef7b1a1"
+SRC_URI[archive.md5sum] = "2df8767c7399bee57a96296d46b4d5fb"
+SRC_URI[archive.sha256sum] = "60a6764ccf404a1668c140f11cc1f699290ab70daa1151bb58fed6139a28ac37"
 SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
 
-- 
2.17.1




