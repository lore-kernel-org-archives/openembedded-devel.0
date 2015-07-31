Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2527876502
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:41:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99108592"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 13:45:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V5e5mT023680
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:40:05 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 13:41:57 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 13:41:56 +0800
Message-ID: <1438321316-17660-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-python][PATCH] python-pyparsing: upgrade 2.0.1->2.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 05:42:01 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-pyparsing_2.0.1.bb => python-pyparsing_2.0.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.0.1.bb => python-pyparsing_2.0.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
index 06d6d40..ab4d584 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
@@ -10,8 +10,8 @@ SRCNAME = "pyparsing"
 
 SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
 
-SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
-SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
+SRC_URI[md5sum] = "0a5ec41bb650aed802751a311b5d820d"
+SRC_URI[sha256sum] = "43d7710fdaa194a3bccf3127d06dec8e2de99a7efe6c47f01d4b748a1d04b192"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


