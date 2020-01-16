Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BC13A7F889
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 09:19:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,325,1574092800"; d="scan'208";a="81968796"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 17:19:57 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BC72F49E9331
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 17:10:46 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 17:19:52 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 17:19:53 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 17:21:20 +0800
Message-ID: <20200116092120.22945-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BC72F49E9331.A95E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libsass: upgrade 3.6.1 -> 3.6.3
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
X-List-Received-Date: Thu, 16 Jan 2020 09:19:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/sass/{libsass_3.6.1.bb => libsass_3.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/sass/{libsass_3.6.1.bb => libsass_3.6.3.bb} (85%)

diff --git a/meta-oe/recipes-support/sass/libsass_3.6.1.bb b/meta-oe/recipes-support/sass/libsass_3.6.3.bb
similarity index 85%
rename from meta-oe/recipes-support/sass/libsass_3.6.1.bb
rename to meta-oe/recipes-support/sass/libsass_3.6.3.bb
index 480e984fc..d893be223 100644
--- a/meta-oe/recipes-support/sass/libsass_3.6.1.bb
+++ b/meta-oe/recipes-support/sass/libsass_3.6.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master"
-SRCREV = "4d229af5500be1023883c38c4a675f0ed919839d"
+SRCREV = "e1c16e09b4a953757a15149deaaf28a3fd81dc97"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1




