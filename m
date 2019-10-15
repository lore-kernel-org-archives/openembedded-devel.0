Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 523B57D075
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:01:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76984650"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 15:01:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 609494CE1504
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 15:01:40 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 15:01:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 15:01:58 +0800
Message-ID: <20191015070158.18855-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 609494CE1504.A4185
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.2.3 -> 19.3
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
X-List-Received-Date: Tue, 15 Oct 2019 07:01:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.2.3.bb => python-pip_19.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.2.3.bb => python-pip_19.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.2.3.bb b/meta-python/recipes-devtools/python/python-pip_19.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.2.3.bb
rename to meta-python/recipes-devtools/python/python-pip_19.3.bb
index 506a9e21c..2b5ee9e7e 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.2.3.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "f417444c66a0db1a82c8d9d2283a2f95"
-SRC_URI[sha256sum] = "e7a31f147974362e6c82d84b91c7f2bdf57e4d3163d3d454e6c3e71944d67135"
+SRC_URI[md5sum] = "a57da8b758cbf1a155cde6a7a4428ba7"
+SRC_URI[sha256sum] = "324d234b8f6124846b4e390df255cacbe09ce22791c3b714aa1ea6e44a4f2861"
 
 inherit pypi setuptools
 
-- 
2.20.1




