Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA29F606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 05:12:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,293,1559491200"; d="scan'208";a="71929148"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jul 2019 13:12:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 05B204CDDD5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 13:12:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 13:12:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Jul 2019 13:12:05 +0800
Message-ID: <20190722051205.16478-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 05B204CDDD5C.AC373
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] dstat: upgrade 0.7.3 -> 0.7.4
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
X-List-Received-Date: Mon, 22 Jul 2019 05:12:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/dstat/{dstat_0.7.3.bb => dstat_0.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dstat/{dstat_0.7.3.bb => dstat_0.7.4.bb} (93%)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
similarity index 93%
rename from meta-oe/recipes-support/dstat/dstat_0.7.3.bb
rename to meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index 18af738..8eb7157 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -11,7 +11,7 @@ DEPENDS += "asciidoc-native xmlto-native"
 
 SRC_URI = "git://github.com/dagwieers/dstat.git"
 
-SRCREV = "ebace6d4177f8748f35cec87f7a49946046b0a20"
+SRCREV = "6f5db0aed26bf8cf2700d4ffe90a9bd3436ac728"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




