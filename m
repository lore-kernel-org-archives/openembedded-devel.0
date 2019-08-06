Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 68CBF7F316
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 02:54:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,352,1559491200"; d="scan'208";a="73035040"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2019 10:54:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E67AF4CDFAD2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:53:56 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 6 Aug 2019 10:53:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Aug 2019 10:53:14 +0800
Message-ID: <20190806025314.9315-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E67AF4CDFAD2.AAECC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe] [PATCHv2] itstool: upgrade 2.0.5 -> 2.0.6
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
X-List-Received-Date: Tue, 06 Aug 2019 02:54:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb} (78%)

diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
similarity index 78%
rename from meta-oe/recipes-support/itstool/itstool_2.0.5.bb
rename to meta-oe/recipes-support/itstool/itstool_2.0.6.bb
index 2e7e8f1..b4b37aa 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
@@ -9,8 +9,8 @@ DEPENDS = "libxml2-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Don-t-use-build-time-hardcoded-python-binary-path.patch"
-SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
-SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100d4b308"
+SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
+SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
 
 BBCLASSEXTEND = "native"
 
-- 
2.7.4




