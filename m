Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E82367FC10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 03:40:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78041408"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 11:40:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 543754CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 11:32:10 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 11:40:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 11:40:46 +0800
Message-ID: <20191108034046.26820-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 543754CE1646.A6A6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-flask-restful: upgrade 0.3.6 -> 0.3.7
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
X-List-Received-Date: Fri, 08 Nov 2019 03:40:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-flask-restful.inc  | 4 ++--
 ...n-flask-restful_0.3.6.bb => python-flask-restful_0.3.7.bb} | 0
 ...-flask-restful_0.3.6.bb => python3-flask-restful_0.3.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-restful_0.3.6.bb => python-flask-restful_0.3.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-restful_0.3.6.bb => python3-flask-restful_0.3.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-restful.inc b/meta-python/recipes-devtools/python/python-flask-restful.inc
index 0485f85aa..dcbcd0d76 100644
--- a/meta-python/recipes-devtools/python/python-flask-restful.inc
+++ b/meta-python/recipes-devtools/python/python-flask-restful.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/flask-restful/flask-restful"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=685bb55ed99a366bb431995f5eef2783"
 
-SRC_URI[md5sum] = "8243ca101185b130d8fa529cbdbdbddd"
-SRC_URI[sha256sum] = "5795519501347e108c436b693ff9a4d7b373a3ac9069627d64e4001c05dd3407"
+SRC_URI[md5sum] = "a7217ef1159be38af5faf61aa09aabef"
+SRC_URI[sha256sum] = "f8240ec12349afe8df1db168ea7c336c4e5b0271a36982bff7394f93275f2ca9"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb b/meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-restful_0.3.6.bb
rename to meta-python/recipes-devtools/python/python-flask-restful_0.3.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb b/meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-restful_0.3.6.bb
rename to meta-python/recipes-devtools/python/python3-flask-restful_0.3.7.bb
-- 
2.20.1




