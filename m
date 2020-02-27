Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 84E9561178
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:00:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484206"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 14:00:57 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D0AF0406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:51:07 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 14:00:51 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 14:01:00 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:15 -0800
Message-ID: <1582807398-13955-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D0AF0406AB15.A494F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] uftp: upgrade 4.10 -> 4.10.1
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
X-List-Received-Date: Thu, 27 Feb 2020 06:00:57 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/uftp/{uftp_4.10.bb => uftp_4.10.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.10.bb => uftp_4.10.1.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.10.bb b/meta-networking/recipes-support/uftp/uftp_4.10.1.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.10.bb
rename to meta-networking/recipes-support/uftp/uftp_4.10.1.bb
index 86c0c222c..a70fd4d08 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.10.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.10.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "df6407af3a0067b881431b3dad149ef3"
-SRC_URI[sha256sum] = "91ba8aae80c7c9ccaf04600b628cbeca4699ed48268fe43d2bf539a41083f292"
+SRC_URI[md5sum] = "a5c79c8e5a20d0646c9579fe1f339493"
+SRC_URI[sha256sum] = "903353febf1b88f701198d956a60cec3d2be3cc251561a678061761aec6622f6"
 
 DEPENDS = "openssl"
 
-- 
2.17.1




