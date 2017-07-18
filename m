Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBBA865D35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I69K6Y018844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 17 Jul 2017 23:09:20 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:05 -0400
Message-ID: <e33aa6278e4cf26dae22f1ced47401236674f47d.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] python3-coverage: add recipe 4.4.1
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:21 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb b/meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb
new file mode 100644
index 0000000..6aa5c59
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-coverage_4.4.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Code coverage measurement for Python"
+HOMEPAGE = "https://coverage.readthedocs.io"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI[md5sum] = "4c4d997cb32be4703f1fde54e6cd1b1c"
+SRC_URI[sha256sum] = "7a9c44400ee0f3b4546066e0710e1250fd75831adc02ab99dda176ad8726f424"
+
+inherit pypi setuptools3
+
-- 
2.8.1


