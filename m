Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8996C109
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:37:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77780089"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 13:37:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0710241B7076
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 13:29:57 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 13:37:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 13:38:13 +0800
Message-ID: <20191101053813.7568-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0710241B7076.A9BEC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pybind11: upgrade 2.2.3 -> 2.4.3
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
X-List-Received-Date: Fri, 01 Nov 2019 05:37:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pybind11.inc       | 4 ++--
 .../{python-pybind11_2.2.3.bb => python-pybind11_2.4.3.bb}    | 0
 .../{python3-pybind11_2.2.3.bb => python3-pybind11_2.4.3.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_2.2.3.bb => python-pybind11_2.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.2.3.bb => python3-pybind11_2.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index 1722875ab..d1d53e125 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -3,5 +3,5 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "5b9611041e4ea66b2b919239e3bacd65"
-SRC_URI[sha256sum] = "87ff3ae777d9326349af5272974581270b2a0909b2392dc0cc57eb28ce23bcc3"
+SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
+SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.2.3.bb b/meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_2.2.3.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
-- 
2.20.1




