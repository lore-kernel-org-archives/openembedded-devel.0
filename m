Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 22D7A7F57B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 02:39:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,325,1566835200"; d="scan'208";a="77299427"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Oct 2019 10:39:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E8F664CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 10:31:17 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 22 Oct 2019 10:39:11 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Oct 2019 10:39:23 +0800
Message-ID: <20191022023923.16452-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E8F664CE14E4.AA415
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-automat: upgrade 0.7.0 -> 0.8.0
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
X-List-Received-Date: Tue, 22 Oct 2019 02:39:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-automat.inc                | 4 ++--
 .../python/{python-automat_0.7.0.bb => python-automat_0.8.0.bb}       | 0
 .../python/{python3-automat_0.7.0.bb => python3-automat_0.8.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-automat_0.7.0.bb => python-automat_0.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-automat_0.7.0.bb => python3-automat_0.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
index f6cbb35..ec39221 100644
--- a/meta-python/recipes-devtools/python/python-automat.inc
+++ b/meta-python/recipes-devtools/python/python-automat.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
 
-SRC_URI[md5sum] = "b72d5b7a83c2b1bd6e9ec3614a69f9ea"
-SRC_URI[sha256sum] = "cbd78b83fa2d81fe2a4d23d258e1661dd7493c9a50ee2f1a5b2cac61c1793b0e"
+SRC_URI[md5sum] = "47e980a48201a1dabe37fa11f0187013"
+SRC_URI[sha256sum] = "269a09dfb063a3b078983f4976d83f0a0d3e6e7aaf8e27d8df1095e09dc4a484"
 
 PYPI_PACKAGE = "Automat"
 
diff --git a/meta-python/recipes-devtools/python/python-automat_0.7.0.bb b/meta-python/recipes-devtools/python/python-automat_0.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-automat_0.7.0.bb
rename to meta-python/recipes-devtools/python/python-automat_0.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-automat_0.7.0.bb b/meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-automat_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-automat_0.8.0.bb
-- 
2.7.4




