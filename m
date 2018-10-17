Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 727FD71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:42:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46233007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:42:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D49C74B6ED69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:42:18 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:42:19 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:42:32 +0800
Message-ID: <20181017004233.8130-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20181017004233.8130-1-hongl.fnst@cn.fujitsu.com>
References: <20181017004233.8130-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: D49C74B6ED69.A2B4F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] hwdata:0.315->0.316
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
X-List-Received-Date: Wed, 17 Oct 2018 00:42:19 -0000
Content-Type: text/plain

1.Upgrade hwdata from 0.315 to 0.316

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index a1c8ac7..8e8dbf5 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.315+git${SRCPV}"
-SRCREV = "1b8bae6352cf91d745d2205f91594e6cb8690ca8"
+PV = "0.316+git${SRCPV}"
+SRCREV = "803819aef862ded2ce0737cd3cf642c633b68c35"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




