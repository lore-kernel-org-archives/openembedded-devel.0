Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B29BC7F35F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:00:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439169"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:00:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 99ACA4CE1C9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:51:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:00:03 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:28:11 -0800
Message-ID: <1575300494-101612-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 99ACA4CE1C9A.AB2B5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-thrift: upgrade 0.11.0 -> 0.13.0
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
X-List-Received-Date: Mon, 02 Dec 2019 09:00:05 -0000
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python-thrift_0.11.0.bb => python-thrift_0.13.0.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-connectivity/python-thrift/{python-thrift_0.11.0.bb => python-thrift_0.13.0.bb} (63%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
similarity index 63%
rename from meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
index 10cff42..2d51619 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.13.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e3641ae1a26cf5c12a3a71bd3030ab0e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e95cd2f17c70d3180a2b361332319fe0"
 
-SRC_URI[md5sum] = "36165d5c80e6b101dbe9fcf7ef524d51"
-SRC_URI[sha256sum] = "7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8806e6b"
+SRC_URI[md5sum] = "c3bc8d9a910d2c9ce26f2ad1f7c96762"
+SRC_URI[sha256sum] = "9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89"
 
 inherit pypi setuptools
 
-- 
2.7.4




