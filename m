Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EEA7776515
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 05:38:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99108500"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 13:42:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V5aiZ6023516
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 13:36:44 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 13:38:35 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 13:38:34 +0800
Message-ID: <1438321114-17568-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-python][PATCH] python-pytz: upgrade 2014.7->2015.4
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
X-List-Received-Date: Fri, 31 Jul 2015 05:38:37 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-pytz_2014.7.bb => python-pytz_2015.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2014.7.bb => python-pytz_2015.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pytz_2014.7.bb b/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pytz_2014.7.bb
rename to meta-python/recipes-devtools/python/python-pytz_2015.4.bb
index 92d0796..eb790f7 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2014.7.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
@@ -15,5 +15,5 @@ RDEPENDS_${PN} = "\
     python-datetime \
 "
 
-SRC_URI[md5sum] = "8940ddae309e44b593c75a9e05dd2a0b"
-SRC_URI[sha256sum] = "bfc2bd00147e5ecf75399f4a94cb84cc00ce9b511a15f9958bb6c85a455f76eb"
+SRC_URI[md5sum] = "417a47b1c432d90333e42084a605d3d8"
+SRC_URI[sha256sum] = "c4ee70cb407f9284517ac368f121cf0796a7134b961e53d9daf1aaae8f44fb90"
-- 
1.8.4.2


