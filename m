Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2D879AE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 05:46:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81230118"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 13:46:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E31F9406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:37:50 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 13:46:45 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 13:46:44 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 13:47:58 +0800
Message-ID: <20200102054758.16051-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: E31F9406AB15.AA3F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pexpect: upgrade 4.6.0 -> 4.7.0
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
X-List-Received-Date: Thu, 02 Jan 2020 05:46:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pexpect.inc        | 4 ++--
 .../{python-pexpect_4.6.0.bb => python-pexpect_4.7.0.bb}      | 0
 .../{python3-pexpect_4.6.0.bb => python3-pexpect_4.7.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.6.0.bb => python-pexpect_4.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.6.0.bb => python3-pexpect_4.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index efeab8315..6d78eb94d 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRC_URI[md5sum] = "d4f3372965a996238d57d19b95d2e03a"
-SRC_URI[sha256sum] = "2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba"
+SRC_URI[md5sum] = "ed003242cbf308aee1b1eaecdef59e43"
+SRC_URI[sha256sum] = "9e2c1fd0e6ee3a49b28f95d4b33bc389c89b20af6a1255906e90ff1262ce62eb"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.6.0.bb b/meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.6.0.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.6.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.7.0.bb
-- 
2.20.1




