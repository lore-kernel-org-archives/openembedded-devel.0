Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 689B965C5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 05:52:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18844189"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2017 13:51:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 02F3147E6358
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 13:51:54 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 15 May 2017 13:51:59 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 May 2017 13:51:34 +0800
Message-ID: <1494827494-19478-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 02F3147E6358.A4A9C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-xfce] [PATCH] imsettings: 1.7.1 -> 1.7.2
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
X-List-Received-Date: Mon, 15 May 2017 05:52:09 -0000
Content-Type: text/plain

Upgrade imsettings from 1.7.1 to 1.7.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../imsettings/{imsettings_1.7.1.bb => imsettings_1.7.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.7.1.bb => imsettings_1.7.2.bb} (88%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
similarity index 88%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
index e35e8b3..4b2ca49 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.7.2.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2
            file://gtk-is-required-by-notify.patch \
            file://multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch"
 
-SRC_URI[md5sum] = "ab439e21a7d86fa99fbc04586c755349"
-SRC_URI[sha256sum] = "12c35352386057ba68d69a0b7d9a1d0d01ebbd893aafe0a094c3158c8079ac9a"
+SRC_URI[md5sum] = "8153b0583a9f47d8a62af1f92fb9d3bf"
+SRC_URI[sha256sum] = "41addf0458f760212b6b6100835066e16deb3a8a50eb005a0fc17fbac0a2ae66"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-- 
2.7.4




