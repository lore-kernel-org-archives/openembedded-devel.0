Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD1074D0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:33:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42543814"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2018 17:33:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AA8844B66A2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 17:33:51 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 23 Jul 2018 17:33:50 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 17:33:26 +0800
Message-ID: <20180723093326.12122-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
References: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: AA8844B66A2B.ADA2E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-pbr:3.1.1 -> 4.1.0
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
X-List-Received-Date: Mon, 23 Jul 2018 09:33:58 -0000
Content-Type: text/plain

Upgrade python-pbr from 3.1.1 to 4.1.0.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../python/{python-pbr_3.1.1.bb => python-pbr_4.1.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_3.1.1.bb => python-pbr_4.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
rename to meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
index bdff867..32d0d2c 100644
--- a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
-SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
+SRC_URI[md5sum] = "b8d6e1b6064f9621fa6f87264aa99db9"
+SRC_URI[sha256sum] = "e0f23b61ec42473723b2fec2f33fb12558ff221ee551962f01dd4de9053c2055"
 
 inherit pypi setuptools
 
-- 
2.7.4




