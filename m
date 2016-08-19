Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D414065CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:59:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10080736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2016 17:59:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EAD9642CD10F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 17:59:21 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 19 Aug 2016 17:59:21 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 05:59:18 -0400
Message-ID: <1471600758-1620-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: EAD9642CD10F.A6AA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libqb: 0.17.1 -> 0.17.2
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
X-List-Received-Date: Fri, 19 Aug 2016 09:59:27 -0000
Content-Type: text/plain

Upgrade libqb from 0.17.1 to 0.17.2.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/libqb/{libqb_0.17.1.bb => libqb_0.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libqb/{libqb_0.17.1.bb => libqb_0.17.2.bb} (80%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
similarity index 80%
rename from meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
rename to meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
index 77307fe..40d06f3 100644
--- a/meta-oe/recipes-extended/libqb/libqb_0.17.1.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
@@ -11,8 +11,8 @@ inherit autotools pkgconfig
 SRC_URI = "https://fedorahosted.org/releases/q/u/quarterback/${BP}.tar.xz \
           "
 
-SRC_URI[md5sum] = "5770b343baa4528f6fec90120ec55048"
-SRC_URI[sha256sum] = "7a2115f83bfe20eaa5f2e4ed235e8f2994235d3b87e3e5ca41ba47b320f12e29"
+SRC_URI[md5sum] = "de1e5d38fa449b4d127940c10d117260"
+SRC_URI[sha256sum] = "9a419c649ed51f275dc780da8a15babb8a5d33633567bd9e0cb6193b6e21f4fe"
 
 LICENSE = "LGPL-2.1"
 
-- 
2.7.4




