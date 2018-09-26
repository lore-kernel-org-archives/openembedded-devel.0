Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B9AFB6E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 00:42:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="45348053"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Sep 2018 08:42:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C6A24B6ED41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 08:42:27 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 26 Sep 2018 08:42:29 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Sep 2018 08:42:37 +0800
Message-ID: <20180926004237.28406-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
References: <20180926004237.28406-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 5C6A24B6ED41.AF5B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-cmd2: upgrade to 0.9.2
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
X-List-Received-Date: Wed, 26 Sep 2018 00:42:30 -0000
Content-Type: text/plain

1.Upgrade python-cmd2 from 0.8.8 to 0.9.2.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-cmd2_0.8.8.bb => python-cmd2_0.9.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cmd2_0.8.8.bb => python-cmd2_0.9.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
rename to meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
index b3bea82..1b75e34 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.9.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=60bc6842001870a418935bd84570b676"
 
-SRC_URI[md5sum] = "1f555bb656d361d9b0212b07e232752f"
-SRC_URI[sha256sum] = "b08bc5088fdd131d659354e6b4f8cf7c01a70566f68aed146e00d296a24b687b"
+SRC_URI[md5sum] = "bfe0900a2288283a40f0ee7533486a2f"
+SRC_URI[sha256sum] = "e7b6b4b76272a051c943c3c709cd760142af16fbc9218e0ed3c22b28ea38d0a8"
 
 inherit pypi setuptools
 
-- 
2.7.4




