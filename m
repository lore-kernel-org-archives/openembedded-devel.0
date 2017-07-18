Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C620177FA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 06:09:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6I69RTQ018847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 17 Jul 2017 23:09:27 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 23:09:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 18 Jul 2017 02:09:08 -0400
Message-ID: <c76c6dceeecd6ad94ef9305897cf9a9f66c516bd.1500357921.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500357921.git.hongxu.jia@windriver.com>
References: <cover.1500357921.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] python3-ordered-set: add recipe 2.0.2
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
X-List-Received-Date: Tue, 18 Jul 2017 06:09:26 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-ordered-set_2.0.2.bb       | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb b/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
new file mode 100644
index 0000000..be6d4e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_2.0.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A MutableSet that remembers its order, so that every entry has an index."
+HOMEPAGE = "http://github.com/LuminosoInsight/ordered-set"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=0feb0c85b722f488b87844fb5f81d2dc"
+
+SRC_URI[md5sum] = "7b8d73dc64fd3c783ecb48e050bfcc0d"
+SRC_URI[sha256sum] = "942cad5d7d5b0760d5cbe93dfb385ac2ed402ca1d48c9f4e102d7d5cce3a90eb"
+
+inherit pypi setuptools3
+
-- 
2.8.1


