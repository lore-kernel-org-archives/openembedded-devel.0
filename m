Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5D34E60630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 06:38:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,563,1574092800"; d="scan'208";a="86451892"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 14:38:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 045CF50A998D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 14:28:17 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 14:38:20 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 14:38:27 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 05:11:58 -0700
Message-ID: <1584447118-6255-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 045CF50A998D.A8098
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] spice-protocol: upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Tue, 17 Mar 2020 06:38:23 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-networking/recipes-support/spice/spice-protocol_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb b/meta-networking/recipes-support/spice/spice-protocol_git.bb
index 966ca41c9..1d56bea17 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
@@ -13,9 +13,9 @@ architectures."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
 
-PV = "0.14.0+git${SRCPV}"
+PV = "0.14.1+git${SRCPV}"
 
-SRCREV = "f72ece993aeaf23f77e2845562b20e5563e52ba0"
+SRCREV = "e0ec178a72aa33e307ee5ac02b63bf336da921a5"
 
 SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice-protocol \
-- 
2.17.1




