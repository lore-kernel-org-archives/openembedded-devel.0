Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 536997F881
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 03:39:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78434416"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 11:39:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 123D14CE1646
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:31:34 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 11:39:46 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 11:40:17 +0800
Message-ID: <20191114034017.5025-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 123D14CE1646.A9F80
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytest-runner: upgrade 5.1 -> 5.2
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
X-List-Received-Date: Thu, 14 Nov 2019 03:39:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytest-runner.inc  | 4 ++--
 ...ython-pytest-runner_5.1.bb => python-pytest-runner_5.2.bb} | 0
 ...hon3-pytest-runner_5.1.bb => python3-pytest-runner_5.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_5.1.bb => python-pytest-runner_5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_5.1.bb => python3-pytest-runner_5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index 113ab41f5..0b443b3d6 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -2,8 +2,8 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
 
-SRC_URI[md5sum] = "a52d65bd3dbc88bed751cf934dc41db3"
-SRC_URI[sha256sum] = "25a013c8d84f0ca60bb01bd11913a3bcab420f601f0f236de4423074af656e7a"
+SRC_URI[md5sum] = "e5f66b8e8e87f62c59631c35c919d321"
+SRC_URI[sha256sum] = "96c7e73ead7b93e388c5d614770d2bae6526efd997757d3543fe17b557a0942b"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_5.1.bb b/meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-runner_5.1.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_5.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_5.2.bb
-- 
2.20.1




