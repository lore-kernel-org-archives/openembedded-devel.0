Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB937CBDF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:59:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77394359"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 12:59:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F5244B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:51:58 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 12:59:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 13:00:06 +0800
Message-ID: <20191024050006.1066-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8F5244B6EC86.AAFB3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytun: upgrade 2.2.1 -> 2.3.0
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
X-List-Received-Date: Thu, 24 Oct 2019 04:59:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-connectivity/python-pytun/python-pytun.inc        | 4 ++--
 .../python-pytun/{python-pytun_2.2.1.bb => python-pytun_2.3.0.bb}     | 0
 .../python-pytun/{python3-pytun_2.2.1.bb => python3-pytun_2.3.0.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pytun/{python-pytun_2.2.1.bb => python-pytun_2.3.0.bb} (100%)
 rename meta-python/recipes-connectivity/python-pytun/{python3-pytun_2.2.1.bb => python3-pytun_2.3.0.bb} (100%)

diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
index 79a8bfb..3991a83 100644
--- a/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
+++ b/meta-python/recipes-connectivity/python-pytun/python-pytun.inc
@@ -2,8 +2,8 @@ SUMMARY = "Python TUN/TAP tunnel module"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13f7629e8e4989b66b4a913ab05a91de"
 
-SRC_URI[md5sum] = "5b35b1cf80a02cca7ec72eb95d6b0192"
-SRC_URI[sha256sum] = "07595dadf85f5176eb08c8d4d9ba5b862a180e96633f670f91437c47a1bead0d"
+SRC_URI[md5sum] = "adcaeea56d0ed06814487cdbde32d198"
+SRC_URI[sha256sum] = "5ead86b3391acef239535ebcabeb04d2cdc6b40ab14580d28c6da193c2d1fe53"
 
 PYPI_PACKAGE = "python-pytun"
 
diff --git a/meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-pytun/python-pytun_2.2.1.bb
rename to meta-python/recipes-connectivity/python-pytun/python-pytun_2.3.0.bb
diff --git a/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb b/meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
similarity index 100%
rename from meta-python/recipes-connectivity/python-pytun/python3-pytun_2.2.1.bb
rename to meta-python/recipes-connectivity/python-pytun/python3-pytun_2.3.0.bb
-- 
2.7.4




