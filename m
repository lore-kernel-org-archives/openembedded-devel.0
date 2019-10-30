Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2807FBBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:08:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,246,1569254400"; d="scan'208";a="77681437"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 17:08:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 8DC1D4CE1513
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 17:00:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 17:08:56 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 01:03:22 +0800
Message-ID: <1572455002-33492-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 8DC1D4CE1513.A6F57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] htpdate: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Wed, 30 Oct 2019 09:08:59 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/htpdate/{htpdate_1.2.1.bb => htpdate_1.2.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.2.1.bb => htpdate_1.2.2.bb} (90%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
similarity index 90%
rename from meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
index d4fd73e..d9d7268 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.2.1.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.2.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
            file://0001-Make-environment-variables-assignments-to-be-weak.patch \
            file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
            "
-SRC_URI[md5sum] = "cab01ddcb62bd84154670a37a7a0c31c"
-SRC_URI[sha256sum] = "186c69509ba68178e2894cb8900e240bb688870ec25de2ac4676724e1e1d1cbf"
+SRC_URI[md5sum] = "aad8c33933648532ac8716c809b15be1"
+SRC_URI[sha256sum] = "5f1f959877852abb3153fa407e8532161a7abe916aa635796ef93f8e4119f955"
 
 do_configure () {
 	:
-- 
2.7.4




