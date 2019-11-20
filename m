Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 165397F7C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:43:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,221,1571673600"; d="scan'208";a="78786090"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 16:43:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 57C404CE1BE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:35:31 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 16:43:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2019 16:44:14 +0800
Message-ID: <20191120084414.7023-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 57C404CE1BE8.A97F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyephem: upgrade 3.7.6.0 -> 3.7.7.0
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
X-List-Received-Date: Wed, 20 Nov 2019 08:43:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python-pyephem_3.7.6.0.bb => python-pyephem_3.7.7.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyephem/{python-pyephem_3.7.6.0.bb => python-pyephem_3.7.7.0.bb} (69%)

diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
similarity index 69%
rename from meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
rename to meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
index e28ce6ccc..422f0dbc4 100644
--- a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
 
-SRC_URI[md5sum] = "405a109f3017251ecd8c2890d850f649"
-SRC_URI[sha256sum] = "7a4c82b1def2893e02aec0394f108d24adb17bd7b0ca6f4bc78eb7120c0212ac"
+SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
+SRC_URI[sha256sum] = "607148429f85412915e32265779c0cf6d09f73aa97cf1ff0d101ac22c69c4436"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.20.1




