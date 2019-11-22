Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A07077FC91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 03:31:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,228,1571673600"; d="scan'208";a="78893557"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Nov 2019 11:31:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C93D04CE1BE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:22:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 22 Nov 2019 11:31:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Nov 2019 02:37:58 -0800
Message-ID: <1574419079-23378-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C93D04CE1BE8.AAD00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] hwdata: upgrade 0.328 -> 0.329
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
X-List-Received-Date: Fri, 22 Nov 2019 03:31:13 -0000
Content-Type: text/plain

---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index cd21950..a847946 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.328"
-SRCREV = "9f3125deb78a2e275b1285f935235d34ceda641d"
+PV = "0.329"
+SRCREV = "3b93b226177b6a8d219fa5edee2a417758cf74db"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




