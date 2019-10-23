Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1447F35E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 06:25:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,219,1569254400"; d="scan'208";a="77352367"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 14:25:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D6594CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:17:29 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 14:25:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Oct 2019 14:25:35 +0800
Message-ID: <20191023062535.26723-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3D6594CE1508.A5871
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pip: upgrade 19.3 -> 19.3.1
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
X-List-Received-Date: Wed, 23 Oct 2019 06:25:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-pip_19.3.bb => python-pip_19.3.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pip_19.3.bb => python-pip_19.3.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-pip_19.3.bb b/meta-python/recipes-devtools/python/python-pip_19.3.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-pip_19.3.bb
rename to meta-python/recipes-devtools/python/python-pip_19.3.1.bb
index 2b5ee9e..2827a12 100644
--- a/meta-python/recipes-devtools/python/python-pip_19.3.bb
+++ b/meta-python/recipes-devtools/python/python-pip_19.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pip.pypa.io/"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
-SRC_URI[md5sum] = "a57da8b758cbf1a155cde6a7a4428ba7"
-SRC_URI[sha256sum] = "324d234b8f6124846b4e390df255cacbe09ce22791c3b714aa1ea6e44a4f2861"
+SRC_URI[md5sum] = "1aaaf90fbafc50e7ba1e66ffceb00960"
+SRC_URI[sha256sum] = "21207d76c1031e517668898a6b46a9fb1501c7a4710ef5dfd6a40ad9e6757ea7"
 
 inherit pypi setuptools
 
-- 
2.7.4




