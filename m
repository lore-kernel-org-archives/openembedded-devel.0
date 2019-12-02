Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AC7467F339
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 04:38:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,267,1571673600"; d="scan'208";a="79419733"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 12:38:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A35AD4CE20E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:29:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 12:38:32 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 03:07:22 -0800
Message-ID: <1575284842-97439-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575284842-97439-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A35AD4CE20E1.A8786
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH v2] python-simplejson: upgrade 3.16.0 -> 3.17.0
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
X-List-Received-Date: Mon, 02 Dec 2019 04:38:26 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
 .../{python-simplejson_3.16.0.bb => python-simplejson_3.17.0.bb}      | 0
 .../{python3-simplejson_3.16.0.bb => python3-simplejson_3.17.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-simplejson_3.16.0.bb => python-simplejson_3.17.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.16.0.bb => python3-simplejson_3.17.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 5592eaf..1a8d390 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "744fa99aed207478f8fbf9dd9f04fad3"
-SRC_URI[sha256sum] = "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
+SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
+SRC_URI[sha256sum] = "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-simplejson_3.16.0.bb
rename to meta-python/recipes-devtools/python/python-simplejson_3.17.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.16.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.16.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.0.bb
-- 
2.7.4




