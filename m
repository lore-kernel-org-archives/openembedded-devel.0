Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7897F2F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 07:04:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559491200"; d="scan'208";a="72735229"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 15:04:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1DB054CDFAB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:04:12 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:04:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 15:03:30 +0800
Message-ID: <20190802070330.22850-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 1DB054CDFAB7.AA2FA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest-runner: upgrade 4.2 -> 5.1
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
X-List-Received-Date: Fri, 02 Aug 2019 07:04:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest-runner.inc          | 4 ++--
 .../{python-pytest-runner_4.2.bb => python-pytest-runner_5.1.bb}      | 0
 .../{python3-pytest-runner_4.2.bb => python3-pytest-runner_5.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_4.2.bb => python-pytest-runner_5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_4.2.bb => python3-pytest-runner_5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index 3b057b0..113ab41 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -2,8 +2,8 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
 
-SRC_URI[md5sum] = "4b696b0f35767f0694f183d0a1855300"
-SRC_URI[sha256sum] = "d23f117be39919f00dd91bffeb4f15e031ec797501b717a245e377aee0f577be"
+SRC_URI[md5sum] = "a52d65bd3dbc88bed751cf934dc41db3"
+SRC_URI[sha256sum] = "25a013c8d84f0ca60bb01bd11913a3bcab420f601f0f236de4423074af656e7a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_4.2.bb b/meta-python/recipes-devtools/python/python-pytest-runner_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-runner_4.2.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_4.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.1.bb
-- 
2.7.4




