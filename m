Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAC87894E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026079"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9447748AE773
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:26 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:16 +0800
Message-ID: <1521603377-34881-11-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 9447748AE773.A55E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pip: 9.0.1 -> 9.0.2
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:26 -0000
Content-Type: text/plain

Upgrade python-pip from 9.0.1 to 9.0.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_9.0.1.bb => python-pip_9.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pip_9.0.1.bb
rename to meta-python/recipes-devtools/python/python-pip_9.0.2.bb
index 5ddd8d5..fa709a1 100644
--- a/meta-python/recipes-devtools/python/python-pip_9.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_9.0.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
-SRC_URI[md5sum] = "35f01da33009719497f01a4ba69d63c9"
-SRC_URI[sha256sum] = "09f243e1a7b461f654c26a725fa373211bb7ff17a9300058b205c61658ca940d"
+SRC_URI[md5sum] = "2fddd680422326b9d1fbf56112cf341d"
+SRC_URI[sha256sum] = "88110a224e9d30e5d76592a0b2130ef10e7e67a6426e8617bb918fffbfe91fe5"
 
 inherit pypi setuptools
 
-- 
2.7.4




