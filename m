Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 093847F7C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:32:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78785424"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 16:32:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8D7974CE1C07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:24:07 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 16:32:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 16:32:55 +0800
Message-ID: <20191120083255.4812-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 8D7974CE1C07.A90B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-meh: upgrade 0.47 -> 0.48
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
X-List-Received-Date: Wed, 20 Nov 2019 08:32:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python-meh/{python3-meh_0.47.bb => python3-meh_0.48.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.47.bb => python3-meh_0.48.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.47.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.47.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
index 95d6d183c..9ca7a56bd 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.47.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 "
-SRCREV = "78d868d99104317ce8820f39f61d207566e61a55"
+SRCREV = "760f78a634ecf0e2380abcbd751bc233d29300ef"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 FILES_${PN} += "${datadir}/*"
-- 
2.20.1




