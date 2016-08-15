Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2A377100
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 09:30:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9928153"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2016 17:30:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 47D2D42CD10F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:30:19 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 15 Aug 2016 17:30:22 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 04:45:46 -0400
Message-ID: <1471250746-1965-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 47D2D42CD10F.A5F32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dstat: 0.7.2 -> 0.7.3
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
X-List-Received-Date: Mon, 15 Aug 2016 09:30:29 -0000
Content-Type: text/plain

Upgrade dstat from 0.7.2 to 0.7.3.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/dstat/{dstat_0.7.2.bb => dstat_0.7.3.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/dstat/{dstat_0.7.2.bb => dstat_0.7.3.bb} (71%)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
similarity index 71%
rename from meta-oe/recipes-support/dstat/dstat_0.7.2.bb
rename to meta-oe/recipes-support/dstat/dstat_0.7.3.bb
index 63f1812..1e39aea 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
@@ -5,12 +5,10 @@ and flexibility. Dstat is handy for monitoring systems during performance tuning
 benchmarks or troubleshooting."
 HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/dagwieers/dstat.git"
-SRC_URI[md5sum] = "798e050e2e024f08a272dd4b0e1eba41"
-SRC_URI[sha256sum] = "96d1e6ea2434e477fa97322d92778f68458d7e57bc55bc4f72e29467a52cffd1"
 
-SRCREV = "5251397eb8d3b284a90bfdfaec0c8e1210146e3f"
+SRCREV = "ebace6d4177f8748f35cec87f7a49946046b0a20"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




