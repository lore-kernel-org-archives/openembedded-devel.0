Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B4CE5762B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 15:13:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10847059"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2016 23:13:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 578BA404240C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 23:13:12 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sun, 11 Sep 2016 23:13:12 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Sep 2016 11:13:05 -0400
Message-ID: <1473606785-1681-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 578BA404240C.A45BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pyyaml: 3.11 -> 3.12
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
X-List-Received-Date: Sun, 11 Sep 2016 15:13:12 -0000
Content-Type: text/plain

Upgrade python-pyyaml from 3.11 to 3.12.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../python/{python-pyyaml_3.11.bb => python-pyyaml_3.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_3.11.bb => python-pyyaml_3.12.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.11.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-pyyaml_3.11.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
index a017e0e..61b1d2c 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.11.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://pyyaml.org/download/pyyaml/PyYAML-${PV}.tar.gz \
            file://setup.py \
 "
 
-SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
-SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
+SRC_URI[md5sum] = "4c129761b661d181ebf7ff4eb2d79950"
+SRC_URI[sha256sum] = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
 
 S = "${WORKDIR}/PyYAML-${PV}"
 
-- 
2.7.4




